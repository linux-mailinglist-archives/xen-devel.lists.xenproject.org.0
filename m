Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66B53AB74
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 18:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340585.565691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRh3-0001Bi-Kz; Wed, 01 Jun 2022 16:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340585.565691; Wed, 01 Jun 2022 16:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRh3-00019G-H5; Wed, 01 Jun 2022 16:59:37 +0000
Received: by outflank-mailman (input) for mailman id 340585;
 Wed, 01 Jun 2022 16:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPHY=WI=citrix.com=prvs=144c139f6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nwRh0-0000Xw-V5
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 16:59:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3519baf0-e1cc-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 18:59:32 +0200 (CEST)
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
X-Inumbo-ID: 3519baf0-e1cc-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654102772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WoBfmEao3DrJCNeVSjlgM3yjFCOP00okKErgLU5uy7I=;
  b=AYkU6r0jO3EA+mYR3hGMK0uv7pgVFrJ9sCZDMFNx0HxbVvIbtlXEoz6s
   QTgWcPYEZ9gTYj1JzrCXtMY2Ttjbq7gjejF6g1qPId+nJHVFajDdFtk0U
   md4zn9e/Cn0axz3zfCJG5U7DmlfcKO3+OidxK6qLTzj2sMVbOAfnCaMse
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72494147
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kdaoo6gzNzeu5lB46qQf42AJX161GBAKZh0ujC45NGQN5FlHY01je
 htvX2qEbPaOY2rxKIpyOt62oR8D75DcmoNiG1NupH83RSIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvU4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV91B6jNpr8waAhBGgBwMvFI27bee1Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmAzPUiZP0In1lE/S5IdxNnvhVfGLwJFrkyp/roQynHOw1kkuFTqGIWMIYHbLSlPpW6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWR22gSBRs+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm89W+LPCkrdkI5dDYNbAUKv9fAqZhpp0eaJjp8K5JZnuEZCBmpn
 W3W9HRh2e5D5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSfyN/UvPNzuUp1CIU3c+TPND6m8UzazSsIpKF/vEN9GPiZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8Qdas9w1iOdxrghnnDu7bcmik3yPjOvFDFbIGOhtDbd7Rr1ghE9yiF6No
 4g32grj40g3bdASlQGNrtBDdgBRdydlbX00wuQOHtO+zsNdMDlJI5fsLXkJIeSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:stiJ9ajJ1cONnIsbnYiNyk0MPHBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.91,269,1647316800"; 
   d="scan'208";a="72494147"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/4] build: replace get-fields.sh by a perl script
