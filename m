Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33B2866C4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3636.10462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE0o-0006Ua-JB; Wed, 07 Oct 2020 18:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3636.10462; Wed, 07 Oct 2020 18:18:02 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE0o-0006UF-Fn; Wed, 07 Oct 2020 18:18:02 +0000
Received: by outflank-mailman (input) for mailman id 3636;
 Wed, 07 Oct 2020 18:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE0n-0006UA-1W
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:01 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8577cf09-0530-4663-b220-aa83a686d198;
 Wed, 07 Oct 2020 18:17:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk9-0007CF-Ot; Wed, 07 Oct 2020 19:00:49 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE0n-0006UA-1W
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:01 +0000
X-Inumbo-ID: 8577cf09-0530-4663-b220-aa83a686d198
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8577cf09-0530-4663-b220-aa83a686d198;
	Wed, 07 Oct 2020 18:17:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk9-0007CF-Ot; Wed, 07 Oct 2020 19:00:49 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 66/82] host lifecycle: Machinery, db, for tracking relevant events
Date: Wed,  7 Oct 2020 19:00:08 +0100
Message-Id: <20201007180024.7932-67-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

When we reuse test hosts, we want to be able to give a list of the
other jobs which might be responsible for any problem.

In principle it would be possible to do this by digging into the
db's history tables like sg-report-host-history does, but this is
quite slow and also I don't have enough confidence in that approach to
use it for this application.

So instead, track the host lifecycle explicitly.

The approach taken is a hybrid one.  I first considered two and a half
approaches:

 1. Permanently record all host/share allocations and share state
    changes in a host history table.  But it is nontrivial to update
    all the allocation machinery to keep this table up to date.  It is
    also nontrivial to extract the necessary information from such a
    table: the allocation information would have to be correlated,
    using timestamps, with the steps table.  That's slow and complex.
    We had such a table but it was never used for these reasons;
    I dropped that empty table recently.

 1b. Like 1 but explicitly put a lifecycle sequence number in the
    allocations table,.  This would make it easy to find relevant
    events but would involve even more complicated logic during
    allocation.

 2. Record the host's lifecycle information in a file on the host.
    This means it gets wiped whenever the host does and makes finding
    the relevant jobs easy: read the file during logs capture, and
    we'll find everything of relevance.  It then has to be permanently
    stored somewhere it can be used for logging and archaeology: a
    per-job runvar giving the relevant host history, up to the point
    where that job finished. does that job nicely.  However, this
    has a serious problem: if the host crashes hard, we may not be
    able to recover the complete information about why!  We really
    want to the information recorded outside the host in question.

So I've taken a hybrid approach: effectively replicate the per-host
file from (2), but put the information in the database.  This
necessites a call to clear the host lifecycle history, which we make
at the *end* of the host install.  As a bonus this might let us more
easily identify if there are particular jobs that leave hosts in
states that are hard to recover from, and it will make total host
failure quite obvious because the host install log report will have a
list of the failed attempts (longer in each successive job).

For build jobs we only record the setup job, and concurrent jobs, in
the runvar.  This does not seem to have been a problem so far, and
this avoids having to do work on other allocations (eg, mg-allocate).
It also avoids having very long lists of previous builds listed in
every build job.

Test jobs are only shared within a flight and with much more limited
scope so the same considerations don't arise.  But by the same token,
we also do not need to adjust mg-allocate etc., since the user ought
not to allocate shares of test hosts unless they know what they are
doing.

In this commit we introduce:
 * The database table
 * The runvar syntax
 * The function for recording the lifecycle events

We have what amounts to an ad-hoc compression scheme for the
information in the lifecycle runvars.  Otherwise this data might get
quite voluminous, which can makes various other db queries slow.

There isn't a very good way to represent out-of-job tasks in the
lifecycle runvar.  We could maybe put in something from the tasks
table, but the entry in the tasks table might be gone by now and that
would involve quoting (and it might be quite large).

But this will only matter when a shared/reused host has been manually
messed with, and recording the task is sufficient to
 (1) note the fact of such interference
 (2) if the task is static, or still going when the job reports,
      can actually be put in the report.
 (3) failing that provide something which could be grepped for in logs

We do not call the recording function yet, so the db update is merely
Preparatory.

