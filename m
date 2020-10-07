Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB292866CC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3645.10559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE1p-0007D5-5O; Wed, 07 Oct 2020 18:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3645.10559; Wed, 07 Oct 2020 18:19:05 +0000
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
	id 1kQE1p-0007CO-1x; Wed, 07 Oct 2020 18:19:05 +0000
Received: by outflank-mailman (input) for mailman id 3645;
 Wed, 07 Oct 2020 18:19:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE1n-00072Q-Fm
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:03 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 348605a2-3329-47c3-ae29-9223e6c5d1b0;
 Wed, 07 Oct 2020 18:18:58 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkB-0007CF-1O; Wed, 07 Oct 2020 19:00:51 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE1n-00072Q-Fm
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:03 +0000
X-Inumbo-ID: 348605a2-3329-47c3-ae29-9223e6c5d1b0
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 348605a2-3329-47c3-ae29-9223e6c5d1b0;
	Wed, 07 Oct 2020 18:18:58 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkB-0007CF-1O; Wed, 07 Oct 2020 19:00:51 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 72/82] resource reporting: Report host reuse/sharing in job report
Date: Wed,  7 Oct 2020 19:00:14 +0100
Message-Id: <20201007180024.7932-73-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Compatibility: in principle this might generate erroneous reports
which omit sharing/reuse information for allocations made by jobs
using older versions of osstest.

However, we do not share or reuse hosts across different osstest
versions, so this cannot occur.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 331 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 330 insertions(+), 1 deletion(-)

diff --git a/sg-report-flight b/sg-report-flight
index a1f424c5..0413a730 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -29,9 +29,10 @@ use POSIX;
 use IPC::Open2;
 use Data::Dumper;
 use File::Path;
+use Carp;
 
 use Osstest;
-use Osstest::Executive;
+use Osstest::Executive qw(:DEFAULT :colours);
 
 our $specflight;
 our %specver;
@@ -1122,6 +1123,68 @@ END
     return @failures;
 }
 