Date: Wed, 1 Jun 2022 17:59:08 +0100
Message-ID: <20220601165909.46588-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601165909.46588-1-anthony.perard@citrix.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The get-fields.sh which generate all the include/compat/.xlat/*.h
headers is quite slow. It takes for example nearly 3 seconds to
generate platform.h on a recent machine, or 2.3 seconds for memory.h.

Since it's only text processing, rewriting the mix of shell/sed/python
into a single perl script make the generation of those file a lot
faster.

I tried to keep a similar look for the code, to keep the code similar
between the shell and perl, and to ease review. So some code in perl
might look weird or could be written better.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile         |   6 +-
 xen/tools/compat-xlat-header | 539 +++++++++++++++++++++++++++++++++++
 xen/tools/get-fields.sh      | 528 ----------------------------------
 3 files changed, 541 insertions(+), 532 deletions(-)
 create mode 100755 xen/tools/compat-xlat-header
 delete mode 100644 xen/tools/get-fields.sh

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 6d9bcc19b0..b7e7148665 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -60,9 +60,7 @@ cmd_compat_c = \
 
 quiet_cmd_xlat_headers = GEN     $@
 cmd_xlat_headers = \
-    while read what name; do \
-        $(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
-    done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst >$@.new; \
+    $(PERL) $(srctree)/tools/compat-xlat-header $< $(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst > $@.new; \
     mv -f $@.new $@
 
 targets += $(headers-y)
@@ -80,7 +78,7 @@ $(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst $(srctree)/tools/compat-
 	$(call if_changed,compat_c)
 
 targets += $(patsubst compat/%, compat/.xlat/%, $(headers-y))
-$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh FORCE
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/compat-xlat-header FORCE
 	$(call if_changed,xlat_headers)
 
 quiet_cmd_xlat_lst = GEN     $@
diff --git a/xen/tools/compat-xlat-header b/xen/tools/compat-xlat-header
new file mode 100755
index 0000000000..f1f42a9dde
--- /dev/null
+++ b/xen/tools/compat-xlat-header
@@ -0,0 +1,539 @@
+#!/usr/bin/perl -w
+
+use strict;
+use warnings;
+
+open COMPAT_LIST, "<$ARGV[1]" or die "can't open $ARGV[1], $!";
+open HEADER, "<$ARGV[0]" or die "can't open $ARGV[0], $!";
+
+my @typedefs;
+
+my @header_tokens;
+while (<HEADER>) {
+    next if m/^\s*#.*/;
+    s/([\]\[,;:{}])/ $1 /g;
+    s/^\s+//;
+    push(@header_tokens, split(/\s+/));
+}
+
+sub get_fields {
+    my ($looking_for) = @_;
+    my $level = 1;
+    my $aggr = 0;
+    my ($name, @fields);
+
+    foreach (@header_tokens) {
+        if (/^(struct|union)$/) {
+            unless ($level != 1) {
+                $aggr = 1;
+                @fields = ();
+                $name = '';
+            }
+        } elsif ($_ eq '{') {
+            $level++;
+        } elsif ($_ eq '}') {
+            $level--;
+            if ($level == 1 and $name eq $looking_for) {
+                push (@fields, $_);
+                return @fields;
+            }
+        } elsif (/^[a-zA-Z_].*/) {
+            unless ($aggr == 0 or $name ne "") {
+                $name = $_;
+            }
+        }
+        unless ($aggr == 0) {
+            push (@fields, $_);
+        }
+    }
+    return ();
+}
+
+sub get_typedefs {
+    my $level = 1;
+    my $state = 0;
+    my @typedefs;
+    foreach (@_) {
+        if ($_ eq 'typedef') {
+            unless ($level != 1) {
+                $state = 1;
+            }
+        } elsif (m/^COMPAT_HANDLE\(.*\)$/) {
+            unless ($level != 1 or $state != 1) {
+                $state = 2;
+            }
+        } elsif (m/^[\[\{]$/) {
+            $level++;
+        } elsif (m/^[\]\}]$/) {
+            $level--;
+        } elsif ($_ eq ';') {
+            unless  ($level != 1) {
+                $state = 0;
+            }
+        } elsif (m/^[a-zA-Z_].*$/) {
+            unless ($level != 1 or $state != 2) {
+                push (@typedefs, $_);
+            }
+        }
+    }
+    return @typedefs;
+}
+
+sub build_enums {
+    my ($name, @tokens) = @_;
+
+    my $level = 1;
+    my $kind = '';
+    my $named = '';
+    my (@fields, @members, $id);
+
+    foreach (@tokens) {
+        if (m/^(struct|union)$/) {
+            unless ($level != 2) {
+                @fields = ('');
+            }
+            $kind="$_;$kind";
+        } elsif ($_ eq '{') {
+            $level++;
+        } elsif ($_ eq '}') {
+            $level--;
+            if ($level == 1) {
+                my $subkind = $kind;
+                $subkind =~ s/;.*//;
+                if ($subkind eq 'union') {
+                    print "\nenum XLAT_$name {\n";
+                    foreach (@members) {
+                        print "    XLAT_${name}_$_,\n";
+                    }
+                    print "};\n";
+                }
+                return;
+            } elsif ($level == 2) {
+                $named = '?';
+            }
+        } elsif (/^[a-zA-Z_].*$/) {
+            $id = $_;
+            my $k = $kind;
+            $k =~ s/.*?;//;
+            if ($named ne '' and $k ne '') {
+                shift @fields if @fields > 0 and $fields[0] eq '';
+                build_enums("${name}_$_", @fields);
+                $named = '!';
+            }
+        } elsif ($_ eq ',') {
+            unless ($level != 2) {
+                push (@members, $id);
+            }
+        } elsif ($_ eq ';') {
+            unless ($level != 2) {
+                push (@members, $id);
+            }
+            unless ($named eq '') {
+                $kind =~ s/.*?;//;
+            }
+            $named = '';
+        }
+        unless (@fields == 0) {
+            push (@fields, $_);
+        }
+    }
+}
+
+sub handle_field {
+    my ($prefix, $name, $id, $type, @fields) = @_;
+
+    if (@fields == 0) {
+        print " \\\n";
+        if ($type eq '') {
+            print "$prefix\(_d_)->$id = (_s_)->$id;"
+        } else {
+            my $k = $id;
+            $k =~ s/\./_/g;
+            print "${prefix}XLAT_${name}_HNDL_${k}(_d_, _s_);";
+        }
+    } elsif ("@fields" !~ m/[{}]/) {
+        my $tag = "@fields";
+        $tag =~ s/\s*(struct|union)\s+(compat_)?(\w+)\s.*/$3/;
+        print " \\\n";
+        print "${prefix}XLAT_$tag(&(_d_)->$id, &(_s_)->$id);"
+    } else {
+        my $func_id = $id;
+        my @func_tokens = @fields;
+        my $kind = '';
+        my $array = "";
+        my $level = 1;
+        my $arrlvl = 1;
+        my $array_type = '';
+        my $id = '';
+        my $type = '';
+        @fields = ();
+        foreach (@func_tokens) {
+            if (/^(struct|union)$/) {
+                unless ($level != 2) {
+                    @fields = ('');
+                }
+                if ($level == 1) {
+                    $kind = $_;
+                    if ($kind eq 'union') {
+                        my $tmp = $func_id;
+                        $tmp =~ s/\./_/g;
+                        print " \\\n";
+                        print  "${prefix}switch ($tmp) {"
+                    }
+                }
+            } elsif ($_ eq '{') {
+                $level++;
+                $id = '';
+            } elsif ($_ eq '}') {
+                $level--;
+                $id = '';
+                if ($level == 1 and $kind eq 'union') {
+                    print " \\\n";
+                    print "$prefix}"
+                }
+            } elsif ($_ eq '[') {
+                if ($level != 2 or $arrlvl != 1) {
+                    # skip
+                } elsif ($array eq '') {
+                    $array = ' ';
+                } else {
+                    $array = "$array;";
+                }
+                $arrlvl++;
+            } elsif ($_ eq ']') {
+                $arrlvl--;
+            } elsif (m/^COMPAT_HANDLE\((.*)\)$/) {
+                if ($level == 2 and $id eq '') {
+                    $type = $1;
+                    $type =~ s/^compat_//;
+                }
+            } elsif ($_ eq "compat_domain_handle_t") {
+                if ($level == 2 and $id eq '') {
+                    $array_type = $_;
+                }
+            } elsif (m/^[a-zA-Z_].*$/) {
+                if ($id eq '' and $type eq '' and $array_type eq '') {
+                    foreach $id (@typedefs) {
+                        unless ($id ne $_) {
+                            $type = $id;
+                        }
+                    }
+                    if ($type eq '') {
+                        $id = $_;
+                    } else {
+                        $id = '';
+                    }
+                } else {
+                    $id = $_;
+                }
+            } elsif (m/^[,;]$/) {
+                if ($level == 2 and $id !~ /^_pad\d*$/) {
+                    if ($kind eq 'union') {
+                        my $tmp = "$func_id.$id";
+                        $tmp =~ s/\./_/g;
+                        print " \\\n";
+                        print  "${prefix}case XLAT_${name}_$tmp:";
+                        shift @fields if @fields > 0 and $fields[0] eq '';
+                        handle_field("$prefix    ", $name,  "$func_id.$id", $type, @fields);
+                    } elsif ($array eq '' and $array_type eq '') {
+                        shift @fields if @fields > 0 and $fields[0] eq '';
+                        handle_field($prefix, $name, "$func_id.$id", $type, @fields);
+                    } elsif ($array eq '') {
+                        copy_array("    ", "$func_id.$id");
+                    } else {
+                        $array =~ s/^.*?;//;
+                        shift @fields if @fields > 0 and $fields[0] eq '';
+                        handle_array($prefix, $name, "$func_id.$id", $array, $type, @fields);
+                    }
+                    unless ($_ ne ';') {
+                        @fields = ();
+                        $id = '';
+                        $type = '';
+                    }
+                    $array = '';
+                    if ($kind eq 'union') {
+                        print " \\\n";
+                        print "$prefix    break;";
+                    }
+                }
+            } else {
+                if ($array ne '') {
+                    $array = "$array $_";
+                }
+            }
+            unless (@fields == 0) {
+                push (@fields, $_);
+            }
+        }
+    }
+}
+
+sub copy_array {
+    my ($prefix, $id) = @_;
+
+    print " \\\n";
+    print  "${prefix}if ((_d_)->$id != (_s_)->$id) \\\n";
+    print  "$prefix    memcpy((_d_)->$id, (_s_)->$id, sizeof((_d_)->$id));";
+}
+
+sub handle_array {
+    my ($prefix, $name, $id, $array, $type, @fields) = @_;
+
+    my $i = $array;
+    $i =~ s/[^;]//g;
+    $i = length($i);
+    $i = "i$i";
+
+    print " \\\n";
+    print "$prefix\{ \\\n";
+    print "$prefix    unsigned int $i; \\\n";
+    my $tmp = $array;
+    $tmp =~ s/;.*$//;
+    $tmp =~ s/^\s*(.*)\s*$/$1/;
+    print "$prefix    for ($i = 0; $i < $tmp; ++$i) {";
+    if ($array !~ m/^.*?;/) {
+        handle_field("$prefix        ", $name, "$id\[$i]", $type, @fields);
+    } else {
+        handle_array("$prefix        " ,$name, "$id\[$i]", $', $type, @fields);
+    }
+    print " \\\n";
+    print "$prefix    } \\\n";
+    print "$prefix\}";
+}
+
+sub build_body {
+    my ($name, @tokens) = @_;
+    my $level = 1;
+    my $id = '';
+    my $array = '';
+    my $arrlvl = 1;
+    my $array_type = '';
+    my $type = '';
+    my @fields;
+
+    printf "\n#define XLAT_$name(_d_, _s_) do {";
+
+    foreach (@tokens) {
+        if (/^(struct|union)$/) {
+            unless ($level != 2) {
+                @fields = ('');
+            }
+        } elsif ($_ eq '{') {
+            $level++;
+            $id = '';
+        } elsif ($_ eq '}') {
+            $level--;
+            $id = '';
+        } elsif ($_ eq '[') {
+            if ($level != 2 or $arrlvl != 1) {
+                # skip
+            } elsif ($array eq '') {
+                $array = ' ';
+            } else {
+                $array = "$array;";
+            }
+            $arrlvl++;
+        } elsif ($_ eq ']') {
+            $arrlvl--;
+        } elsif (m/^COMPAT_HANDLE\((.*)\)$/) {
+            if ($level == 2 and $id eq '') {
+                $type = $1;
+                $type =~ s/^compat_//;
+            }
+        } elsif ($_ eq "compat_domain_handle_t") {
+            if ($level == 2 and $id eq '') {
+                $array_type = $_;
+            }
+        } elsif (m/^[a-zA-Z_].*$/) {
+            if ($array ne '') {
+                $array = "$array $_";
+            } elsif ($id eq '' and $type eq '' and $array_type eq '') {
+                foreach $id (@typedefs) {
+                    unless ($id eq $_) {
+                        $type = $id;
+                    }
+                }
+                if ($type eq '') {
+                    $id = $_;
+                } else {
+                    $id = '';
+                }
+            } else {
+                $id = $_;
+            }
+        } elsif (m/^[,;]$/) {
+            if ($level == 2 and $id !~ /^_pad\d*$/) {
+                if ($array eq '' and $array_type eq '') {
+                    shift @fields if @fields > 0 and $fields[0] eq '';
+                    handle_field("    ", $name, $id, $type, @fields);
+                } elsif ($array eq '') {
+                    copy_array("    ", $id);
+                } else {
+                    my $tmp = $array;
+                    $tmp =~ s/^.*?;//;
+                    shift @fields if @fields > 0 and $fields[0] eq '';
+                    handle_array("    ", $name, $id, $tmp, $type, @fields);
+                }
+                unless ($_ ne ';') {
+                    @fields = ();
+                    $id = '';
+                    $type = '';
+                }
+                $array = '';
+            }
+        } else {
+            if ($array ne '') {
+                $array = "$array $_";
+            }
+        }
+        unless (@fields == 0) {
+            push (@fields, $_);
+        }
+    }
+    print " \\\n} while (0)\n";
+}
+
+sub check_field {
+    my ($kind, $name, $field, @extrafields) = @_;
+
+    if ("@extrafields" !~ m/[{}]/) {
+        print "; \\\n";
+        if (@extrafields != 0) {
+            foreach (@extrafields) {
+                if (m/^(struct|union)$/) {
+                    # skip
+                } elsif (m/^[a-zA-Z_].*/) {
+                    s/^xen_//;
+                    print "    CHECK_$_";
+                    last;
+                } else {
+                    die "Malformed compound declaration: '$_'";
+                }
+            }
+        } elsif ($field !~ m/\./) {
+            print "    CHECK_FIELD_($kind, $name, $field)";
+        } else {
+            my $n = $field =~ s/\./, /g;
+            print  "    CHECK_SUBFIELD_${n}_($kind, $name, $field)";
+        }
+    } else {
+        my $level = 1;
+        my @fields = ();
+        my $id = '';
+
+        foreach (@extrafields) {
+            if (m/^(struct|union)$/) {
+                unless ($level != 2) {
+                    @fields = ('');
+                }
+            } elsif ($_ eq '{') {
+                $level++;
+                $id = '';
+            } elsif ($_ eq '}') {
+                $level--;
+                $id = '';
+            } elsif (/^compat_.*_t$/) {
+                if ($level == 2) {
+                    @fields = ('');
+                    s/_t$//;
+                    s/^compat_//;
+                }
+            } elsif (/^evtchn_.*_compat_t$/) {
+                if ($level == 2 and $_ ne "evtchn_port_compat_t") {
+                    @fields = ('');
+                    s/_compat_t$//;
+                }
+            } elsif (/^[a-zA-Z_].*$/) {
+                $id = $_;
+            } elsif (/^[,;]$/) {
+                if ($level == 2 and $id !~ /^_pad\d*$/) {
+                    shift @fields if @fields > 0 and $fields[0] eq '';
+                    check_field($kind, $name, "$field.$id", @fields);
+                    unless ($_ ne ";") {
+                        @fields = ();
+                        $id = '';
+                    }
+                }
+            }
+            unless (@fields == 0) {
+                push (@fields, $_);
+            }
+        }
+    }
+}
+
+sub build_check {
+    my ($name, @tokens) = @_;
+    my $level = 1;
+    my (@fields, $kind, $id);
+    my $arrlvl = 1;
+
+    print "\n";
+    print "#define CHECK_$name \\\n";
+
+    foreach (@tokens) {
+        if (/^(struct|union)$/) {
+            if ($level == 1) {
+                $kind = $_;
+                print "    CHECK_SIZE_($kind, $name)";
+            } elsif ($level == 2) {
+                @fields = ('');
+            }
+        } elsif ($_ eq '{') {
+            $level++;
+            $id = '';
+        } elsif ($_ eq '}') {
+            $level--;
+            $id = '';
+        } elsif ($_ eq '[') {
+            $arrlvl++;
+        } elsif ($_ eq ']') {
+            $arrlvl--;
+        } elsif (/^compat_.*_t$/) {
+            if ($level == 2 and $_ ne "compat_argo_port_t") {
+                @fields = ('');
+                s/_t$//;
+                s/^compat_//;
+            }
+        } elsif (/^[a-zA-Z_].*$/) {
+            unless ($level != 2 or $arrlvl != 1) {
+                $id = $_;
+            }
+        } elsif (/^[,;]$/) {
+            if ($level == 2 and $id !~ /^_pad\d*$/) {
+                shift @fields if @fields > 0 and $fields[0] eq '';
+                check_field($kind, $name, $id, @fields);
+                unless ($_ ne ";") {
+                    @fields = ();
+                    $id = '';
+                }
+            }
+        }
+
+        unless (@fields == 0) {
+            push (@fields, $_);
+        }
+    }
+    print "\n";
+}
+
+@typedefs = get_typedefs(@header_tokens);
+
+while (<COMPAT_LIST>) {
+    my ($what, $name) = split(/\s+/, $_);
+    $name =~ s/^xen//;
+
+    my @fields = get_fields("compat_$name");
+    if (@fields == 0) {
+	die "Fields of 'compat_$name' not found in '$ARGV[1]'";
+    }
+
+    if ($what eq "!") {
+        build_enums($name, @fields);
+        build_body($name, @fields);
+    } elsif ($what eq "?") {
+        build_check($name, @fields);
+    } else {
+        die "Invalid translation indicator: '$what'";
+    }
+}
diff --git a/xen/tools/get-fields.sh b/xen/tools/get-fields.sh
deleted file mode 100644
index 002db2093f..0000000000
--- a/xen/tools/get-fields.sh
+++ /dev/null
@@ -1,528 +0,0 @@
-test -n "$1" -a -n "$2" -a -n "$3"
-set -ef
-
-SED=sed
-if test -x /usr/xpg4/bin/sed; then
-	SED=/usr/xpg4/bin/sed
-fi
-if test -z ${PYTHON}; then
-	PYTHON=`/usr/bin/env python`
-fi
-if test -z ${PYTHON}; then
-	echo "Python not found"
-	exit 1
-fi
-
-get_fields ()
-{
-	local level=1 aggr=0 name= fields=
-	for token in $2
-	do
-		case "$token" in
-		struct|union)
-			test $level != 1 || aggr=1 fields= name=
-			;;
-		"{")
-			level=$(expr $level + 1)
-			;;
-		"}")
-			level=$(expr $level - 1)
-			if [ $level = 1 -a $name = $1 ]
-			then
-				echo "$fields }"
-				return 0
-			fi
-			;;
-		[a-zA-Z_]*)
-			test $aggr = 0 -o -n "$name" || name="$token"
-			;;
-		esac
-		test $aggr = 0 || fields="$fields $token"
-	done
-}
-
-get_typedefs ()
-{
-	local level=1 state=
-	for token in $1
-	do
-		case "$token" in
-		typedef)
-			test $level != 1 || state=1
-			;;
-		COMPAT_HANDLE\(*\))
-			test $level != 1 -o "$state" != 1 || state=2
-			;;
-		[\{\[])
-			level=$(expr $level + 1)
-			;;
-		[\}\]])
-			level=$(expr $level - 1)
-			;;
-		";")
-			test $level != 1 || state=
-			;;
-		[a-zA-Z_]*)
-			test $level != 1 -o "$state" != 2 || echo "$token"
-			;;
-		esac
-	done
-}
-
-build_enums ()
-{
-	local level=1 kind= fields= members= named= id= token
-	for token in $2
-	do
-		case "$token" in
-		struct|union)
-			test $level != 2 || fields=" "
-			kind="$token;$kind"
-			;;
-		"{")
-			level=$(expr $level + 1)
-			;;
-		"}")
-			level=$(expr $level - 1)
-			if [ $level = 1 ]
-			then
-				if [ "${kind%%;*}" = union ]
-				then
-					echo
-					echo "enum XLAT_$1 {"
-					for m in $members
-					do
-						echo "    XLAT_${1}_$m,"
-					done
-					echo "};"
-				fi
-				return 0
-			elif [ $level = 2 ]
-			then
-				named='?'
-			fi
-			;;
-		[a-zA-Z]*)
-			id=$token
-			if [ -n "$named" -a -n "${kind#*;}" ]
-			then
-				build_enums ${1}_$token "$fields"
-				named='!'
-			fi
-			;;
-		",")
-			test $level != 2 || members="$members $id"
-			;;
-		";")
-			test $level != 2 || members="$members $id"
-			test -z "$named" || kind=${kind#*;}
-			named=
-			;;
-		esac
-		test -z "$fields" || fields="$fields $token"
-	done
-}
-
-handle_field ()
-{
-	if [ -z "$5" ]
-	then
-		echo " \\"
-		if [ -z "$4" ]
-		then
-			printf %s "$1(_d_)->$3 = (_s_)->$3;"
-		else
-			printf %s "$1XLAT_${2}_HNDL_$(echo $3 | $SED 's,\.,_,g')(_d_, _s_);"
-		fi
-	elif [ -z "$(echo "$5" | $SED 's,[^{}],,g')" ]
-	then
-		local tag=$(echo "$5" | ${PYTHON} -c '
-import re,sys
-for line in sys.stdin.readlines():
-    sys.stdout.write(re.subn(r"\s*(struct|union)\s+(compat_)?(\w+)\s.*", r"\3", line)[0].rstrip() + "\n")
-')
-		echo " \\"
-		printf %s "${1}XLAT_$tag(&(_d_)->$3, &(_s_)->$3);"
-	else
-		local level=1 kind= fields= id= array= arrlvl=1 array_type= type= token
-		for token in $5
-		do
-			case "$token" in
-			struct|union)
-				test $level != 2 || fields=" "
-				if [ $level = 1 ]
-				then
-					kind=$token
-					if [ $kind = union ]
-					then
-						echo " \\"
-						printf %s "${1}switch ($(echo $3 | $SED 's,\.,_,g')) {"
-					fi
-				fi
-				;;
-			"{")
-				level=$(expr $level + 1) id=
-				;;
-			"}")
-				level=$(expr $level - 1) id=
-				if [ $level = 1 -a $kind = union ]
-				then
-					echo " \\"
-					printf %s "$1}"
-				fi
-				;;
-			"[")
-				if [ $level != 2 -o $arrlvl != 1 ]
-				then
-					:
-				elif [ -z "$array" ]
-				then
-					array=" "
-				else
-					array="$array;"
-				fi
-				arrlvl=$(expr $arrlvl + 1)
-				;;
-			"]")
-				arrlvl=$(expr $arrlvl - 1)
-				;;
-			COMPAT_HANDLE\(*\))
-				if [ $level = 2 -a -z "$id" ]
-				then
-					type=${token#COMPAT_HANDLE?}
-					type=${type%?}
-					type=${type#compat_}
-				fi
-				;;
-			compat_domain_handle_t)
-				if [ $level = 2 -a -z "$id" ]
-				then
-					array_type=$token
-				fi
-				;;
-			[a-zA-Z]*)
-				if [ -z "$id" -a -z "$type" -a -z "$array_type" ]
-				then
-					for id in $typedefs
-					do
-						test $id != "$token" || type=$id
-					done
-					if [ -z "$type" ]
-					then
-						id=$token
-					else
-						id=
-					fi
-				else
-					id=$token
-				fi
-				;;
-			[\,\;])
-				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
-				then
-					if [ $kind = union ]
-					then
-						echo " \\"
-						printf %s "${1}case XLAT_${2}_$(echo $3.$id | $SED 's,\.,_,g'):"
-						handle_field "$1    " $2 $3.$id "$type" "$fields"
-					elif [ -z "$array" -a -z "$array_type" ]
-					then
-						handle_field "$1" $2 $3.$id "$type" "$fields"
-					elif [ -z "$array" ]
-					then
-						copy_array "    " $3.$id
-					else
-						handle_array "$1" $2 $3.$id "${array#*;}" "$type" "$fields"
-					fi
-					test "$token" != ";" || fields= id= type=
-					array=
-					if [ $kind = union ]
-					then
-						echo " \\"
-						printf %s "$1    break;"
-					fi
-				fi
-				;;
-			*)
-				if [ -n "$array" ]
-				then
-					array="$array $token"
-				fi
-				;;
-			esac
-			test -z "$fields" || fields="$fields $token"
-		done
-	fi
-}
-
-copy_array ()
-{
-	echo " \\"
-	echo "${1}if ((_d_)->$2 != (_s_)->$2) \\"
-	printf %s "$1    memcpy((_d_)->$2, (_s_)->$2, sizeof((_d_)->$2));"
-}
-
-handle_array ()
-{
-	local i="i$(echo $4 | $SED 's,[^;], ,g' | wc -w | $SED 's,[[:space:]]*,,g')"
-	echo " \\"
-	echo "$1{ \\"
-	echo "$1    unsigned int $i; \\"
-	printf %s "$1    for ($i = 0; $i < "${4%%;*}"; ++$i) {"
-	if [ "$4" = "${4#*;}" ]
-	then
-		handle_field "$1        " $2 $3[$i] "$5" "$6"
-	else
-		handle_array "$1        " $2 $3[$i] "${4#*;}" "$5" "$6"
-	fi
-	echo " \\"
-	echo "$1    } \\"
-	printf %s "$1}"
-}
-
-build_body ()
-{
-	echo
-	printf %s "#define XLAT_$1(_d_, _s_) do {"
-	local level=1 fields= id= array= arrlvl=1 array_type= type= token
-	for token in $2
-	do
-		case "$token" in
-		struct|union)
-			test $level != 2 || fields=" "
-			;;
-		"{")
-			level=$(expr $level + 1) id=
-			;;
-		"}")
-			level=$(expr $level - 1) id=
-			;;
-		"[")
-			if [ $level != 2 -o $arrlvl != 1 ]
-			then
-				:
-			elif [ -z "$array" ]
-			then
-				array=" "
-			else
-				array="$array;"
-			fi
-			arrlvl=$(expr $arrlvl + 1)
-			;;
-		"]")
-			arrlvl=$(expr $arrlvl - 1)
-			;;
-		COMPAT_HANDLE\(*\))
-			if [ $level = 2 -a -z "$id" ]
-			then
-				type=${token#COMPAT_HANDLE?}
-				type=${type%?}
-				type=${type#compat_}
-			fi
-			;;
-		compat_domain_handle_t)
-			if [ $level = 2 -a -z "$id" ]
-			then
-				array_type=$token
-			fi
-			;;
-		[a-zA-Z_]*)
-			if [ -n "$array" ]
-			then
-				array="$array $token"
-			elif [ -z "$id" -a -z "$type" -a -z "$array_type" ]
-			then
-				for id in $typedefs
-				do
-					test $id != "$token" || type=$id
-				done
-				if [ -z "$type" ]
-				then
-					id=$token
-				else
-					id=
-				fi
-			else
-				id=$token
-			fi
-			;;
-		[\,\;])
-			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
-			then
-				if [ -z "$array" -a -z "$array_type" ]
-				then
-					handle_field "    " $1 $id "$type" "$fields"
-				elif [ -z "$array" ]
-				then
-					copy_array "    " $id
-				else
-					handle_array "    " $1 $id "${array#*;}" "$type" "$fields"
-				fi
-				test "$token" != ";" || fields= id= type=
-				array=
-			fi
-			;;
-		*)
-			if [ -n "$array" ]
-			then
-				array="$array $token"
-			fi
-			;;
-		esac
-		test -z "$fields" || fields="$fields $token"
-	done
-	echo " \\"
-	echo "} while (0)"
-}
-
-check_field ()
-{
-	if [ -z "$(echo "$4" | $SED 's,[^{}],,g')" ]
-	then
-		echo "; \\"
-		local n=$(echo $3 | $SED 's,[^.], ,g' | wc -w | $SED 's,[[:space:]]*,,g')
-		if [ -n "$4" ]
-		then
-			for n in $4
-			do
-				case $n in
-				struct|union)
-					;;
-				[a-zA-Z_]*)
-					printf %s "    CHECK_${n#xen_}"
-					break
-					;;
-				*)
-					echo "Malformed compound declaration: '$n'" >&2
-					exit 1
-					;;
-				esac
-			done
-		elif [ $n = 0 ]
-		then
-			printf %s "    CHECK_FIELD_($1, $2, $3)"
-		else
-			printf %s "    CHECK_SUBFIELD_${n}_($1, $2, $(echo $3 | $SED 's!\.!, !g'))"
-		fi
-	else
-		local level=1 fields= id= token
-		for token in $4
-		do
-			case "$token" in
-			struct|union)
-				test $level != 2 || fields=" "
-				;;
-			"{")
-				level=$(expr $level + 1) id=
-				;;
-			"}")
-				level=$(expr $level - 1) id=
-				;;
-			compat_*_t)
-				if [ $level = 2 ]
-				then
-					fields=" "
-					token="${token%_t}"
-					token="${token#compat_}"
-				fi
-				;;
-			evtchn_*_compat_t)
-				if [ $level = 2 -a $token != evtchn_port_compat_t ]
-				then
-					fields=" "
-					token="${token%_compat_t}"
-				fi
-				;;
-			[a-zA-Z]*)
-				id=$token
-				;;
-			[\,\;])
-				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
-				then
-					check_field $1 $2 $3.$id "$fields"
-					test "$token" != ";" || fields= id=
-				fi
-				;;
-			esac
-			test -z "$fields" || fields="$fields $token"
-		done
-	fi
-}
-
-build_check ()
-{
-	echo
-	echo "#define CHECK_$1 \\"
-	local level=1 fields= kind= id= arrlvl=1 token
-	for token in $2
-	do
-		case "$token" in
-		struct|union)
-			if [ $level = 1 ]
-			then
-				kind=$token
-				printf %s "    CHECK_SIZE_($kind, $1)"
-			elif [ $level = 2 ]
-			then
-				fields=" "
-			fi
-			;;
-		"{")
-			level=$(expr $level + 1) id=
-			;;
-		"}")
-			level=$(expr $level - 1) id=
-			;;
-		"[")
-			arrlvl=$(expr $arrlvl + 1)
-			;;
-		"]")
-			arrlvl=$(expr $arrlvl - 1)
-			;;
-		compat_*_t)
-			if [ $level = 2 -a $token != compat_argo_port_t ]
-			then
-				fields=" "
-				token="${token%_t}"
-				token="${token#compat_}"
-			fi
-			;;
-		[a-zA-Z_]*)
-			test $level != 2 -o $arrlvl != 1 || id=$token
-			;;
-		[\,\;])
-			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
-			then
-				check_field $kind $1 $id "$fields"
-				test "$token" != ";" || fields= id=
-			fi
-			;;
-		esac
-		test -z "$fields" || fields="$fields $token"
-	done
-	echo ""
-}
-
-list="$($SED -e 's,^[[:space:]]#.*,,' -e 's!\([]\[,;:{}]\)! \1 !g' $3)"
-fields="$(get_fields $(echo $2 | $SED 's,^compat_xen,compat_,') "$list")"
-if [ -z "$fields" ]
-then
-	echo "Fields of '$2' not found in '$3'" >&2
-	exit 1
-fi
-name=${2#compat_}
-name=${name#xen}
-case "$1" in
-"!")
-	typedefs="$(get_typedefs "$list")"
-	build_enums $name "$fields"
-	build_body $name "$fields"
-	;;
-"?")
-	build_check $name "$fields"
-	;;
-*)
-	echo "Invalid translation indicator: '$1'" >&2
-	exit 1
-	;;
-esac
-- 
Anthony PERARD