There is a bug in this patch: the calculation of $olive is wrong.
This will be fixed in a moment.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/JobDB/Executive.pm  | 211 ++++++++++++++++++++++++++++++++++++
 Osstest/JobDB/Standalone.pm |   2 +
 Osstest/TestSupport.pm      |  12 ++
 schema/host-lifecycle.sql   |  43 ++++++++
 4 files changed, 268 insertions(+)
 create mode 100644 schema/host-lifecycle.sql

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 8fde2934..cf82b4cf 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -24,6 +24,7 @@ use Osstest;
 use Osstest::TestSupport;
 use Osstest::Executive;
 use Data::Dumper;
+use Carp;
 
 BEGIN {
     use Exporter ();
@@ -461,4 +462,214 @@ sub jobdb_db_glob ($$) { #method
 
 sub can_anoint ($) { return 1; }
 
+sub jobdb_host_update_lifecycle_info ($$$) { #method
+    my ($mo, $ho, $mode) = @_;
+    # $mode is       sigil
+    #  selectprep  1  @     called several times, from selecthost, $isprep
+    #  wiped       2  n/a   called (usually) once, when install succeeds
+    #  select      1  +     called several times, from selecthost, !$isprep
+    #  final       1  none  called (hopefully) once, from capture-logs
+    #                        (once means within this job)
+    # Notes:
+    #   1   causes a new row to be added to the host lifecycle
+    #       subject to sigil check
+    #   2   removes other rows from the host lifecycle
+    #
+    # Where "sigil" above is nonempty: we look at the runvar.  If the
+    # runvar's final sigil is the same, we conclude that the needed
+    # work has already been done: ie, we do not need to add a row to
+    # the table nor do we necessarily need to update the runvar.
+    #
+    # If the sigil is not right, we replace the runvar with a history
+    # string derived from the lifecycle table, and (if appropriate)
+    # add a row.
+    #
+    # In principle it might be useful to update the runvar every time
+    # because the lifecycle table might have gained rows from other
+    # jobs, but we would like to avoid burdening select with more
+    # pratting about.  So we leave that for capture-logs and
+    # reuse/final, ie when newsigil is none.
+    #
+    # The runvar is
+    #     <ident>_lifecycle
+    # and contains space-separated entries
+    #     [+@][<flight>.][<job>]:<stepno>[,<ident>]
+    #     [+@]<stepno>              same flight, job, ident; new stepno
+    #     "["<omitted-count>"]"     ie literal [ ]
+    #     [+]?<taskid>              task not within a flight/job
+    # where omitted [,<ident>] means "host";
+    # omitted <flight> and <job> mean this runvar's flight and/or job;
+    # and then at then end most one of the sigils
+    #     @                      last call was selectprep
+    #     +                      last call was select
+    #     <none>                 last call was final
+    # items with no such sigil don't appear in build jobs
+    # and instead appear as [<omitted-count>] eg "[4]"
+
+    return if $ho->{Host}; # This host *has* a host - ie, nested
+
+    my $ttaskid = findtask();
+    my $hostname = $ho->{Name};
+    my $tident = $ho->{Ident};
+    my $tstepno = $mo->current_stepno();
+
+    if ($mode eq 'wiped') {
+	db_retry($flight, [qw(running)], $dbh_tests,[], sub {
+            $dbh_tests->do(<<END, {}, $hostname);
+                DELETE FROM host_lifecycle h
+                      WHERE hostname=?
+                        AND NOT EXISTS(
+                SELECT 1
+		  FROM tasks t
+		 WHERE t.live
+		   AND t.taskid = h.taskid
+                );
+END
+        });
+	logm("host lifecycle: $hostname: wiped, cleared out old info");
+	return;
+    }
+
+    my $newsigil =
+      $mode eq 'selectprep' ? '@' :
+      $mode eq 'select'     ? '+' :
+      $mode eq 'final'      ? ''  :
+      confess "$mode ?";
+
+    my $scanq = $dbh_tests->prepare(<<END);
+	   SELECT h.flight, h.job, h.isprep, h.ident, h.stepno,
+                  t.live, t.taskid,
+                  h2.lcseq later_notprep
+	     FROM host_lifecycle h
+        LEFT JOIN host_lifecycle h2
+               ON h2.hostname = h.hostname 
+              AND h2.flight   = h.flight
+              AND h2.job      = h.job
+              AND h2.ident    = h.ident
+              AND h2.taskid   = h.taskid
+              AND h2.lcseq    > h.lcseq
+              AND h.isprep AND NOT h2.isprep
+        LEFT JOIN tasks t
+               ON h.taskid = t.taskid
+            WHERE h.hostname = ?
+         ORDER BY h.lcseq;
+END
+    my $insertq = $dbh_tests->prepare(<<END);
+        INSERT INTO host_lifecycle
+                 (hostname, taskid, flight, job, isprep, ident, stepno)
+          VALUES (?,        ?,      ?,      ?,   ?,      ?,     ?     )
+END
+
+    my $ojvn = "$ho->{Ident}_lifecycle";
+    my $firstrun;
+
+    if (length $r{$ojvn}) {
+	my ($oldsigil,) = reverse split / /, $r{$ojvn};
+	$oldsigil = '' unless $oldsigil =~ m/^\W$/;
+	return if $newsigil ne '' && $oldsigil eq $newsigil;
+    } else {
+	$firstrun = 1;
+    }
+
+    my @lifecycle;
+    db_retry($dbh_tests,[], sub {
+	my $elided;
+	@lifecycle = ();
+        my %tj_seen;
+	# keys in %tj_seen are [@][<flight>.][<job>] or ?<taskid>
+        $scanq->execute($hostname);
+
+	while (my $o = $scanq->fetchrow_hashref()) {
+	    my $olive =
+	      # Any job which appeared since we started thinking
+	      # about this must have been concurrent with us,
+	      # even if it is dead now.
+	      (!$firstrun || $o->{live}) &&
+	      # If this task is still live, we need to have something
+	      # with a live mark, generally all the prep will have
+	      # occurred already, so we don't mark the prep as live
+	      # if there's a later nonprep step.
+	      !$o->{later_notprep};
+
+	    my $olivemark = !!$olive && '+';
+	    if (defined($flight) && defined($o->{flight}) &&
+		$o->{flight} eq $flight &&
+		$o->{job} eq $job) {
+		# Don't put the + mark on our own entries.
+		$olivemark = '';
+	    }
+
+	    my $oisprepmark = !!$o->{isprep} && '@';
+	    my $omarks = $olivemark.$oisprepmark;
+
+	    my $otj = '';
+	    if (!defined $o->{flight}) {
+		$otj .= "?$o->{taskid}";
+	    } else {
+		$otj .= "$o->{flight}." if $o->{flight} ne $flight;
+		$otj .= $o->{job} if $o->{job} ne $job;
+	    }
+	    next if $tj_seen{$oisprepmark.$otj}++;
+
+	    if (!$omarks && !$olive && defined($o->{flight}) &&
+		$ho->{Shared} &&
+		$ho->{Shared}{Type} =~ m/^build-/ &&
+		!$tj_seen{"\@$otj"} # do not elide use if we showed prep
+	       ) {
+		# elide previous, non-concurrent, build jobs
+		if (!$elided) { $elided = [ scalar(@lifecycle), 0]; }
+		$lifecycle[$elided->[0]] = "[".(++$elided->[1])."]";
+		next;
+	    }
+
+	    my $osuffix = !!(defined($o->{ident}) && $o->{ident} ne 'host')
+	      && ",$o->{ident}";
+
+	    my ($lastuncompr,) = grep { !m{^\W*\d+$} } reverse @lifecycle;
+	    if (defined($lastuncompr) &&
+		$lastuncompr =~ m{^\W*\Q$otj\E:\d+\Q$osuffix\E$}) {
+		push @lifecycle, "$omarks$o->{stepno}";
+	    } else {
+		push @lifecycle, "$omarks$otj:$o->{stepno}$osuffix";
+	    }
+	}
+	if (defined $flight) {
+	    $insertq->execute($hostname, $ttaskid,
+			      $flight, $job,
+			      ($mode eq 'selectprep')+0,
+                # ^ DBD::Pg doesn't accept perl canonical false for bool!
+                #   https://rt.cpan.org/Public/Bug/Display.html?id=133229
+			      $tident, $tstepno);
+	} else {
+	    $insertq->execute($hostname, $ttaskid,
+			      undef,undef,
+			      undef,
+			      undef,undef);
+	}
+    });
+
+    if (defined $flight) {
+	push @lifecycle, $newsigil if length $newsigil;
+	store_runvar($ojvn, "@lifecycle");
+    }
+}
+
+sub current_stepno ($) { #method
+    my ($jd) = @_;
+    my $testid = $ENV{OSSTEST_TESTID} // return undef;
+    my $checkq = $dbh_tests->prepare(<<END);
+        SELECT stepno
+          FROM steps
+         WHERE flight=?
+           AND job=?
+           AND testid=?
+END
+    my $stepno;
+    db_retry($flight,[qw(running)], $dbh_tests,[],sub {
+	$checkq->execute($flight,$job,$testid);
+	($stepno) = $checkq->fetchrow_array();
+    });
+    return $stepno;
+}
+
 1;
diff --git a/Osstest/JobDB/Standalone.pm b/Osstest/JobDB/Standalone.pm
index 1db4dc78..6e1ae158 100644
--- a/Osstest/JobDB/Standalone.pm
+++ b/Osstest/JobDB/Standalone.pm
@@ -137,4 +137,6 @@ sub jobdb_db_glob ($) { #method
 
 sub can_anoint ($) { return 0; }
 
+sub jobdb_host_update_lifecycle_info { } #method
+
 1;
diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 28381f05..22141981 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -88,6 +88,7 @@ BEGIN {
                       serial_fetch_logs set_host_property modify_host_flag
                       propname_massage propname_check
                       hostprop_putative_record hostflag_putative_record
+                      host_update_lifecycle_info
          
                       get_stashed open_unique_stashfile compress_stashed
                       dir_identify_vcs
@@ -174,6 +175,7 @@ our @accessible_runvar_pats =
       host_console                   *_host_console
       host_hostflagadjust            *_host_hostflagadjust
       host_hostflags                 *_host_hostflags
+      host_lifecycle                 *_host_lifecycle
       host_linux_boot_append         *_host_linux_boot_append
       host_ip                        *_host_ip
       host_power_install             *_host_power_install
@@ -3166,6 +3168,16 @@ sub sha256file ($;$) {
     return $truncate ? substr($digest, 0, $truncate) : $digest;
 }
 
+sub host_update_lifecycle_info ($$) {
+    my ($ho, $mode) = @_;
+    # $mode is
+    #  selectprep       called several times, from selecthost, $isprep
+    #  wiped            called once, when install succeeds
+    #  select           called several times, from selecthost, !$isprep
+    #  final            called hopefully once, from capture-logs
+    $mjobdb->jobdb_host_update_lifecycle_info($ho, $mode)
+}
+
 sub host_shared_mark_ready($$;$$) {
     my ($ho,$sharetype, $oldstate, $newstate) = @_;
 
diff --git a/schema/host-lifecycle.sql b/schema/host-lifecycle.sql
new file mode 100644
index 00000000..7f1f5bb0
--- /dev/null
+++ b/schema/host-lifecycle.sql
@@ -0,0 +1,43 @@
+-- ##OSSTEST## 012 Preparatory
+--
+-- Records the jobs which have touched a host, for host sharing/reuse
+-- The information here is ephemeral - it is cleared when a host is
+-- reinitialised.  The information is persisted by being copied
+-- into a runvar for each job.
+
+CREATE SEQUENCE host_lifecycle_lcseq_seq
+    NO CYCLE;
+
+CREATE TABLE host_lifecycle (
+    hostname     TEXT NOT NULL,
+    lcseq        INTEGER NOT NULL DEFAULT nextval('host_lifecycle_lcseq_seq'),
+    taskid       INTEGER NOT NULL, -- no constraint, tasks can get deleted
+    flight       INTEGER,
+    job          TEXT,
+    stepno       INTEGER,
+    ident        TEXT,
+    isprep       BOOLEAN,
+    PRIMARY KEY  (hostname, lcseq),
+--  restype      TEXT GENERATED ALWAYS AS ('host'),
+--  FOREIGN KEY  (restype,hostname)    REFERENCES resources(restype, resname),
+--     ^ those two omitted because not supported until pgsql 13
+--  FOREIGN KEY (flight, job)         REFERENCES jobs(flight, job),
+--      ^ omitted because the next constraint implies it
+    FOREIGN KEY  (flight, job, stepno) REFERENCES steps(flight, job, stepno),
+    CHECK ((
+	flight       IS NOT NULL AND
+	job          IS NOT NULL AND
+	stepno       IS NOT NULL AND
+	ident        IS NOT NULL AND
+	isprep       IS NOT NULL
+    ) OR (
+	flight       IS     NULL AND
+	job          IS     NULL AND
+	stepno       IS     NULL AND
+	ident        IS     NULL AND
+	isprep       IS     NULL
+    ))
+);
+
+ALTER SEQUENCE host_lifecycle_lcseq_seq
+    OWNED BY host_lifecycle.lcseq;
-- 
2.20.1