+# Machinery for generating WITH ... VALUES common table expressions.
+# Use it like this:
+#
+#    1. $some_accum = {}
+#
+#    2. valuestable_add_row($some_accum, $val, $val, $val)
+#          # ^ zero or more times
+#
+#    3. $qtxt = "WITH\n";
+#       @qparams = ();
+#       valuestable_with(\$qtxt, \@qparams, 'cte_name',
+#              qw(txtcol1 txtcol2 intcol::integer boolcol::bool ...));
+#
+# The resulting CTE table will have the name, and column names,
+# you specified.  For non-TEXT columns you must specify the type
+# because [Postgre]SQL's type inference doesn't work properly here.
+#
+# valuestable_with will always leave $qtxt ending with ",\n"
+# so you can call it multiple times.
+
+sub valuestable_add_row ($@) {
+    my ($accum, @row) = @_;
+    # $accum->{Ncols}
+    # $accum->{Params}[]
+    # $accum->{Qtxt}
+    $accum->{Ncols} //= scalar @row;
+    confess unless $accum->{Ncols} == @row;
+    push @{ $accum->{Params} }, @row;
+    $accum->{Qtxt} //= '';
+    $accum->{Qtxt} =~ s/.$/$&,/;
+    $accum->{Qtxt} .= "          (".join(',', ('?',) x @row).")\n";
+}
+sub valuestable_with ($$$@) {
+    my ($qtxtr, $paramsr, $ctename, $accum, @cols) = @_;
+    my $limit = '';
+    $accum->{Qtxt} //= do {
+	# Oh my god
+	# select * from (values );
+	# => ERROR:  syntax error at or near ")"
+	$limit = 'LIMIT 0';
+	"          (".join(',',
+			   map { m/::/ ? "NULL::$'" : "NULL" }
+			   @cols).")\n";
+    };
+    $accum->{Ncols} //= scalar @cols;
+    confess "$accum->{Ncols} != ".(scalar @cols)
+      unless $accum->{Ncols} == @cols;
+    my $cols = join(', ', @cols);
+    my $colsnotypes = join(', ', map { m/::/ ? $` : $_ } @cols);
+    $$qtxtr .= <<END;
+      $ctename ($colsnotypes) AS (SELECT
+            $cols FROM (VALUES
+$accum->{Qtxt}        $limit) $ctename ($colsnotypes)),
+
+END
+    push @$paramsr, @{ $accum->{Params} // [ ] };
+}
+
+sub nullcols {
+    join ", ", map { m/::/ ? "NULL::$' as $`" : "NULL as $_" } @_;
+}
+
 sub htmloutjob ($$) {
     my ($fi,$job) = @_;
     return unless defined $htmldir;
@@ -1213,6 +1276,272 @@ END
 <tr><td>Status:</td><td>$ji->{status}</td></tr>
 </table>
 <p>
+END
+
+    # ---------- resource reuse/sharing report ----------
+
+    # We translate the lifecycle runvars into a set of questions
+    # for the db.  But rather than doing one db query for each
+    # such question, we aggregate the questions into VALUES
+    # expressions and ask the db to produce a collated list of
+    # relevant information.  This has fewer round trips.
+
+    my $shareq_elided_accum = {};
+    my $shareq_tasks_accum = {};
+    my $shareq_main_accum = {};
+    foreach my $lc_var_row (@$runvar_table) {
+	next unless $lc_var_row->{name} =~ m{^(.*_?host)_lifecycle$};
+	my $tident = $1;
+	my $hostname = ($runvar_map{$tident} // next)->{val};
+	my $last_uncompr;
+	my $sort_index;
+	print DEBUG "SHARE LC $job $tident $lc_var_row->{val}\n";
+	foreach (split / /, $lc_var_row->{val}) {
+	    $sort_index++;
+	    if (m/^[\@\+]$/) {
+		valuestable_add_row $shareq_elided_accum,
+		  $tident, $hostname, undef, $&, $sort_index;
+		next;
+	    }
+	    if (m/^\[(\d+)\]$/) { # elided
+		valuestable_add_row $shareq_elided_accum,
+		  $tident, $hostname, $1, undef, $sort_index;
+		next;
+	    }
+	    my $olive = s/^\+//;
+	    if (m/^\?(\d+)$/) { # tasks
+		valuestable_add_row $shareq_tasks_accum,
+		  $tident, $hostname, $olive+0, $1, $sort_index;
+		next;
+	    }
+	    my $oisprep = s/^\@//;
+	    s{^\d+$}{ join ":$&", @$last_uncompr }e if $last_uncompr;
+	    if (my ($tprefix, $oflight, $ojob,
+		    $ostepno, $tsuffix, $oident) =
+		m{^((?:(\d+)\.)?([^:]+)?)\:(\d+)((?:,([^:]+))?)$}) {
+		# main
+		$last_uncompr = [ $tprefix, $tsuffix ];
+		$oflight ||= $specflight;
+		$ojob ||= $job;
+		$oident ||= 'host';
+		valuestable_add_row $shareq_main_accum,
+		  $tident, $hostname, $oflight, $ojob, $ostepno,
+		  $oisprep+0, $oident, $olive+0;
+		next;
+	    }
+	    confess "$tident $hostname $_ ?";
+	}
+    }
+    my @shareq_params;
+    my $shareq_txt = <<END;
+      WITH
+
+END
+
+    valuestable_with \$shareq_txt, \@shareq_params,
+      'q_elided', $shareq_elided_accum,
+      qw(tident hostname count::integer sigil sort_index::integer);
+
+    valuestable_with \$shareq_txt, \@shareq_params,
+      'q_tasks', $shareq_tasks_accum,
+      qw(tident hostname olive::bool taskid::integer sort_index::integer);
+
+    valuestable_with \$shareq_txt, \@shareq_params,
+      'q', $shareq_main_accum,
+      qw(tident hostname flight::integer job
+         stepno::integer oisprep::bool oident olive::bool);
+
+    # Helpers to reduce typing in the mapping from individual r_*
+    # table rows to the overall union (sum type) rows.
+    my $nullcols_main = nullcols(qw(
+        flight::integer job status oidents
+        started::integer rest_started::integer finished::integer
+    ));
+    my $nullcols_tasks = nullcols(qw(
+        taskid::integer type refkey username comment
+    ));
+    my $nullcols_elided = nullcols(qw(
+        elided::integer elided_sigil
+    ));
+
+    $shareq_txt .= <<END;
+      q2 AS
+      (SELECT q.*,
+	      (SELECT started
+		FROM steps s
+	       WHERE s.flight = q.flight
+		 AND s.job    = q.job 
+		 AND s.stepno = q.stepno
+		 AND oisprep)                    AS prep_started,
+	      (SELECT started
+		 FROM steps s
+		WHERE s.flight = q.flight
+		  AND s.job    = q.job
+		  AND s.stepno = q.stepno
+		  AND NOT oisprep)               AS rest_started,
+	      (SELECT max(finished)
+		 FROM steps s
+		WHERE s.flight = q.flight
+		  AND s.job    = q.job)          AS finished
+	FROM Q
+        ORDER BY q.tident),
+
+      r_main AS
+      (SELECT tident, hostname,
+              bool_or(olive)                     AS olive,
+              1                                  AS kind_sort,
+              flight, job,
+	      (SELECT status
+		 FROM jobs
+		WHERE jobs.flight = q2.flight
+		  AND jobs.job    = q2.job)      AS status,
+	      string_agg(DISTINCT oident,',')    AS oidents,
+	      min(prep_started)                  AS prep_started,
+	      min(rest_started)                  AS rest_started,
+	      max(finished)                      AS finished,
+	      $nullcols_tasks,
+	      $nullcols_elided,
+              NULL::integer                      AS sort_index
+	 FROM q2
+     GROUP BY tident, hostname, flight, job),
+
+      r_tasks AS
+      (SELECT tident, hostname, olive,
+              0                                  AS kind_sort,
+              $nullcols_main,
+              taskid, type, refkey, username, comment,
+              $nullcols_elided,
+              sort_index
+         FROM q_tasks NATURAL LEFT JOIN tasks),
+
+      r_elided AS
+      (SELECT tident, hostname, FALSE as olive,
+              2                                  AS kind_sort,
+              $nullcols_main,
+              $nullcols_tasks,
+              count                              AS elided,
+              sigil                              AS elided_sigil,
+              sort_index
+         FROM q_elided)
+
+-- The result row is effectively a sum type.  SQL doesn't have those.
+-- We just pile all the columns of the disjoint types together;
+-- some of them will be null for some variants.  The perl code can
+-- easily figure out which of the unioned CTEs a row came from.
+
+       SELECT * FROM r_main    UNION
+       SELECT * FROM r_tasks   UNION
+       SELECT * FROM r_elided
+     ORDER BY tident, hostname,
+	      kind_sort,
+	      finished, prep_started, rest_started, flight, job, oidents,
+	      sort_index
+END
+
+    print DEBUG "PREPARING SHAREQ\n";
+    my $shareq = db_prepare($shareq_txt);
+    print DEBUG Dumper(\@shareq_params);
+    $shareq->execute(@shareq_params);
+
+    my $share_any;
+    my $altcolour=1;
+    while (my $srow = $shareq->fetchrow_hashref()) {
+	print DEBUG "SHARE SROW ".Dumper($srow);
+	print H <<END if !$share_any++;
+<h2>Task(s) which might have affected this job's host(s)</h2>
+<p>
+<table rules="all"><tr>
+<th>role<br>(here)</td>
+<th>hostname</td>
+<th>rel.</td><!-- share reuse unknown -->
+<th>flight</td>
+<th>job</td>
+<th>role(s)<br>(there)</td>
+<th>install / prep.<br>started</td>
+<th>use</br>started</td>
+<th>last step<br>ended</td>
+<th>job<br>status</td>
+</tr>
+END
+	my $bgcolour = report_altcolour($altcolour ^= 1);
+	printf H <<END, $bgcolour, map { encode_entities $_ }
+<tr %s>
+<td align="center">%s</td>
+<td align="center"><a href="%s">%s</a></td>
+END
+	  $srow->{tident},
+	  "$c{ResultsHtmlPubBaseUrl}/host/$srow->{hostname}.html",
+	  $srow->{hostname};
+	my $rel = $srow->{olive} ?
+	  "<td align=\"center\" bgcolor=\"$red\">share</td>"
+	  : $srow->{prep_started} ?
+	  "<td align=\"center\" bgcolor=\"$purple\">prep.</td>"
+	  :
+	  "<td align=\"center\">reuse</td>";
+        if (defined $srow->{flight}) {
+	    my $furl = "$c{ReportHtmlPubBaseUrl}/$srow->{flight}/";
+	    my $jurl = "$furl/$srow->{job}/info.html";
+	    if ($srow->{flight} != $specflight) {
+		printf H <<END, $rel, map { encode_entities $_ }
+%s
+<td align="right"><a href="%s">%s</a></td>
+<td><a href="%s">%s</a></td>
+END
+		  $furl, $srow->{flight},
+		  $jurl, $srow->{job};
+	    } elsif ($srow->{job} ne $job) {
+		printf H <<END, $rel, map { encode_entities $_ }
+%s
+<td align="center">this</td>
+<td><a href="%s">%s</a></td>
+END
+		  $jurl, $srow->{job};
+	    } else {
+		printf H <<END;
+<td></td>
+<td align="center">this</td>
+<td align="center">this</td>
+END
+	    }
+	    printf H <<END,
+<td align="center">%s</td>
+<td>%s</td><td>%s</td><td>%s</td>
+END
+	      encode_entities($srow->{oidents}),
+	      map { $_ ? show_abs_time($_) : '' }
+	      $srow->{prep_started},
+	      $srow->{rest_started},
+	      !$srow->{olive} && $srow->{finished};
+	    my $info = report_run_getinfo($srow);
+	    print H <<END, 
+<td $info->{ColourAttr}>$info->{Content}</td>
+END
+	} elsif (defined $srow->{elided}) {
+	    printf H <<END, $srow->{elided};
+<td colspan="8" align="center">%d earlier job(s) elided</td>
+END
+	} elsif (defined $srow->{elided_sigil}) {
+	    printf H <<END;
+<td bgcolor="$yellow" colspan="8" align="center">
+this job incomplete, unknown number of other jobs elided
+</td>
+END
+	} elsif (defined $srow->{taskid}) {
+	    printf H <<END, $rel, map { encode_entities $_ }
+%s
+<td bgcolor="$yellow" colspan="7" align="center">?%s: %s</td>
+END
+	      $srow->{taskid},
+	      report_rogue_task_description($srow);
+	} else {
+	    confess Dumper($srow)." ?";
+	}
+	print H <<END;
+</tr>
+END
+    }
+    print H <<END if $share_any;
+</table>
 END
 
     print H <<END;
-- 
2.20.1


