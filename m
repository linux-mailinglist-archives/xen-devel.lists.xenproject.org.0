Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4984E3285FA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:02:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91803.173247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlwI-0006N3-J9; Mon, 01 Mar 2021 17:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91803.173247; Mon, 01 Mar 2021 17:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlwI-0006Mc-EK; Mon, 01 Mar 2021 17:02:34 +0000
Received: by outflank-mailman (input) for mailman id 91803;
 Mon, 01 Mar 2021 17:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGlv3-00066A-F5
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:01:17 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9325cab7-4829-4722-86cd-4cea12367b9f;
 Mon, 01 Mar 2021 17:01:15 +0000 (UTC)
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
X-Inumbo-ID: 9325cab7-4829-4722-86cd-4cea12367b9f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614618075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LgJyYPhmenBkPDcAThn79TvCAA3+QdlNK24z5O6FXqg=;
  b=W8C6cSOx7DwcJJXCMtwhIaKzpO01RhuSF2sGecVF1osTzhCtcpUnHJ5R
   aDarw2ag7kzuAKSC8Zdc24+jjla0srxXTZ7qLmz1CLE7drroALxMXEL5O
   1qZ15dL+OP5NuG+wJxKLMpGohYEOL6HqTZriEjzGdKvoMApccmBjJ32Zq
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qkN4It76dLBPp7Kw6/R5/uXC42dU5kCco1ClHTF9DE4dYebLuKebVWX5l/IFr0A0OIwLvq7Zfn
 ivVref4xJ8IEsMm1JyA2ddiN/4H3ZV8Xxqcbk3+oNBc+HYxYtwIQUiAiS7qfpRD/ntn0WlqAiI
 z7FTkWKgRRcDj8pruxCR2oqPARFLtVx8P0kvwpknPyKF4tBveCg6ksMlMCKaG9L+DA1jExKQou
 OH8DvdTqPkKAiqXHxdb35jka+siRTVa+xGBZNE4hPezCMcZiArJ7jtPqSrF9s8U2z8THg7h9kM
 prQ=
X-SBRS: 5.2
X-MesageID: 38450122
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38450122"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/3] tools/libs: Stash the 4.14 API/ABIs for the stable libraries
Date: Mon, 1 Mar 2021 17:00:43 +0000
Message-ID: <20210301170044.23295-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210301170044.23295-1-andrew.cooper3@citrix.com>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

These dumps were produced from the RELEASE-4.14.0 tag, with the abi-dumper
tooling backported from staging.

For each stable library, add a PKG_OLD_ABI variable pointing at the 4.14 ABI.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump   |  924 +++++++++++
 .../abi/libxendevicemodel.so.1.3-x86_64-abi.dump   | 1491 +++++++++++++++++
 tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump |  719 ++++++++
 .../abi/libxenforeignmemory.so.1.3-x86_64-abi.dump |  847 ++++++++++
 tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump | 1199 ++++++++++++++
 tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump  |  597 +++++++
 .../libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump  | 1711 ++++++++++++++++++++
 .../libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump |  239 +++
 .../libs/abi/libxentoollog.so.1.0-x86_64-abi.dump  |  882 ++++++++++
 tools/libs/call/Makefile                           |    2 +
 tools/libs/devicemodel/Makefile                    |    2 +
 tools/libs/evtchn/Makefile                         |    2 +
 tools/libs/foreignmemory/Makefile                  |    2 +
 tools/libs/gnttab/Makefile                         |    2 +
 tools/libs/hypfs/Makefile                          |    2 +
 tools/libs/store/Makefile                          |    2 +
 tools/libs/toolcore/Makefile                       |    2 +
 tools/libs/toollog/Makefile                        |    2 +
 18 files changed, 8627 insertions(+)
 create mode 100644 tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dump

diff --git a/tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump b/tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump
new file mode 100644
index 0000000000..4d04ddd692
--- /dev/null
+++ b/tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump
@@ -0,0 +1,924 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xencall.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxencall.so.1.2',
+          'LibraryVersion' => '1.2',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libpthread.so.0' => 1,
+                        'libxentoolcore.so.1' => 1,
+                        'libxentoollog.so.1' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'buffer.c' => 1,
+                         'core.c' => 1,
+                         'linux.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '1580' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'op',
+                                                              'type' => '74'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'arg1',
+                                                              'type' => '1128'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'arg2',
+                                                              'type' => '1128'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'arg3',
+                                                              'type' => '1128'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'arg4',
+                                                              'type' => '1128'
+                                                            },
+                                                     '6' => {
+                                                              'name' => 'arg5',
+                                                              'offset' => '0',
+                                                              'type' => '1128'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall5',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '153'
+                                      },
+                            '1764' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'op',
+                                                              'type' => '74'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'arg1',
+                                                              'type' => '1128'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'arg2',
+                                                              'type' => '1128'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'arg3',
+                                                              'type' => '1128'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'arg4',
+                                                              'type' => '1128'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall4',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '141'
+                                      },
+                            '1928' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'op',
+                                                              'type' => '74'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'arg1',
+                                                              'type' => '1128'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'arg2',
+                                                              'type' => '1128'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'arg3',
+                                                              'type' => '1128'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall3',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '130'
+                                      },
+                            '2077' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'op',
+                                                              'type' => '74'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'arg1',
+                                                              'type' => '1128'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'arg2',
+                                                              'type' => '1128'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall2',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '119'
+                                      },
+                            '2211' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'op',
+                                                              'type' => '74'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'arg1',
+                                                              'type' => '1128'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall1',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '108'
+                                      },
+                            '2330' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'op',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall0',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '99'
+                                      },
+                            '2434' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall_fd',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '94'
+                                      },
+                            '2481' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall_close',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '79'
+                                      },
+                            '2649' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '1558'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'open_flags',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '1758',
+                                        'ShortName' => 'xencall_open',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '34'
+                                      },
+                            '5101' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'p',
+                                                              'type' => '152'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xencall_free_buffer',
+                                        'Source' => 'buffer.c',
+                                        'SourceLine' => '172'
+                                      },
+                            '5216' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'size',
+                                                              'type' => '49'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xencall_alloc_buffer',
+                                        'Source' => 'buffer.c',
+                                        'SourceLine' => '157'
+                                      },
+                            '5358' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'p',
+                                                              'type' => '152'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'nr_pages',
+                                                              'type' => '49'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xencall_free_buffer_pages',
+                                        'Source' => 'buffer.c',
+                                        'SourceLine' => '143'
+                                      },
+                            '5499' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'nr_pages',
+                                                              'type' => '49'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xencall_alloc_buffer_pages',
+                                        'Source' => 'buffer.c',
+                                        'SourceLine' => '128'
+                                      },
+                            '8185' => {
+                                        'Header' => 'xencall.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcall',
+                                                              'type' => '1758'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xencall_buffers_never_fault',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '176'
+                                      }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_ITM_registerTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_Jv_RegisterClasses' => 'xtl_logger_destroy@@VERS_1.0',
+                               '__gmon_start__' => 'xtl_logger_destroy@@VERS_1.0',
+                               'xencall0' => 'xencall0@@VERS_1.0',
+                               'xencall1' => 'xencall1@@VERS_1.0',
+                               'xencall2' => 'xencall2@@VERS_1.0',
+                               'xencall3' => 'xencall3@@VERS_1.0',
+                               'xencall4' => 'xencall4@@VERS_1.0',
+                               'xencall5' => 'xencall5@@VERS_1.0',
+                               'xencall_alloc_buffer' => 'xencall_alloc_buffer@@VERS_1.0',
+                               'xencall_alloc_buffer_pages' => 'xencall_alloc_buffer_pages@@VERS_1.0',
+                               'xencall_buffers_never_fault' => 'xencall_buffers_never_fault@@VERS_1.1',
+                               'xencall_close' => 'xencall_close@@VERS_1.0',
+                               'xencall_fd' => 'xencall_fd@@VERS_1.2',
+                               'xencall_free_buffer' => 'xencall_free_buffer@@VERS_1.0',
+                               'xencall_free_buffer_pages' => 'xencall_free_buffer_pages@@VERS_1.0',
+                               'xencall_open' => 'xencall_open@@VERS_1.0'
+                             },
+          'Symbols' => {
+                         'libxencall.so.1.2' => {
+                                                  'xencall0@@VERS_1.0' => 1,
+                                                  'xencall1@@VERS_1.0' => 1,
+                                                  'xencall2@@VERS_1.0' => 1,
+                                                  'xencall3@@VERS_1.0' => 1,
+                                                  'xencall4@@VERS_1.0' => 1,
+                                                  'xencall5@@VERS_1.0' => 1,
+                                                  'xencall_alloc_buffer@@VERS_1.0' => 1,
+                                                  'xencall_alloc_buffer_pages@@VERS_1.0' => 1,
+                                                  'xencall_buffers_never_fault@@VERS_1.1' => 1,
+                                                  'xencall_close@@VERS_1.0' => 1,
+                                                  'xencall_fd@@VERS_1.2' => 1,
+                                                  'xencall_free_buffer@@VERS_1.0' => 1,
+                                                  'xencall_free_buffer_pages@@VERS_1.0' => 1,
+                                                  'xencall_open@@VERS_1.0' => 1
+                                                }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '102' => {
+                                     'Name' => 'unsigned short',
+                                     'Size' => '2',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1046' => {
+                                      'BaseType' => '560',
+                                      'Name' => 'struct __va_list_tag*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1052' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, xentoollog_level, int, char const*, char const*, struct __va_list_tag*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1558'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '933'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '67'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '768'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '768'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '1046'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1094' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, char const*, char const*, int, unsigned long, unsigned long)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1558'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '768'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '768'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '67'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '60'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '60'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1111' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1558'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1117' => {
+                                      'BaseType' => '102',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '49',
+                                      'Name' => 'uint16_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1128' => {
+                                      'BaseType' => '60',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '55',
+                                      'Name' => 'uint64_t',
+                                      'Size' => '8',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1139' => {
+                                      'BaseType' => '1117',
+                                      'Header' => 'xen.h',
+                                      'Line' => '623',
+                                      'Name' => 'domid_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1151' => {
+                                      'BaseType' => '1162',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '83',
+                                      'Name' => 'Xentoolcore__Active_Handle',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1162' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '88',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'restrict_callback',
+                                                           'offset' => '0',
+                                                           'type' => '1275'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'entry',
+                                                           'offset' => '8',
+                                                           'type' => '1236'
+                                                         }
+                                                },
+                                      'Name' => 'struct Xentoolcore__Active_Handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '1199' => {
+                                      'BaseType' => '1210',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '85',
+                                      'Name' => 'Xentoolcore__Restrict_Callback',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1210' => {
+                                      'Name' => 'int()(Xentoolcore__Active_Handle*, domid_t)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1230'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '1139'
+                                                          }
+                                                 },
+                                      'Return' => '67',
+                                      'Type' => 'Func'
+                                    },
+                          '1230' => {
+                                      'BaseType' => '1151',
+                                      'Name' => 'Xentoolcore__Active_Handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1236' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '90',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'le_next',
+                                                           'offset' => '0',
+                                                           'type' => '1230'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'le_prev',
+                                                           'offset' => '8',
+                                                           'type' => '1269'
+                                                         }
+                                                },
+                                      'Name' => 'anon-struct-xentoolcore_internal.h-90',
+                                      'PrivateABI' => 1,
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '1269' => {
+                                      'BaseType' => '1230',
+                                      'Name' => 'Xentoolcore__Active_Handle**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1275' => {
+                                      'BaseType' => '1199',
+                                      'Name' => 'Xentoolcore__Restrict_Callback*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1281' => {
+                                      'BaseType' => '1292',
+                                      'Header' => 'xencall.h',
+                                      'Line' => '31',
+                                      'Name' => 'xencall_handle',
+                                      'Size' => '128',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1292' => {
+                                      'Header' => 'private.h',
+                                      'Line' => '20',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'logger',
+                                                           'offset' => '0',
+                                                           'type' => '1558'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'logger_tofree',
+                                                           'offset' => '8',
+                                                           'type' => '1558'
+                                                         },
+                                                  '10' => {
+                                                            'name' => 'buffer_current_allocations',
+                                                            'offset' => '104',
+                                                            'type' => '67'
+                                                          },
+                                                  '11' => {
+                                                            'name' => 'buffer_maximum_allocations',
+                                                            'offset' => '108',
+                                                            'type' => '67'
+                                                          },
+                                                  '12' => {
+                                                            'name' => 'buffer_cache_hits',
+                                                            'offset' => '112',
+                                                            'type' => '67'
+                                                          },
+                                                  '13' => {
+                                                            'name' => 'buffer_cache_misses',
+                                                            'offset' => '116',
+                                                            'type' => '67'
+                                                          },
+                                                  '14' => {
+                                                            'name' => 'buffer_cache_toobig',
+                                                            'offset' => '120',
+                                                            'type' => '67'
+                                                          },
+                                                  '2' => {
+                                                           'name' => 'flags',
+                                                           'offset' => '16',
+                                                           'type' => '74'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'fd',
+                                                           'offset' => '20',
+                                                           'type' => '67'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'buf_fd',
+                                                           'offset' => '24',
+                                                           'type' => '67'
+                                                         },
+                                                  '5' => {
+                                                           'name' => 'tc_ah',
+                                                           'offset' => '32',
+                                                           'type' => '1151'
+                                                         },
+                                                  '6' => {
+                                                           'name' => 'buffer_cache_nr',
+                                                           'offset' => '56',
+                                                           'type' => '67'
+                                                         },
+                                                  '7' => {
+                                                           'name' => 'buffer_cache',
+                                                           'offset' => '64',
+                                                           'type' => '1564'
+                                                         },
+                                                  '8' => {
+                                                           'name' => 'buffer_total_allocations',
+                                                           'offset' => '96',
+                                                           'type' => '67'
+                                                         },
+                                                  '9' => {
+                                                           'name' => 'buffer_total_releases',
+                                                           'offset' => '100',
+                                                           'type' => '67'
+                                                         }
+                                                },
+                                      'Name' => 'struct xencall_handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '128',
+                                      'Type' => 'Struct'
+                                    },
+                          '152' => {
+                                     'BaseType' => '1',
+                                     'Name' => 'void*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '1558' => {
+                                      'BaseType' => '944',
+                                      'Name' => 'xentoollog_logger*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1564' => {
+                                      'BaseType' => '152',
+                                      'Name' => 'void*[4]',
+                                      'Size' => '32',
+                                      'Type' => 'Array'
+                                    },
+                          '160' => {
+                                     'Name' => 'char',
+                                     'Size' => '1',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '167' => {
+                                     'BaseType' => '160',
+                                     'Name' => 'char const',
+                                     'Size' => '1',
+                                     'Type' => 'Const'
+                                   },
+                          '1758' => {
+                                      'BaseType' => '1281',
+                                      'Name' => 'xencall_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '49' => {
+                                    'BaseType' => '60',
+                                    'Header' => 'stddef.h',
+                                    'Line' => '216',
+                                    'Name' => 'size_t',
+                                    'Size' => '8',
+                                    'Type' => 'Typedef'
+                                  },
+                          '560' => {
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'gp_offset',
+                                                          'offset' => '0',
+                                                          'type' => '74'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'fp_offset',
+                                                          'offset' => '4',
+                                                          'type' => '74'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'overflow_arg_area',
+                                                          'offset' => '8',
+                                                          'type' => '152'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'reg_save_area',
+                                                          'offset' => '16',
+                                                          'type' => '152'
+                                                        }
+                                               },
+                                     'Name' => 'struct __va_list_tag',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '60' => {
+                                    'Name' => 'unsigned long',
+                                    'Size' => '8',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '67' => {
+                                    'Name' => 'int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '74' => {
+                                    'Name' => 'unsigned int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '768' => {
+                                     'BaseType' => '167',
+                                     'Name' => 'char const*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '850' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '30',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'XTL_NONE',
+                                                          'value' => '0'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'XTL_DEBUG',
+                                                          'value' => '1'
+                                                        },
+                                                 '10' => {
+                                                           'name' => 'XTL_NUM_LEVELS',
+                                                           'value' => '10'
+                                                         },
+                                                 '2' => {
+                                                          'name' => 'XTL_VERBOSE',
+                                                          'value' => '2'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'XTL_DETAIL',
+                                                          'value' => '3'
+                                                        },
+                                                 '4' => {
+                                                          'name' => 'XTL_PROGRESS',
+                                                          'value' => '4'
+                                                        },
+                                                 '5' => {
+                                                          'name' => 'XTL_INFO',
+                                                          'value' => '5'
+                                                        },
+                                                 '6' => {
+                                                          'name' => 'XTL_NOTICE',
+                                                          'value' => '6'
+                                                        },
+                                                 '7' => {
+                                                          'name' => 'XTL_WARN',
+                                                          'value' => '7'
+                                                        },
+                                                 '8' => {
+                                                          'name' => 'XTL_ERROR',
+                                                          'value' => '8'
+                                                        },
+                                                 '9' => {
+                                                          'name' => 'XTL_CRITICAL',
+                                                          'value' => '9'
+                                                        }
+                                               },
+                                     'Name' => 'enum xentoollog_level',
+                                     'PrivateABI' => 1,
+                                     'Size' => '4',
+                                     'Type' => 'Enum'
+                                   },
+                          '933' => {
+                                     'BaseType' => '850',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '42',
+                                     'Name' => 'xentoollog_level',
+                                     'Size' => '4',
+                                     'Type' => 'Typedef'
+                                   },
+                          '944' => {
+                                     'BaseType' => '955',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '44',
+                                     'Name' => 'xentoollog_logger',
+                                     'Size' => '24',
+                                     'Type' => 'Typedef'
+                                   },
+                          '955' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '45',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'vmessage',
+                                                          'offset' => '0',
+                                                          'type' => '1052'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'progress',
+                                                          'offset' => '8',
+                                                          'type' => '1094'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'destroy',
+                                                          'offset' => '16',
+                                                          'type' => '1111'
+                                                        }
+                                               },
+                                     'Name' => 'struct xentoollog_logger',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxencall.so.1.2' => {
+                                                           '_ITM_deregisterTMCloneTable' => 0,
+                                                           '_ITM_registerTMCloneTable' => 0,
+                                                           '_Jv_RegisterClasses' => 0,
+                                                           '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                           '__errno_location@GLIBC_2.2.5' => 0,
+                                                           '__gmon_start__' => 0,
+                                                           'close@GLIBC_2.2.5' => 0,
+                                                           'free@GLIBC_2.2.5' => 0,
+                                                           'ioctl@GLIBC_2.2.5' => 0,
+                                                           'madvise@GLIBC_2.2.5' => 0,
+                                                           'malloc@GLIBC_2.2.5' => 0,
+                                                           'memset@GLIBC_2.2.5' => 0,
+                                                           'mmap@GLIBC_2.2.5' => 0,
+                                                           'munmap@GLIBC_2.2.5' => 0,
+                                                           'open@GLIBC_2.2.5' => 0,
+                                                           'pthread_mutex_lock@GLIBC_2.2.5' => 0,
+                                                           'pthread_mutex_unlock@GLIBC_2.2.5' => 0,
+                                                           'stderr@GLIBC_2.2.5' => 0,
+                                                           'xentoolcore__deregister_active_handle@VERS_1.0' => 0,
+                                                           'xentoolcore__register_active_handle@VERS_1.0' => 0,
+                                                           'xentoolcore__restrict_by_dup2_null@VERS_1.0' => 0,
+                                                           'xtl_createlogger_stdiostream@VERS_1.0' => 0,
+                                                           'xtl_log@VERS_1.0' => 0,
+                                                           'xtl_logger_destroy@VERS_1.0' => 0
+                                                         }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi.dump b/tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi.dump
new file mode 100644
index 0000000000..edc32506fa
--- /dev/null
+++ b/tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi.dump
@@ -0,0 +1,1491 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xendevicemodel.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxendevicemodel.so.1.3',
+          'LibraryVersion' => '1.3',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libpthread.so.0' => 1,
+                        'libxencall.so.1' => 1,
+                        'libxentoolcore.so.1' => 1,
+                        'libxentoollog.so.1' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'core.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '3021' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_restrict',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '615'
+                                      },
+                            '3126' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'start',
+                                                              'type' => '1197'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'end',
+                                                              'type' => '1197'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'type',
+                                                              'type' => '1186'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_pin_memory_cacheattr',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '596'
+                                      },
+                            '3326' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'size',
+                                                              'type' => '1186'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'src_gfn',
+                                                              'type' => '1197'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'dst_gfn',
+                                                              'type' => '1197'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_relocate_memory',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '576'
+                                      },
+                            '3526' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'reason',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_shutdown',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '560'
+                                      },
+                            '3694' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'vcpu',
+                                                              'type' => '67'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'vector',
+                                                              'type' => '1164'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'type',
+                                                              'type' => '1164'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'error_code',
+                                                              'type' => '1186'
+                                                            },
+                                                     '6' => {
+                                                              'name' => 'insn_len',
+                                                              'offset' => '0',
+                                                              'type' => '1164'
+                                                            },
+                                                     '7' => {
+                                                              'name' => 'extra',
+                                                              'offset' => '8',
+                                                              'type' => '1197'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_inject_event',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '538'
+                                      },
+                            '3940' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'mem_type',
+                                                              'type' => '2720'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'first_pfn',
+                                                              'type' => '1197'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'nr',
+                                                              'type' => '1186'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_set_mem_type',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '519'
+                                      },
+                            '4139' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'first_pfn',
+                                                              'type' => '1197'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'nr',
+                                                              'type' => '1186'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_modified_memory',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '507'
+                                      },
+                            '4295' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'extents',
+                                                              'type' => '4495'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'nr',
+                                                              'type' => '1186'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_modified_memory_bulk',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '487'
+                                      },
+                            '4507' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'first_pfn',
+                                                              'type' => '1197'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'nr',
+                                                              'type' => '1186'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'dirty_bitmap',
+                                                              'type' => '4707'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_track_dirty_vram',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '468'
+                                      },
+                            '4719' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'msi_addr',
+                                                              'type' => '1197'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'msi_data',
+                                                              'type' => '1186'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_inject_msi',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '450'
+                                      },
+                            '4903' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'link',
+                                                              'type' => '1164'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'irq',
+                                                              'type' => '1164'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_set_pci_link_route',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '433'
+                                      },
+                            '5087' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'irq',
+                                                              'type' => '1164'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'level',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_set_isa_irq_level',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '415'
+                                      },
+                            '5271' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'segment',
+                                                              'type' => '1175'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'bus',
+                                                              'type' => '1164'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'device',
+                                                              'type' => '1164'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'intx',
+                                                              'type' => '1164'
+                                                            },
+                                                     '6' => {
+                                                              'name' => 'level',
+                                                              'offset' => '0',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_set_pci_intx_level',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '394'
+                                      },
+                            '5502' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'id',
+                                                              'type' => '1311'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'enabled',
+                                                              'type' => '67'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_set_ioreq_server_state',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '377'
+                                      },
+                            '5685' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'id',
+                                                              'type' => '1311'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_destroy_ioreq_server',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '361'
+                                      },
+                            '5852' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'id',
+                                                              'type' => '1311'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'segment',
+                                                              'type' => '1175'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'bus',
+                                                              'type' => '1164'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'device',
+                                                              'type' => '1164'
+                                                            },
+                                                     '6' => {
+                                                              'name' => 'function',
+                                                              'offset' => '0',
+                                                              'type' => '1164'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_unmap_pcidev_from_ioreq_server',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '329'
+                                      },
+                            '6099' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'id',
+                                                              'type' => '1311'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'segment',
+                                                              'type' => '1175'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'bus',
+                                                              'type' => '1164'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'device',
+                                                              'type' => '1164'
+                                                            },
+                                                     '6' => {
+                                                              'name' => 'function',
+                                                              'offset' => '0',
+                                                              'type' => '1164'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_map_pcidev_to_ioreq_server',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '297'
+                                      },
+                            '6340' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'id',
+                                                              'type' => '1311'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'type',
+                                                              'type' => '1175'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'flags',
+                                                              'type' => '1186'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_map_mem_type_to_ioreq_server',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '272'
+                                      },
+                            '6556' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'id',
+                                                              'type' => '1311'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'is_mmio',
+                                                              'type' => '67'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'start',
+                                                              'type' => '1197'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'end',
+                                                              'type' => '1197'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_unmap_io_range_from_ioreq_server',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '252'
+                                      },
+                            '6758' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'id',
+                                                              'type' => '1311'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'is_mmio',
+                                                              'type' => '67'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'start',
+                                                              'type' => '1197'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'end',
+                                                              'type' => '1197'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_map_io_range_to_ioreq_server',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '232'
+                                      },
+                            '6958' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'id',
+                                                              'type' => '1311'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'ioreq_gfn',
+                                                              'type' => '1276'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'bufioreq_gfn',
+                                                              'type' => '1276'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'bufioreq_port',
+                                                              'type' => '1305'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_get_ioreq_server_info',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '192'
+                                      },
+                            '7170' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1282'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'handle_bufioreq',
+                                                              'type' => '67'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'id',
+                                                              'type' => '7352'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_create_ioreq_server',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '168'
+                                      },
+                            '7987' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'dmod',
+                                                              'type' => '3120'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xendevicemodel_close',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '78'
+                                      },
+                            '8144' => {
+                                        'Header' => 'xendevicemodel.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '2972'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'open_flags',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '3120',
+                                        'ShortName' => 'xendevicemodel_open',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '34'
+                                      }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_ITM_registerTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_Jv_RegisterClasses' => 'xtl_logger_destroy@@VERS_1.0',
+                               '__gmon_start__' => 'xtl_logger_destroy@@VERS_1.0',
+                               'xendevicemodel_close' => 'xendevicemodel_close@@VERS_1.0',
+                               'xendevicemodel_create_ioreq_server' => 'xendevicemodel_create_ioreq_server@@VERS_1.0',
+                               'xendevicemodel_destroy_ioreq_server' => 'xendevicemodel_destroy_ioreq_server@@VERS_1.0',
+                               'xendevicemodel_get_ioreq_server_info' => 'xendevicemodel_get_ioreq_server_info@@VERS_1.0',
+                               'xendevicemodel_inject_event' => 'xendevicemodel_inject_event@@VERS_1.0',
+                               'xendevicemodel_inject_msi' => 'xendevicemodel_inject_msi@@VERS_1.0',
+                               'xendevicemodel_map_io_range_to_ioreq_server' => 'xendevicemodel_map_io_range_to_ioreq_server@@VERS_1.0',
+                               'xendevicemodel_map_mem_type_to_ioreq_server' => 'xendevicemodel_map_mem_type_to_ioreq_server@@VERS_1.0',
+                               'xendevicemodel_map_pcidev_to_ioreq_server' => 'xendevicemodel_map_pcidev_to_ioreq_server@@VERS_1.0',
+                               'xendevicemodel_modified_memory' => 'xendevicemodel_modified_memory@@VERS_1.0',
+                               'xendevicemodel_modified_memory_bulk' => 'xendevicemodel_modified_memory_bulk@@VERS_1.3',
+                               'xendevicemodel_open' => 'xendevicemodel_open@@VERS_1.0',
+                               'xendevicemodel_pin_memory_cacheattr' => 'xendevicemodel_pin_memory_cacheattr@@VERS_1.2',
+                               'xendevicemodel_relocate_memory' => 'xendevicemodel_relocate_memory@@VERS_1.2',
+                               'xendevicemodel_restrict' => 'xendevicemodel_restrict@@VERS_1.0',
+                               'xendevicemodel_set_ioreq_server_state' => 'xendevicemodel_set_ioreq_server_state@@VERS_1.0',
+                               'xendevicemodel_set_isa_irq_level' => 'xendevicemodel_set_isa_irq_level@@VERS_1.0',
+                               'xendevicemodel_set_mem_type' => 'xendevicemodel_set_mem_type@@VERS_1.0',
+                               'xendevicemodel_set_pci_intx_level' => 'xendevicemodel_set_pci_intx_level@@VERS_1.0',
+                               'xendevicemodel_set_pci_link_route' => 'xendevicemodel_set_pci_link_route@@VERS_1.0',
+                               'xendevicemodel_shutdown' => 'xendevicemodel_shutdown@@VERS_1.1',
+                               'xendevicemodel_track_dirty_vram' => 'xendevicemodel_track_dirty_vram@@VERS_1.0',
+                               'xendevicemodel_unmap_io_range_from_ioreq_server' => 'xendevicemodel_unmap_io_range_from_ioreq_server@@VERS_1.0',
+                               'xendevicemodel_unmap_pcidev_from_ioreq_server' => 'xendevicemodel_unmap_pcidev_from_ioreq_server@@VERS_1.0'
+                             },
+          'Symbols' => {
+                         'libxendevicemodel.so.1.3' => {
+                                                         'xendevicemodel_close@@VERS_1.0' => 1,
+                                                         'xendevicemodel_create_ioreq_server@@VERS_1.0' => 1,
+                                                         'xendevicemodel_destroy_ioreq_server@@VERS_1.0' => 1,
+                                                         'xendevicemodel_get_ioreq_server_info@@VERS_1.0' => 1,
+                                                         'xendevicemodel_inject_event@@VERS_1.0' => 1,
+                                                         'xendevicemodel_inject_msi@@VERS_1.0' => 1,
+                                                         'xendevicemodel_map_io_range_to_ioreq_server@@VERS_1.0' => 1,
+                                                         'xendevicemodel_map_mem_type_to_ioreq_server@@VERS_1.0' => 1,
+                                                         'xendevicemodel_map_pcidev_to_ioreq_server@@VERS_1.0' => 1,
+                                                         'xendevicemodel_modified_memory@@VERS_1.0' => 1,
+                                                         'xendevicemodel_modified_memory_bulk@@VERS_1.3' => 1,
+                                                         'xendevicemodel_open@@VERS_1.0' => 1,
+                                                         'xendevicemodel_pin_memory_cacheattr@@VERS_1.2' => 1,
+                                                         'xendevicemodel_relocate_memory@@VERS_1.2' => 1,
+                                                         'xendevicemodel_restrict@@VERS_1.0' => 1,
+                                                         'xendevicemodel_set_ioreq_server_state@@VERS_1.0' => 1,
+                                                         'xendevicemodel_set_isa_irq_level@@VERS_1.0' => 1,
+                                                         'xendevicemodel_set_mem_type@@VERS_1.0' => 1,
+                                                         'xendevicemodel_set_pci_intx_level@@VERS_1.0' => 1,
+                                                         'xendevicemodel_set_pci_link_route@@VERS_1.0' => 1,
+                                                         'xendevicemodel_shutdown@@VERS_1.1' => 1,
+                                                         'xendevicemodel_track_dirty_vram@@VERS_1.0' => 1,
+                                                         'xendevicemodel_unmap_io_range_from_ioreq_server@@VERS_1.0' => 1,
+                                                         'xendevicemodel_unmap_pcidev_from_ioreq_server@@VERS_1.0' => 1
+                                                       }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '1002' => {
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '45',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'vmessage',
+                                                           'offset' => '0',
+                                                           'type' => '1099'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'progress',
+                                                           'offset' => '8',
+                                                           'type' => '1141'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'destroy',
+                                                           'offset' => '16',
+                                                           'type' => '1158'
+                                                         }
+                                                },
+                                      'Name' => 'struct xentoollog_logger',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '102' => {
+                                     'Name' => 'unsigned short',
+                                     'Size' => '2',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1093' => {
+                                      'BaseType' => '607',
+                                      'Name' => 'struct __va_list_tag*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1099' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, xentoollog_level, int, char const*, char const*, struct __va_list_tag*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '2972'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '980'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '67'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '179'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '179'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '1093'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1141' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, char const*, char const*, int, unsigned long, unsigned long)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '2972'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '179'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '179'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '67'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '60'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '60'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1158' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '2972'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1164' => {
+                                      'BaseType' => '95',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '48',
+                                      'Name' => 'uint8_t',
+                                      'Size' => '1',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1175' => {
+                                      'BaseType' => '102',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '49',
+                                      'Name' => 'uint16_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1186' => {
+                                      'BaseType' => '74',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '51',
+                                      'Name' => 'uint32_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1197' => {
+                                      'BaseType' => '60',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '55',
+                                      'Name' => 'uint64_t',
+                                      'Size' => '8',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1224' => {
+                                      'BaseType' => '60',
+                                      'Header' => 'xen.h',
+                                      'Line' => '76',
+                                      'Name' => 'xen_pfn_t',
+                                      'Size' => '8',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1276' => {
+                                      'BaseType' => '1224',
+                                      'Name' => 'xen_pfn_t*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1282' => {
+                                      'BaseType' => '1175',
+                                      'Header' => 'xen.h',
+                                      'Line' => '623',
+                                      'Name' => 'domid_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1294' => {
+                                      'BaseType' => '1186',
+                                      'Header' => 'event_channel.h',
+                                      'Line' => '79',
+                                      'Name' => 'evtchn_port_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1305' => {
+                                      'BaseType' => '1294',
+                                      'Name' => 'evtchn_port_t*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1311' => {
+                                      'BaseType' => '1175',
+                                      'Header' => 'dm_op.h',
+                                      'Line' => '56',
+                                      'Name' => 'ioservid_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '152' => {
+                                     'BaseType' => '1',
+                                     'Name' => 'void*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '160' => {
+                                     'Name' => 'char',
+                                     'Size' => '1',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '167' => {
+                                     'BaseType' => '160',
+                                     'Name' => 'char const',
+                                     'Size' => '1',
+                                     'Type' => 'Const'
+                                   },
+                          '179' => {
+                                     'BaseType' => '167',
+                                     'Name' => 'char const*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '1833' => {
+                                      'Header' => 'dm_op.h',
+                                      'Line' => '269',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'nr',
+                                                           'offset' => '0',
+                                                           'type' => '1186'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'pad',
+                                                           'offset' => '4',
+                                                           'type' => '1186'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'first_pfn',
+                                                           'offset' => '8',
+                                                           'type' => '1197'
+                                                         }
+                                                },
+                                      'Name' => 'struct xen_dm_op_modified_memory_extent',
+                                      'PrivateABI' => 1,
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '2720' => {
+                                      'Header' => 'hvm_op.h',
+                                      'Line' => '129',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'HVMMEM_ram_rw',
+                                                           'value' => '0'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'HVMMEM_ram_ro',
+                                                           'value' => '1'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'HVMMEM_mmio_dm',
+                                                           'value' => '2'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'HVMMEM_unused',
+                                                           'value' => '3'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'HVMMEM_ioreq_server',
+                                                           'value' => '4'
+                                                         }
+                                                },
+                                      'Name' => 'enum hvmmem_type_t',
+                                      'PrivateABI' => 1,
+                                      'Size' => '4',
+                                      'Type' => 'Enum'
+                                    },
+                          '2731' => {
+                                      'BaseType' => '2742',
+                                      'Header' => 'xendevicemodel.h',
+                                      'Line' => '31',
+                                      'Name' => 'xendevicemodel_handle',
+                                      'Size' => '64',
+                                      'Type' => 'Typedef'
+                                    },
+                          '2742' => {
+                                      'Header' => 'private.h',
+                                      'Line' => '12',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'logger',
+                                                           'offset' => '0',
+                                                           'type' => '2972'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'logger_tofree',
+                                                           'offset' => '8',
+                                                           'type' => '2972'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'flags',
+                                                           'offset' => '16',
+                                                           'type' => '74'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'xcall',
+                                                           'offset' => '24',
+                                                           'type' => '2978'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'fd',
+                                                           'offset' => '32',
+                                                           'type' => '67'
+                                                         },
+                                                  '5' => {
+                                                           'name' => 'tc_ah',
+                                                           'offset' => '40',
+                                                           'type' => '2842'
+                                                         }
+                                                },
+                                      'Name' => 'struct xendevicemodel_handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '64',
+                                      'Type' => 'Struct'
+                                    },
+                          '2826' => {
+                                      'BaseType' => '2837',
+                                      'Header' => 'xencall.h',
+                                      'Line' => '31',
+                                      'Name' => 'xencall_handle',
+                                      'Type' => 'Typedef'
+                                    },
+                          '2837' => {
+                                      'Name' => 'struct xencall_handle',
+                                      'PrivateABI' => 1,
+                                      'Type' => 'Struct'
+                                    },
+                          '2842' => {
+                                      'BaseType' => '2853',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '83',
+                                      'Name' => 'Xentoolcore__Active_Handle',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '2853' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '88',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'restrict_callback',
+                                                           'offset' => '0',
+                                                           'type' => '2966'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'entry',
+                                                           'offset' => '8',
+                                                           'type' => '2927'
+                                                         }
+                                                },
+                                      'Name' => 'struct Xentoolcore__Active_Handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '2890' => {
+                                      'BaseType' => '2901',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '85',
+                                      'Name' => 'Xentoolcore__Restrict_Callback',
+                                      'Type' => 'Typedef'
+                                    },
+                          '2901' => {
+                                      'Name' => 'int()(Xentoolcore__Active_Handle*, domid_t)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '2921'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '1282'
+                                                          }
+                                                 },
+                                      'Return' => '67',
+                                      'Type' => 'Func'
+                                    },
+                          '2921' => {
+                                      'BaseType' => '2842',
+                                      'Name' => 'Xentoolcore__Active_Handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '2927' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '90',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'le_next',
+                                                           'offset' => '0',
+                                                           'type' => '2921'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'le_prev',
+                                                           'offset' => '8',
+                                                           'type' => '2960'
+                                                         }
+                                                },
+                                      'Name' => 'anon-struct-xentoolcore_internal.h-90',
+                                      'PrivateABI' => 1,
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '2960' => {
+                                      'BaseType' => '2921',
+                                      'Name' => 'Xentoolcore__Active_Handle**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '2966' => {
+                                      'BaseType' => '2890',
+                                      'Name' => 'Xentoolcore__Restrict_Callback*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '2972' => {
+                                      'BaseType' => '991',
+                                      'Name' => 'xentoollog_logger*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '2978' => {
+                                      'BaseType' => '2826',
+                                      'Name' => 'xencall_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '3120' => {
+                                      'BaseType' => '2731',
+                                      'Name' => 'xendevicemodel_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '4495' => {
+                                      'BaseType' => '1833',
+                                      'Name' => 'struct xen_dm_op_modified_memory_extent*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '4707' => {
+                                      'BaseType' => '60',
+                                      'Name' => 'unsigned long*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '60' => {
+                                    'Name' => 'unsigned long',
+                                    'Size' => '8',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '607' => {
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'gp_offset',
+                                                          'offset' => '0',
+                                                          'type' => '74'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'fp_offset',
+                                                          'offset' => '4',
+                                                          'type' => '74'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'overflow_arg_area',
+                                                          'offset' => '8',
+                                                          'type' => '152'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'reg_save_area',
+                                                          'offset' => '16',
+                                                          'type' => '152'
+                                                        }
+                                               },
+                                     'Name' => 'struct __va_list_tag',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '67' => {
+                                    'Name' => 'int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '7352' => {
+                                      'BaseType' => '1311',
+                                      'Name' => 'ioservid_t*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '74' => {
+                                    'Name' => 'unsigned int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '897' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '30',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'XTL_NONE',
+                                                          'value' => '0'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'XTL_DEBUG',
+                                                          'value' => '1'
+                                                        },
+                                                 '10' => {
+                                                           'name' => 'XTL_NUM_LEVELS',
+                                                           'value' => '10'
+                                                         },
+                                                 '2' => {
+                                                          'name' => 'XTL_VERBOSE',
+                                                          'value' => '2'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'XTL_DETAIL',
+                                                          'value' => '3'
+                                                        },
+                                                 '4' => {
+                                                          'name' => 'XTL_PROGRESS',
+                                                          'value' => '4'
+                                                        },
+                                                 '5' => {
+                                                          'name' => 'XTL_INFO',
+                                                          'value' => '5'
+                                                        },
+                                                 '6' => {
+                                                          'name' => 'XTL_NOTICE',
+                                                          'value' => '6'
+                                                        },
+                                                 '7' => {
+                                                          'name' => 'XTL_WARN',
+                                                          'value' => '7'
+                                                        },
+                                                 '8' => {
+                                                          'name' => 'XTL_ERROR',
+                                                          'value' => '8'
+                                                        },
+                                                 '9' => {
+                                                          'name' => 'XTL_CRITICAL',
+                                                          'value' => '9'
+                                                        }
+                                               },
+                                     'Name' => 'enum xentoollog_level',
+                                     'PrivateABI' => 1,
+                                     'Size' => '4',
+                                     'Type' => 'Enum'
+                                   },
+                          '95' => {
+                                    'Name' => 'unsigned char',
+                                    'Size' => '1',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '980' => {
+                                     'BaseType' => '897',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '42',
+                                     'Name' => 'xentoollog_level',
+                                     'Size' => '4',
+                                     'Type' => 'Typedef'
+                                   },
+                          '991' => {
+                                     'BaseType' => '1002',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '44',
+                                     'Name' => 'xentoollog_logger',
+                                     'Size' => '24',
+                                     'Type' => 'Typedef'
+                                   }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxendevicemodel.so.1.3' => {
+                                                                  '_ITM_deregisterTMCloneTable' => 0,
+                                                                  '_ITM_registerTMCloneTable' => 0,
+                                                                  '_Jv_RegisterClasses' => 0,
+                                                                  '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                                  '__errno_location@GLIBC_2.2.5' => 0,
+                                                                  '__gmon_start__' => 0,
+                                                                  'calloc@GLIBC_2.2.5' => 0,
+                                                                  'close@GLIBC_2.2.5' => 0,
+                                                                  'free@GLIBC_2.2.5' => 0,
+                                                                  'ioctl@GLIBC_2.2.5' => 0,
+                                                                  'memcpy@GLIBC_2.14' => 0,
+                                                                  'open@GLIBC_2.2.5' => 0,
+                                                                  'stderr@GLIBC_2.2.5' => 0,
+                                                                  'xencall3@VERS_1.0' => 0,
+                                                                  'xencall_alloc_buffer@VERS_1.0' => 0,
+                                                                  'xencall_close@VERS_1.0' => 0,
+                                                                  'xencall_free_buffer@VERS_1.0' => 0,
+                                                                  'xencall_open@VERS_1.0' => 0,
+                                                                  'xentoolcore__deregister_active_handle@VERS_1.0' => 0,
+                                                                  'xentoolcore__register_active_handle@VERS_1.0' => 0,
+                                                                  'xtl_createlogger_stdiostream@VERS_1.0' => 0,
+                                                                  'xtl_log@VERS_1.0' => 0,
+                                                                  'xtl_logger_destroy@VERS_1.0' => 0
+                                                                }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump b/tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump
new file mode 100644
index 0000000000..d8db4f4387
--- /dev/null
+++ b/tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump
@@ -0,0 +1,719 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xenevtchn.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxenevtchn.so.1.1',
+          'LibraryVersion' => '1.1',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libpthread.so.0' => 1,
+                        'libxentoolcore.so.1' => 1,
+                        'libxentoollog.so.1' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'core.c' => 1,
+                         'linux.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '1409' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1190'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '91',
+                                        'ShortName' => 'xenevtchn_restrict',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '79'
+                                      },
+                            '1511' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '91',
+                                        'ShortName' => 'xenevtchn_close',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '65'
+                                      },
+                            '1655' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '1403'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'open_flags',
+                                                              'type' => '63'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '1505',
+                                        'ShortName' => 'xenevtchn_open',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '31'
+                                      },
+                            '3779' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'port',
+                                                              'type' => '3550'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '91',
+                                        'ShortName' => 'xenevtchn_unmask',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '132'
+                                      },
+                            '3888' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '3561',
+                                        'ShortName' => 'xenevtchn_pending',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '121'
+                                      },
+                            '3990' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'port',
+                                                              'type' => '3550'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '91',
+                                        'ShortName' => 'xenevtchn_unbind',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '111'
+                                      },
+                            '4111' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'virq',
+                                                              'type' => '63'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '3561',
+                                        'ShortName' => 'xenevtchn_bind_virq',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '100'
+                                      },
+                            '4232' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '2427'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'remote_port',
+                                                              'type' => '3550'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '3561',
+                                        'ShortName' => 'xenevtchn_bind_interdomain',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '87'
+                                      },
+                            '4368' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '2427'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '3561',
+                                        'ShortName' => 'xenevtchn_bind_unbound_port',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '76'
+                                      },
+                            '4489' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'port',
+                                                              'type' => '3550'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '91',
+                                        'ShortName' => 'xenevtchn_notify',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '66'
+                                      },
+                            '4610' => {
+                                        'Header' => 'xenevtchn.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xce',
+                                                              'type' => '1505'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '91',
+                                        'ShortName' => 'xenevtchn_fd',
+                                        'Source' => 'linux.c',
+                                        'SourceLine' => '61'
+                                      }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_ITM_registerTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_Jv_RegisterClasses' => 'xtl_logger_destroy@@VERS_1.0',
+                               '__gmon_start__' => 'xtl_logger_destroy@@VERS_1.0',
+                               'xenevtchn_bind_interdomain' => 'xenevtchn_bind_interdomain@@VERS_1.0',
+                               'xenevtchn_bind_unbound_port' => 'xenevtchn_bind_unbound_port@@VERS_1.0',
+                               'xenevtchn_bind_virq' => 'xenevtchn_bind_virq@@VERS_1.0',
+                               'xenevtchn_close' => 'xenevtchn_close@@VERS_1.0',
+                               'xenevtchn_fd' => 'xenevtchn_fd@@VERS_1.0',
+                               'xenevtchn_notify' => 'xenevtchn_notify@@VERS_1.0',
+                               'xenevtchn_open' => 'xenevtchn_open@@VERS_1.0',
+                               'xenevtchn_pending' => 'xenevtchn_pending@@VERS_1.0',
+                               'xenevtchn_restrict' => 'xenevtchn_restrict@@VERS_1.1',
+                               'xenevtchn_unbind' => 'xenevtchn_unbind@@VERS_1.0',
+                               'xenevtchn_unmask' => 'xenevtchn_unmask@@VERS_1.0'
+                             },
+          'Symbols' => {
+                         'libxenevtchn.so.1.1' => {
+                                                    'xenevtchn_bind_interdomain@@VERS_1.0' => 1,
+                                                    'xenevtchn_bind_unbound_port@@VERS_1.0' => 1,
+                                                    'xenevtchn_bind_virq@@VERS_1.0' => 1,
+                                                    'xenevtchn_close@@VERS_1.0' => 1,
+                                                    'xenevtchn_fd@@VERS_1.0' => 1,
+                                                    'xenevtchn_notify@@VERS_1.0' => 1,
+                                                    'xenevtchn_open@@VERS_1.0' => 1,
+                                                    'xenevtchn_pending@@VERS_1.0' => 1,
+                                                    'xenevtchn_restrict@@VERS_1.1' => 1,
+                                                    'xenevtchn_unbind@@VERS_1.0' => 1,
+                                                    'xenevtchn_unmask@@VERS_1.0' => 1
+                                                  }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '1006' => {
+                                      'BaseType' => '1017',
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '44',
+                                      'Name' => 'xentoollog_logger',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1017' => {
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '45',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'vmessage',
+                                                           'offset' => '0',
+                                                           'type' => '1114'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'progress',
+                                                           'offset' => '8',
+                                                           'type' => '1156'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'destroy',
+                                                           'offset' => '16',
+                                                           'type' => '1173'
+                                                         }
+                                                },
+                                      'Name' => 'struct xentoollog_logger',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '1108' => {
+                                      'BaseType' => '622',
+                                      'Name' => 'struct __va_list_tag*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1114' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, xentoollog_level, int, char const*, char const*, struct __va_list_tag*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1403'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '995'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '91'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '830'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '830'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '1108'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1156' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, char const*, char const*, int, unsigned long, unsigned long)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1403'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '830'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '830'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '91'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '70'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '70'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1173' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1403'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1179' => {
+                                      'BaseType' => '56',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '49',
+                                      'Name' => 'uint16_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1190' => {
+                                      'BaseType' => '1179',
+                                      'Header' => 'xen.h',
+                                      'Line' => '623',
+                                      'Name' => 'domid_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1202' => {
+                                      'BaseType' => '1213',
+                                      'Header' => 'xenevtchn.h',
+                                      'Line' => '33',
+                                      'Name' => 'xenevtchn_handle',
+                                      'Size' => '48',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1213' => {
+                                      'Header' => 'private.h',
+                                      'Line' => '11',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'logger',
+                                                           'offset' => '0',
+                                                           'type' => '1403'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'logger_tofree',
+                                                           'offset' => '8',
+                                                           'type' => '1403'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'fd',
+                                                           'offset' => '16',
+                                                           'type' => '91'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'tc_ah',
+                                                           'offset' => '24',
+                                                           'type' => '1273'
+                                                         }
+                                                },
+                                      'Name' => 'struct xenevtchn_handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '48',
+                                      'Type' => 'Struct'
+                                    },
+                          '1273' => {
+                                      'BaseType' => '1284',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '83',
+                                      'Name' => 'Xentoolcore__Active_Handle',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1284' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '88',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'restrict_callback',
+                                                           'offset' => '0',
+                                                           'type' => '1397'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'entry',
+                                                           'offset' => '8',
+                                                           'type' => '1358'
+                                                         }
+                                                },
+                                      'Name' => 'struct Xentoolcore__Active_Handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '1321' => {
+                                      'BaseType' => '1332',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '85',
+                                      'Name' => 'Xentoolcore__Restrict_Callback',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1332' => {
+                                      'Name' => 'int()(Xentoolcore__Active_Handle*, domid_t)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1352'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '1190'
+                                                          }
+                                                 },
+                                      'Return' => '91',
+                                      'Type' => 'Func'
+                                    },
+                          '134' => {
+                                     'BaseType' => '1',
+                                     'Name' => 'void*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '1352' => {
+                                      'BaseType' => '1273',
+                                      'Name' => 'Xentoolcore__Active_Handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1358' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '90',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'le_next',
+                                                           'offset' => '0',
+                                                           'type' => '1352'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'le_prev',
+                                                           'offset' => '8',
+                                                           'type' => '1391'
+                                                         }
+                                                },
+                                      'Name' => 'anon-struct-xentoolcore_internal.h-90',
+                                      'PrivateABI' => 1,
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '1391' => {
+                                      'BaseType' => '1352',
+                                      'Name' => 'Xentoolcore__Active_Handle**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1397' => {
+                                      'BaseType' => '1321',
+                                      'Name' => 'Xentoolcore__Restrict_Callback*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1403' => {
+                                      'BaseType' => '1006',
+                                      'Name' => 'xentoollog_logger*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '142' => {
+                                     'Name' => 'char',
+                                     'Size' => '1',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '149' => {
+                                     'BaseType' => '142',
+                                     'Name' => 'char const',
+                                     'Size' => '1',
+                                     'Type' => 'Const'
+                                   },
+                          '1505' => {
+                                      'BaseType' => '1202',
+                                      'Name' => 'xenevtchn_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '2427' => {
+                                      'BaseType' => '63',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '51',
+                                      'Name' => 'uint32_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3550' => {
+                                      'BaseType' => '2427',
+                                      'Header' => 'event_channel.h',
+                                      'Line' => '79',
+                                      'Name' => 'evtchn_port_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3561' => {
+                                      'BaseType' => '91',
+                                      'Header' => 'xenevtchn.h',
+                                      'Line' => '31',
+                                      'Name' => 'xenevtchn_port_or_error_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '56' => {
+                                    'Name' => 'unsigned short',
+                                    'Size' => '2',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '622' => {
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'gp_offset',
+                                                          'offset' => '0',
+                                                          'type' => '63'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'fp_offset',
+                                                          'offset' => '4',
+                                                          'type' => '63'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'overflow_arg_area',
+                                                          'offset' => '8',
+                                                          'type' => '134'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'reg_save_area',
+                                                          'offset' => '16',
+                                                          'type' => '134'
+                                                        }
+                                               },
+                                     'Name' => 'struct __va_list_tag',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '63' => {
+                                    'Name' => 'unsigned int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '70' => {
+                                    'Name' => 'unsigned long',
+                                    'Size' => '8',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '830' => {
+                                     'BaseType' => '149',
+                                     'Name' => 'char const*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '91' => {
+                                    'Name' => 'int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '912' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '30',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'XTL_NONE',
+                                                          'value' => '0'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'XTL_DEBUG',
+                                                          'value' => '1'
+                                                        },
+                                                 '10' => {
+                                                           'name' => 'XTL_NUM_LEVELS',
+                                                           'value' => '10'
+                                                         },
+                                                 '2' => {
+                                                          'name' => 'XTL_VERBOSE',
+                                                          'value' => '2'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'XTL_DETAIL',
+                                                          'value' => '3'
+                                                        },
+                                                 '4' => {
+                                                          'name' => 'XTL_PROGRESS',
+                                                          'value' => '4'
+                                                        },
+                                                 '5' => {
+                                                          'name' => 'XTL_INFO',
+                                                          'value' => '5'
+                                                        },
+                                                 '6' => {
+                                                          'name' => 'XTL_NOTICE',
+                                                          'value' => '6'
+                                                        },
+                                                 '7' => {
+                                                          'name' => 'XTL_WARN',
+                                                          'value' => '7'
+                                                        },
+                                                 '8' => {
+                                                          'name' => 'XTL_ERROR',
+                                                          'value' => '8'
+                                                        },
+                                                 '9' => {
+                                                          'name' => 'XTL_CRITICAL',
+                                                          'value' => '9'
+                                                        }
+                                               },
+                                     'Name' => 'enum xentoollog_level',
+                                     'PrivateABI' => 1,
+                                     'Size' => '4',
+                                     'Type' => 'Enum'
+                                   },
+                          '995' => {
+                                     'BaseType' => '912',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '42',
+                                     'Name' => 'xentoollog_level',
+                                     'Size' => '4',
+                                     'Type' => 'Typedef'
+                                   }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxenevtchn.so.1.1' => {
+                                                             '_ITM_deregisterTMCloneTable' => 0,
+                                                             '_ITM_registerTMCloneTable' => 0,
+                                                             '_Jv_RegisterClasses' => 0,
+                                                             '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                             '__gmon_start__' => 0,
+                                                             'close@GLIBC_2.2.5' => 0,
+                                                             'free@GLIBC_2.2.5' => 0,
+                                                             'ioctl@GLIBC_2.2.5' => 0,
+                                                             'malloc@GLIBC_2.2.5' => 0,
+                                                             'open@GLIBC_2.2.5' => 0,
+                                                             'read@GLIBC_2.2.5' => 0,
+                                                             'stderr@GLIBC_2.2.5' => 0,
+                                                             'write@GLIBC_2.2.5' => 0,
+                                                             'xentoolcore__deregister_active_handle@VERS_1.0' => 0,
+                                                             'xentoolcore__register_active_handle@VERS_1.0' => 0,
+                                                             'xtl_createlogger_stdiostream@VERS_1.0' => 0,
+                                                             'xtl_logger_destroy@VERS_1.0' => 0
+                                                           }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-abi.dump b/tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-abi.dump
new file mode 100644
index 0000000000..1c3b5bf2eb
--- /dev/null
+++ b/tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-abi.dump
@@ -0,0 +1,847 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xenforeignmemory.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxenforeignmemory.so.1.3',
+          'LibraryVersion' => '1.3',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libpthread.so.0' => 1,
+                        'libxentoolcore.so.1' => 1,
+                        'libxentoollog.so.1' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'core.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '1529' => {
+                                        'Header' => 'xenforeignmemory.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fmem',
+                                                              'type' => '1658'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'fres',
+                                                              'type' => '1664'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xenforeignmemory_unmap_resource',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '182'
+                                      },
+                            '1670' => {
+                                        'Header' => 'xenforeignmemory.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fmem',
+                                                              'type' => '1658'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1167'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'type',
+                                                              'type' => '74'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'id',
+                                                              'type' => '74'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'frame',
+                                                              'type' => '60'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'nr_frames',
+                                                              'type' => '60'
+                                                            },
+                                                     '6' => {
+                                                              'name' => 'paddr',
+                                                              'offset' => '0',
+                                                              'type' => '1971'
+                                                            },
+                                                     '7' => {
+                                                              'name' => 'prot',
+                                                              'offset' => '8',
+                                                              'type' => '67'
+                                                            },
+                                                     '8' => {
+                                                              'name' => 'flags',
+                                                              'offset' => '16',
+                                                              'type' => '67'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '1664',
+                                        'ShortName' => 'xenforeignmemory_map_resource',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '140'
+                                      },
+                            '1977' => {
+                                        'Header' => 'xenforeignmemory.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fmem',
+                                                              'type' => '1658'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1167'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xenforeignmemory_restrict',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '134'
+                                      },
+                            '2073' => {
+                                        'Header' => 'xenforeignmemory.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fmem',
+                                                              'type' => '1658'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'addr',
+                                                              'type' => '152'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'num',
+                                                              'type' => '49'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xenforeignmemory_unmap',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '128'
+                                      },
+                            '2187' => {
+                                        'Header' => 'xenforeignmemory.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fmem',
+                                                              'type' => '1658'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'dom',
+                                                              'type' => '1128'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'prot',
+                                                              'type' => '67'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'num',
+                                                              'type' => '49'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'arr',
+                                                              'type' => '1161'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'err',
+                                                              'type' => '1155'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xenforeignmemory_map',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '120'
+                                      },
+                            '2363' => {
+                                        'Header' => 'xenforeignmemory.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fmem',
+                                                              'type' => '1658'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'dom',
+                                                              'type' => '1128'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'addr',
+                                                              'type' => '152'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'prot',
+                                                              'type' => '67'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'flags',
+                                                              'type' => '67'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'num',
+                                                              'type' => '49'
+                                                            },
+                                                     '6' => {
+                                                              'name' => 'arr',
+                                                              'offset' => '0',
+                                                              'type' => '1161'
+                                                            },
+                                                     '7' => {
+                                                              'name' => 'err',
+                                                              'offset' => '8',
+                                                              'type' => '1155'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xenforeignmemory_map2',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '83'
+                                      },
+                            '2724' => {
+                                        'Header' => 'xenforeignmemory.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fmem',
+                                                              'type' => '1658'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xenforeignmemory_close',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '69'
+                                      },
+                            '2868' => {
+                                        'Header' => 'xenforeignmemory.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '1523'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'open_flags',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '1658',
+                                        'ShortName' => 'xenforeignmemory_open',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '34'
+                                      }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_ITM_registerTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_Jv_RegisterClasses' => 'xtl_logger_destroy@@VERS_1.0',
+                               '__gmon_start__' => 'xtl_logger_destroy@@VERS_1.0',
+                               'xenforeignmemory_close' => 'xenforeignmemory_close@@VERS_1.0',
+                               'xenforeignmemory_map' => 'xenforeignmemory_map@@VERS_1.0',
+                               'xenforeignmemory_map2' => 'xenforeignmemory_map2@@VERS_1.2',
+                               'xenforeignmemory_map_resource' => 'xenforeignmemory_map_resource@@VERS_1.3',
+                               'xenforeignmemory_open' => 'xenforeignmemory_open@@VERS_1.0',
+                               'xenforeignmemory_restrict' => 'xenforeignmemory_restrict@@VERS_1.1',
+                               'xenforeignmemory_unmap' => 'xenforeignmemory_unmap@@VERS_1.0',
+                               'xenforeignmemory_unmap_resource' => 'xenforeignmemory_unmap_resource@@VERS_1.3'
+                             },
+          'Symbols' => {
+                         'libxenforeignmemory.so.1.3' => {
+                                                           'xenforeignmemory_close@@VERS_1.0' => 1,
+                                                           'xenforeignmemory_map2@@VERS_1.2' => 1,
+                                                           'xenforeignmemory_map@@VERS_1.0' => 1,
+                                                           'xenforeignmemory_map_resource@@VERS_1.3' => 1,
+                                                           'xenforeignmemory_open@@VERS_1.0' => 1,
+                                                           'xenforeignmemory_restrict@@VERS_1.1' => 1,
+                                                           'xenforeignmemory_unmap@@VERS_1.0' => 1,
+                                                           'xenforeignmemory_unmap_resource@@VERS_1.3' => 1
+                                                         }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '102' => {
+                                     'Name' => 'unsigned short',
+                                     'Size' => '2',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1046' => {
+                                      'BaseType' => '560',
+                                      'Name' => 'struct __va_list_tag*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1052' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, xentoollog_level, int, char const*, char const*, struct __va_list_tag*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1523'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '933'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '67'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '768'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '768'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '1046'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1094' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, char const*, char const*, int, unsigned long, unsigned long)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1523'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '768'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '768'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '67'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '60'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '60'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1111' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1523'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1117' => {
+                                      'BaseType' => '102',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '49',
+                                      'Name' => 'uint16_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1128' => {
+                                      'BaseType' => '74',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '51',
+                                      'Name' => 'uint32_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1139' => {
+                                      'BaseType' => '60',
+                                      'Header' => 'xen.h',
+                                      'Line' => '76',
+                                      'Name' => 'xen_pfn_t',
+                                      'Size' => '8',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1150' => {
+                                      'BaseType' => '1139',
+                                      'Name' => 'xen_pfn_t const',
+                                      'Size' => '8',
+                                      'Type' => 'Const'
+                                    },
+                          '1155' => {
+                                      'BaseType' => '67',
+                                      'Name' => 'int*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1161' => {
+                                      'BaseType' => '1150',
+                                      'Name' => 'xen_pfn_t const*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1167' => {
+                                      'BaseType' => '1117',
+                                      'Header' => 'xen.h',
+                                      'Line' => '623',
+                                      'Name' => 'domid_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1179' => {
+                                      'BaseType' => '1190',
+                                      'Header' => 'xenforeignmemory.h',
+                                      'Line' => '32',
+                                      'Name' => 'xenforeignmemory_handle',
+                                      'Size' => '56',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1190' => {
+                                      'Header' => 'private.h',
+                                      'Line' => '21',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'logger',
+                                                           'offset' => '0',
+                                                           'type' => '1523'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'logger_tofree',
+                                                           'offset' => '8',
+                                                           'type' => '1523'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'flags',
+                                                           'offset' => '16',
+                                                           'type' => '74'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'fd',
+                                                           'offset' => '20',
+                                                           'type' => '67'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'tc_ah',
+                                                           'offset' => '24',
+                                                           'type' => '1393'
+                                                         },
+                                                  '5' => {
+                                                           'name' => 'unimpl_errno',
+                                                           'offset' => '48',
+                                                           'type' => '67'
+                                                         }
+                                                },
+                                      'Name' => 'struct xenforeignmemory_handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '56',
+                                      'Type' => 'Struct'
+                                    },
+                          '1274' => {
+                                      'BaseType' => '1285',
+                                      'Header' => 'xenforeignmemory.h',
+                                      'Line' => '141',
+                                      'Name' => 'xenforeignmemory_resource_handle',
+                                      'Size' => '48',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1285' => {
+                                      'Header' => 'private.h',
+                                      'Line' => '46',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'domid',
+                                                           'offset' => '0',
+                                                           'type' => '1167'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'type',
+                                                           'offset' => '4',
+                                                           'type' => '74'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'id',
+                                                           'offset' => '8',
+                                                           'type' => '74'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'frame',
+                                                           'offset' => '16',
+                                                           'type' => '60'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'nr_frames',
+                                                           'offset' => '24',
+                                                           'type' => '60'
+                                                         },
+                                                  '5' => {
+                                                           'name' => 'addr',
+                                                           'offset' => '32',
+                                                           'type' => '152'
+                                                         },
+                                                  '6' => {
+                                                           'name' => 'prot',
+                                                           'offset' => '40',
+                                                           'type' => '67'
+                                                         },
+                                                  '7' => {
+                                                           'name' => 'flags',
+                                                           'offset' => '44',
+                                                           'type' => '67'
+                                                         }
+                                                },
+                                      'Name' => 'struct xenforeignmemory_resource_handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '48',
+                                      'Type' => 'Struct'
+                                    },
+                          '1393' => {
+                                      'BaseType' => '1404',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '83',
+                                      'Name' => 'Xentoolcore__Active_Handle',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1404' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '88',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'restrict_callback',
+                                                           'offset' => '0',
+                                                           'type' => '1517'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'entry',
+                                                           'offset' => '8',
+                                                           'type' => '1478'
+                                                         }
+                                                },
+                                      'Name' => 'struct Xentoolcore__Active_Handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '1441' => {
+                                      'BaseType' => '1452',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '85',
+                                      'Name' => 'Xentoolcore__Restrict_Callback',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1452' => {
+                                      'Name' => 'int()(Xentoolcore__Active_Handle*, domid_t)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1472'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '1167'
+                                                          }
+                                                 },
+                                      'Return' => '67',
+                                      'Type' => 'Func'
+                                    },
+                          '1472' => {
+                                      'BaseType' => '1393',
+                                      'Name' => 'Xentoolcore__Active_Handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1478' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '90',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'le_next',
+                                                           'offset' => '0',
+                                                           'type' => '1472'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'le_prev',
+                                                           'offset' => '8',
+                                                           'type' => '1511'
+                                                         }
+                                                },
+                                      'Name' => 'anon-struct-xentoolcore_internal.h-90',
+                                      'PrivateABI' => 1,
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '1511' => {
+                                      'BaseType' => '1472',
+                                      'Name' => 'Xentoolcore__Active_Handle**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1517' => {
+                                      'BaseType' => '1441',
+                                      'Name' => 'Xentoolcore__Restrict_Callback*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '152' => {
+                                     'BaseType' => '1',
+                                     'Name' => 'void*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '1523' => {
+                                      'BaseType' => '944',
+                                      'Name' => 'xentoollog_logger*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '160' => {
+                                     'Name' => 'char',
+                                     'Size' => '1',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1658' => {
+                                      'BaseType' => '1179',
+                                      'Name' => 'xenforeignmemory_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1664' => {
+                                      'BaseType' => '1274',
+                                      'Name' => 'xenforeignmemory_resource_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '167' => {
+                                     'BaseType' => '160',
+                                     'Name' => 'char const',
+                                     'Size' => '1',
+                                     'Type' => 'Const'
+                                   },
+                          '1971' => {
+                                      'BaseType' => '152',
+                                      'Name' => 'void**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '49' => {
+                                    'BaseType' => '60',
+                                    'Header' => 'stddef.h',
+                                    'Line' => '216',
+                                    'Name' => 'size_t',
+                                    'Size' => '8',
+                                    'Type' => 'Typedef'
+                                  },
+                          '560' => {
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'gp_offset',
+                                                          'offset' => '0',
+                                                          'type' => '74'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'fp_offset',
+                                                          'offset' => '4',
+                                                          'type' => '74'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'overflow_arg_area',
+                                                          'offset' => '8',
+                                                          'type' => '152'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'reg_save_area',
+                                                          'offset' => '16',
+                                                          'type' => '152'
+                                                        }
+                                               },
+                                     'Name' => 'struct __va_list_tag',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '60' => {
+                                    'Name' => 'unsigned long',
+                                    'Size' => '8',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '67' => {
+                                    'Name' => 'int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '74' => {
+                                    'Name' => 'unsigned int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '768' => {
+                                     'BaseType' => '167',
+                                     'Name' => 'char const*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '850' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '30',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'XTL_NONE',
+                                                          'value' => '0'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'XTL_DEBUG',
+                                                          'value' => '1'
+                                                        },
+                                                 '10' => {
+                                                           'name' => 'XTL_NUM_LEVELS',
+                                                           'value' => '10'
+                                                         },
+                                                 '2' => {
+                                                          'name' => 'XTL_VERBOSE',
+                                                          'value' => '2'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'XTL_DETAIL',
+                                                          'value' => '3'
+                                                        },
+                                                 '4' => {
+                                                          'name' => 'XTL_PROGRESS',
+                                                          'value' => '4'
+                                                        },
+                                                 '5' => {
+                                                          'name' => 'XTL_INFO',
+                                                          'value' => '5'
+                                                        },
+                                                 '6' => {
+                                                          'name' => 'XTL_NOTICE',
+                                                          'value' => '6'
+                                                        },
+                                                 '7' => {
+                                                          'name' => 'XTL_WARN',
+                                                          'value' => '7'
+                                                        },
+                                                 '8' => {
+                                                          'name' => 'XTL_ERROR',
+                                                          'value' => '8'
+                                                        },
+                                                 '9' => {
+                                                          'name' => 'XTL_CRITICAL',
+                                                          'value' => '9'
+                                                        }
+                                               },
+                                     'Name' => 'enum xentoollog_level',
+                                     'PrivateABI' => 1,
+                                     'Size' => '4',
+                                     'Type' => 'Enum'
+                                   },
+                          '933' => {
+                                     'BaseType' => '850',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '42',
+                                     'Name' => 'xentoollog_level',
+                                     'Size' => '4',
+                                     'Type' => 'Typedef'
+                                   },
+                          '944' => {
+                                     'BaseType' => '955',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '44',
+                                     'Name' => 'xentoollog_logger',
+                                     'Size' => '24',
+                                     'Type' => 'Typedef'
+                                   },
+                          '955' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '45',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'vmessage',
+                                                          'offset' => '0',
+                                                          'type' => '1052'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'progress',
+                                                          'offset' => '8',
+                                                          'type' => '1094'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'destroy',
+                                                          'offset' => '16',
+                                                          'type' => '1111'
+                                                        }
+                                               },
+                                     'Name' => 'struct xentoollog_logger',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxenforeignmemory.so.1.3' => {
+                                                                    '_ITM_deregisterTMCloneTable' => 0,
+                                                                    '_ITM_registerTMCloneTable' => 0,
+                                                                    '_Jv_RegisterClasses' => 0,
+                                                                    '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                                    '__errno_location@GLIBC_2.2.5' => 0,
+                                                                    '__gmon_start__' => 0,
+                                                                    'calloc@GLIBC_2.2.5' => 0,
+                                                                    'close@GLIBC_2.2.5' => 0,
+                                                                    'free@GLIBC_2.2.5' => 0,
+                                                                    'ioctl@GLIBC_2.2.5' => 0,
+                                                                    'malloc@GLIBC_2.2.5' => 0,
+                                                                    'memcpy@GLIBC_2.14' => 0,
+                                                                    'mmap@GLIBC_2.2.5' => 0,
+                                                                    'munmap@GLIBC_2.2.5' => 0,
+                                                                    'open@GLIBC_2.2.5' => 0,
+                                                                    'stderr@GLIBC_2.2.5' => 0,
+                                                                    'usleep@GLIBC_2.2.5' => 0,
+                                                                    'xentoolcore__deregister_active_handle@VERS_1.0' => 0,
+                                                                    'xentoolcore__register_active_handle@VERS_1.0' => 0,
+                                                                    'xtl_createlogger_stdiostream@VERS_1.0' => 0,
+                                                                    'xtl_log@VERS_1.0' => 0,
+                                                                    'xtl_logger_destroy@VERS_1.0' => 0
+                                                                  }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump b/tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump
new file mode 100644
index 0000000000..94036c4192
--- /dev/null
+++ b/tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump
@@ -0,0 +1,1199 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xengnttab.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxengnttab.so.1.2',
+          'LibraryVersion' => '1.2',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libpthread.so.0' => 1,
+                        'libxentoolcore.so.1' => 1,
+                        'libxentoollog.so.1' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'gntshr_core.c' => 1,
+                         'gnttab_core.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '1575' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'fd',
+                                                              'type' => '1139'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_dmabuf_imp_release',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '159'
+                                      },
+                            '1672' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'fd',
+                                                              'type' => '1139'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'count',
+                                                              'type' => '1139'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'refs',
+                                                              'type' => '1167'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_dmabuf_imp_to_refs',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '153'
+                                      },
+                            '1829' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'fd',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'wait_to_ms',
+                                                              'type' => '1139'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_dmabuf_exp_wait_released',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '147'
+                                      },
+                            '1942' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'flags',
+                                                              'type' => '1139'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'count',
+                                                              'type' => '1139'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'refs',
+                                                              'type' => '1173'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'fd',
+                                                              'type' => '1167'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_dmabuf_exp_from_refs',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '139'
+                                      },
+                            '2121' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'count',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'segs',
+                                                              'type' => '2235'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_grant_copy',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '132'
+                                      },
+                            '2241' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'start_address',
+                                                              'type' => '152'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'count',
+                                                              'type' => '1139'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_unmap',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '127'
+                                      },
+                            '2355' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'ref',
+                                                              'type' => '1139'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'prot',
+                                                              'type' => '67'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'notify_offset',
+                                                              'type' => '1139'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'notify_port',
+                                                              'type' => '1309'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xengnttab_map_grant_ref_notify',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '116'
+                                      },
+                            '2529' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'count',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1139'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'refs',
+                                                              'type' => '1167'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'prot',
+                                                              'type' => '67'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xengnttab_map_domain_grant_refs',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '106'
+                                      },
+                            '2691' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'count',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'domids',
+                                                              'type' => '1167'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'refs',
+                                                              'type' => '1167'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'prot',
+                                                              'type' => '67'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xengnttab_map_grant_refs',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '97'
+                                      },
+                            '2854' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'ref',
+                                                              'type' => '1139'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'prot',
+                                                              'type' => '67'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xengnttab_map_grant_ref',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '89'
+                                      },
+                            '2998' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'count',
+                                                              'type' => '1139'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_set_max_grants',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '84'
+                                      },
+                            '3090' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_fd',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '79'
+                                      },
+                            '3137' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgt',
+                                                              'type' => '1666'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengnttab_close',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '65'
+                                      },
+                            '3281' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '1569'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'open_flags',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '1666',
+                                        'ShortName' => 'xengnttab_open',
+                                        'Source' => 'gnttab_core.c',
+                                        'SourceLine' => '31'
+                                      },
+                            '5244' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgs',
+                                                              'type' => '5358'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'start_address',
+                                                              'type' => '152'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'count',
+                                                              'type' => '1139'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengntshr_unshare',
+                                        'Source' => 'gntshr_core.c',
+                                        'SourceLine' => '88'
+                                      },
+                            '5364' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcg',
+                                                              'type' => '5358'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'ref',
+                                                              'type' => '1167'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'writable',
+                                                              'type' => '67'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'notify_offset',
+                                                              'type' => '1139'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'notify_port',
+                                                              'type' => '1309'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xengntshr_share_page_notify',
+                                        'Source' => 'gntshr_core.c',
+                                        'SourceLine' => '79'
+                                      },
+                            '5542' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xcg',
+                                                              'type' => '5358'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '1139'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'count',
+                                                              'type' => '67'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'refs',
+                                                              'type' => '1167'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'writable',
+                                                              'type' => '67'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '152',
+                                        'ShortName' => 'xengntshr_share_pages',
+                                        'Source' => 'gntshr_core.c',
+                                        'SourceLine' => '73'
+                                      },
+                            '5706' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgs',
+                                                              'type' => '5358'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengntshr_fd',
+                                        'Source' => 'gntshr_core.c',
+                                        'SourceLine' => '68'
+                                      },
+                            '5753' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'xgs',
+                                                              'type' => '5358'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '67',
+                                        'ShortName' => 'xengntshr_close',
+                                        'Source' => 'gntshr_core.c',
+                                        'SourceLine' => '55'
+                                      },
+                            '5873' => {
+                                        'Header' => 'xengnttab.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '1569'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'open_flags',
+                                                              'type' => '74'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '5358',
+                                        'ShortName' => 'xengntshr_open',
+                                        'Source' => 'gntshr_core.c',
+                                        'SourceLine' => '25'
+                                      }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_ITM_registerTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_Jv_RegisterClasses' => 'xtl_logger_destroy@@VERS_1.0',
+                               '__gmon_start__' => 'xtl_logger_destroy@@VERS_1.0',
+                               'xengntshr_close' => 'xengntshr_close@@VERS_1.0',
+                               'xengntshr_fd' => 'xengntshr_fd@@VERS_1.2',
+                               'xengntshr_open' => 'xengntshr_open@@VERS_1.0',
+                               'xengntshr_share_page_notify' => 'xengntshr_share_page_notify@@VERS_1.0',
+                               'xengntshr_share_pages' => 'xengntshr_share_pages@@VERS_1.0',
+                               'xengntshr_unshare' => 'xengntshr_unshare@@VERS_1.0',
+                               'xengnttab_close' => 'xengnttab_close@@VERS_1.0',
+                               'xengnttab_dmabuf_exp_from_refs' => 'xengnttab_dmabuf_exp_from_refs@@VERS_1.2',
+                               'xengnttab_dmabuf_exp_wait_released' => 'xengnttab_dmabuf_exp_wait_released@@VERS_1.2',
+                               'xengnttab_dmabuf_imp_release' => 'xengnttab_dmabuf_imp_release@@VERS_1.2',
+                               'xengnttab_dmabuf_imp_to_refs' => 'xengnttab_dmabuf_imp_to_refs@@VERS_1.2',
+                               'xengnttab_fd' => 'xengnttab_fd@@VERS_1.2',
+                               'xengnttab_grant_copy' => 'xengnttab_grant_copy@@VERS_1.1',
+                               'xengnttab_map_domain_grant_refs' => 'xengnttab_map_domain_grant_refs@@VERS_1.0',
+                               'xengnttab_map_grant_ref' => 'xengnttab_map_grant_ref@@VERS_1.0',
+                               'xengnttab_map_grant_ref_notify' => 'xengnttab_map_grant_ref_notify@@VERS_1.0',
+                               'xengnttab_map_grant_refs' => 'xengnttab_map_grant_refs@@VERS_1.0',
+                               'xengnttab_open' => 'xengnttab_open@@VERS_1.0',
+                               'xengnttab_set_max_grants' => 'xengnttab_set_max_grants@@VERS_1.0',
+                               'xengnttab_unmap' => 'xengnttab_unmap@@VERS_1.0'
+                             },
+          'Symbols' => {
+                         'libxengnttab.so.1.2' => {
+                                                    'xengntshr_close@@VERS_1.0' => 1,
+                                                    'xengntshr_fd@@VERS_1.2' => 1,
+                                                    'xengntshr_open@@VERS_1.0' => 1,
+                                                    'xengntshr_share_page_notify@@VERS_1.0' => 1,
+                                                    'xengntshr_share_pages@@VERS_1.0' => 1,
+                                                    'xengntshr_unshare@@VERS_1.0' => 1,
+                                                    'xengnttab_close@@VERS_1.0' => 1,
+                                                    'xengnttab_dmabuf_exp_from_refs@@VERS_1.2' => 1,
+                                                    'xengnttab_dmabuf_exp_wait_released@@VERS_1.2' => 1,
+                                                    'xengnttab_dmabuf_imp_release@@VERS_1.2' => 1,
+                                                    'xengnttab_dmabuf_imp_to_refs@@VERS_1.2' => 1,
+                                                    'xengnttab_fd@@VERS_1.2' => 1,
+                                                    'xengnttab_grant_copy@@VERS_1.1' => 1,
+                                                    'xengnttab_map_domain_grant_refs@@VERS_1.0' => 1,
+                                                    'xengnttab_map_grant_ref@@VERS_1.0' => 1,
+                                                    'xengnttab_map_grant_ref_notify@@VERS_1.0' => 1,
+                                                    'xengnttab_map_grant_refs@@VERS_1.0' => 1,
+                                                    'xengnttab_open@@VERS_1.0' => 1,
+                                                    'xengnttab_set_max_grants@@VERS_1.0' => 1,
+                                                    'xengnttab_unmap@@VERS_1.0' => 1
+                                                  }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '102' => {
+                                     'Name' => 'unsigned short',
+                                     'Size' => '2',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1057' => {
+                                      'BaseType' => '571',
+                                      'Name' => 'struct __va_list_tag*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1063' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, xentoollog_level, int, char const*, char const*, struct __va_list_tag*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1569'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '944'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '67'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '779'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '779'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '1057'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1105' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, char const*, char const*, int, unsigned long, unsigned long)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1569'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '779'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '779'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '67'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '60'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '60'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1122' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1569'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1128' => {
+                                      'BaseType' => '102',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '49',
+                                      'Name' => 'uint16_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1139' => {
+                                      'BaseType' => '74',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '51',
+                                      'Name' => 'uint32_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1150' => {
+                                      'BaseType' => '1139',
+                                      'Name' => 'uint32_t const',
+                                      'Size' => '4',
+                                      'Type' => 'Const'
+                                    },
+                          '1155' => {
+                                      'BaseType' => '1128',
+                                      'Header' => 'xen.h',
+                                      'Line' => '623',
+                                      'Name' => 'domid_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '116' => {
+                                     'Name' => 'short',
+                                     'Size' => '2',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1167' => {
+                                      'BaseType' => '1139',
+                                      'Name' => 'uint32_t*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1173' => {
+                                      'BaseType' => '1150',
+                                      'Name' => 'uint32_t const*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1179' => {
+                                      'BaseType' => '1190',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '83',
+                                      'Name' => 'Xentoolcore__Active_Handle',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1190' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '88',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'restrict_callback',
+                                                           'offset' => '0',
+                                                           'type' => '1303'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'entry',
+                                                           'offset' => '8',
+                                                           'type' => '1264'
+                                                         }
+                                                },
+                                      'Name' => 'struct Xentoolcore__Active_Handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '1227' => {
+                                      'BaseType' => '1238',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '85',
+                                      'Name' => 'Xentoolcore__Restrict_Callback',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1238' => {
+                                      'Name' => 'int()(Xentoolcore__Active_Handle*, domid_t)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '1258'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '1155'
+                                                          }
+                                                 },
+                                      'Return' => '67',
+                                      'Type' => 'Func'
+                                    },
+                          '1258' => {
+                                      'BaseType' => '1179',
+                                      'Name' => 'Xentoolcore__Active_Handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1264' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '90',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'le_next',
+                                                           'offset' => '0',
+                                                           'type' => '1258'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'le_prev',
+                                                           'offset' => '8',
+                                                           'type' => '1297'
+                                                         }
+                                                },
+                                      'Name' => 'anon-struct-xentoolcore_internal.h-90',
+                                      'PrivateABI' => 1,
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '1297' => {
+                                      'BaseType' => '1258',
+                                      'Name' => 'Xentoolcore__Active_Handle**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1303' => {
+                                      'BaseType' => '1227',
+                                      'Name' => 'Xentoolcore__Restrict_Callback*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1309' => {
+                                      'BaseType' => '1139',
+                                      'Header' => 'event_channel.h',
+                                      'Line' => '79',
+                                      'Name' => 'evtchn_port_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1320' => {
+                                      'BaseType' => '1331',
+                                      'Header' => 'xengnttab.h',
+                                      'Line' => '110',
+                                      'Name' => 'xengnttab_handle',
+                                      'Size' => '48',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1331' => {
+                                      'Header' => 'private.h',
+                                      'Line' => '14',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'logger',
+                                                           'offset' => '0',
+                                                           'type' => '1569'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'logger_tofree',
+                                                           'offset' => '8',
+                                                           'type' => '1569'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'fd',
+                                                           'offset' => '16',
+                                                           'type' => '67'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'tc_ah',
+                                                           'offset' => '24',
+                                                           'type' => '1179'
+                                                         }
+                                                },
+                                      'Name' => 'struct xengntdev_handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '48',
+                                      'Type' => 'Struct'
+                                    },
+                          '1391' => {
+                                      'Header' => 'xengnttab.h',
+                                      'Line' => '274',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'ref',
+                                                           'offset' => '0',
+                                                           'type' => '1139'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'offset',
+                                                           'offset' => '4',
+                                                           'type' => '1128'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'domid',
+                                                           'offset' => '6',
+                                                           'type' => '1128'
+                                                         }
+                                                },
+                                      'Name' => 'anon-struct-xengnttab.h-274',
+                                      'Size' => '8',
+                                      'Type' => 'Struct'
+                                    },
+                          '1440' => {
+                                      'Header' => 'xengnttab.h',
+                                      'Line' => '272',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'virt',
+                                                           'offset' => '0',
+                                                           'type' => '152'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'foreign',
+                                                           'offset' => '0',
+                                                           'type' => '1391'
+                                                         }
+                                                },
+                                      'Name' => 'union xengnttab_copy_ptr',
+                                      'Size' => '8',
+                                      'Type' => 'Union'
+                                    },
+                          '1478' => {
+                                      'Header' => 'xengnttab.h',
+                                      'Line' => '271',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'source',
+                                                           'offset' => '0',
+                                                           'type' => '1440'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'dest',
+                                                           'offset' => '8',
+                                                           'type' => '1440'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'len',
+                                                           'offset' => '16',
+                                                           'type' => '1128'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'flags',
+                                                           'offset' => '18',
+                                                           'type' => '1128'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'status',
+                                                           'offset' => '20',
+                                                           'type' => '172'
+                                                         }
+                                                },
+                                      'Name' => 'struct xengnttab_grant_copy_segment',
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '152' => {
+                                     'BaseType' => '1',
+                                     'Name' => 'void*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '1557' => {
+                                      'BaseType' => '1478',
+                                      'Header' => 'xengnttab.h',
+                                      'Line' => '285',
+                                      'Name' => 'xengnttab_grant_copy_segment_t',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1569' => {
+                                      'BaseType' => '955',
+                                      'Name' => 'xentoollog_logger*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '160' => {
+                                     'Name' => 'char',
+                                     'Size' => '1',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1666' => {
+                                      'BaseType' => '1320',
+                                      'Name' => 'xengnttab_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '167' => {
+                                     'BaseType' => '160',
+                                     'Name' => 'char const',
+                                     'Size' => '1',
+                                     'Type' => 'Const'
+                                   },
+                          '172' => {
+                                     'BaseType' => '116',
+                                     'Header' => 'types.h',
+                                     'Line' => '195',
+                                     'Name' => 'int16_t',
+                                     'Size' => '2',
+                                     'Type' => 'Typedef'
+                                   },
+                          '2235' => {
+                                      'BaseType' => '1557',
+                                      'Name' => 'xengnttab_grant_copy_segment_t*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '5226' => {
+                                      'BaseType' => '1331',
+                                      'Header' => 'xengnttab.h',
+                                      'Line' => '363',
+                                      'Name' => 'xengntshr_handle',
+                                      'Size' => '48',
+                                      'Type' => 'Typedef'
+                                    },
+                          '5358' => {
+                                      'BaseType' => '5226',
+                                      'Name' => 'xengntshr_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '571' => {
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'gp_offset',
+                                                          'offset' => '0',
+                                                          'type' => '74'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'fp_offset',
+                                                          'offset' => '4',
+                                                          'type' => '74'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'overflow_arg_area',
+                                                          'offset' => '8',
+                                                          'type' => '152'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'reg_save_area',
+                                                          'offset' => '16',
+                                                          'type' => '152'
+                                                        }
+                                               },
+                                     'Name' => 'struct __va_list_tag',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '60' => {
+                                    'Name' => 'unsigned long',
+                                    'Size' => '8',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '67' => {
+                                    'Name' => 'int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '74' => {
+                                    'Name' => 'unsigned int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '779' => {
+                                     'BaseType' => '167',
+                                     'Name' => 'char const*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '861' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '30',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'XTL_NONE',
+                                                          'value' => '0'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'XTL_DEBUG',
+                                                          'value' => '1'
+                                                        },
+                                                 '10' => {
+                                                           'name' => 'XTL_NUM_LEVELS',
+                                                           'value' => '10'
+                                                         },
+                                                 '2' => {
+                                                          'name' => 'XTL_VERBOSE',
+                                                          'value' => '2'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'XTL_DETAIL',
+                                                          'value' => '3'
+                                                        },
+                                                 '4' => {
+                                                          'name' => 'XTL_PROGRESS',
+                                                          'value' => '4'
+                                                        },
+                                                 '5' => {
+                                                          'name' => 'XTL_INFO',
+                                                          'value' => '5'
+                                                        },
+                                                 '6' => {
+                                                          'name' => 'XTL_NOTICE',
+                                                          'value' => '6'
+                                                        },
+                                                 '7' => {
+                                                          'name' => 'XTL_WARN',
+                                                          'value' => '7'
+                                                        },
+                                                 '8' => {
+                                                          'name' => 'XTL_ERROR',
+                                                          'value' => '8'
+                                                        },
+                                                 '9' => {
+                                                          'name' => 'XTL_CRITICAL',
+                                                          'value' => '9'
+                                                        }
+                                               },
+                                     'Name' => 'enum xentoollog_level',
+                                     'PrivateABI' => 1,
+                                     'Size' => '4',
+                                     'Type' => 'Enum'
+                                   },
+                          '944' => {
+                                     'BaseType' => '861',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '42',
+                                     'Name' => 'xentoollog_level',
+                                     'Size' => '4',
+                                     'Type' => 'Typedef'
+                                   },
+                          '955' => {
+                                     'BaseType' => '966',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '44',
+                                     'Name' => 'xentoollog_logger',
+                                     'Size' => '24',
+                                     'Type' => 'Typedef'
+                                   },
+                          '966' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '45',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'vmessage',
+                                                          'offset' => '0',
+                                                          'type' => '1063'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'progress',
+                                                          'offset' => '8',
+                                                          'type' => '1105'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'destroy',
+                                                          'offset' => '16',
+                                                          'type' => '1122'
+                                                        }
+                                               },
+                                     'Name' => 'struct xentoollog_logger',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxengnttab.so.1.2' => {
+                                                             '_ITM_deregisterTMCloneTable' => 0,
+                                                             '_ITM_registerTMCloneTable' => 0,
+                                                             '_Jv_RegisterClasses' => 0,
+                                                             '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                             '__errno_location@GLIBC_2.2.5' => 0,
+                                                             '__gmon_start__' => 0,
+                                                             'close@GLIBC_2.2.5' => 0,
+                                                             'free@GLIBC_2.2.5' => 0,
+                                                             'ioctl@GLIBC_2.2.5' => 0,
+                                                             'malloc@GLIBC_2.2.5' => 0,
+                                                             'memcpy@GLIBC_2.14' => 0,
+                                                             'mmap@GLIBC_2.2.5' => 0,
+                                                             'munmap@GLIBC_2.2.5' => 0,
+                                                             'open@GLIBC_2.2.5' => 0,
+                                                             'stderr@GLIBC_2.2.5' => 0,
+                                                             'usleep@GLIBC_2.2.5' => 0,
+                                                             'xentoolcore__deregister_active_handle@VERS_1.0' => 0,
+                                                             'xentoolcore__register_active_handle@VERS_1.0' => 0,
+                                                             'xentoolcore__restrict_by_dup2_null@VERS_1.0' => 0,
+                                                             'xtl_createlogger_stdiostream@VERS_1.0' => 0,
+                                                             'xtl_log@VERS_1.0' => 0,
+                                                             'xtl_logger_destroy@VERS_1.0' => 0
+                                                           }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump b/tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump
new file mode 100644
index 0000000000..c08096c2a8
--- /dev/null
+++ b/tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump
@@ -0,0 +1,597 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xenhypfs.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxenhypfs.so.1.0',
+          'LibraryVersion' => '1.0',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libpthread.so.0' => 1,
+                        'libxencall.so.1' => 1,
+                        'libxentoolcore.so.1' => 1,
+                        'libxentoollog.so.1' => 1,
+                        'libz.so.1' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'core.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '2102' => {
+                                        'Header' => 'xenhypfs.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fshdl',
+                                                              'type' => '3759'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'path',
+                                                              'type' => '263'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'val',
+                                                              'type' => '263'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '89',
+                                        'ShortName' => 'xenhypfs_write',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '427'
+                                      },
+                            '3771' => {
+                                        'Header' => 'xenhypfs.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fshdl',
+                                                              'type' => '3759'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'path',
+                                                              'type' => '263'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'num_entries',
+                                                              'type' => '1949'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '4188',
+                                        'ShortName' => 'xenhypfs_readdir',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '369'
+                                      },
+                            '4200' => {
+                                        'Header' => 'xenhypfs.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fshdl',
+                                                              'type' => '3759'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'path',
+                                                              'type' => '263'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '60',
+                                        'ShortName' => 'xenhypfs_read',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '281'
+                                      },
+                            '4829' => {
+                                        'Header' => 'xenhypfs.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fshdl',
+                                                              'type' => '3759'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'path',
+                                                              'type' => '263'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'dirent',
+                                                              'type' => '5448'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '296',
+                                        'ShortName' => 'xenhypfs_read_raw',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '210'
+                                      },
+                            '6110' => {
+                                        'Header' => 'xenhypfs.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'fshdl',
+                                                              'type' => '3759'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '89',
+                                        'ShortName' => 'xenhypfs_close',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '83'
+                                      },
+                            '6205' => {
+                                        'Header' => 'xenhypfs.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '2090'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'open_flags',
+                                                              'type' => '213'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '3759',
+                                        'ShortName' => 'xenhypfs_open',
+                                        'Source' => 'core.c',
+                                        'SourceLine' => '45'
+                                      }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_ITM_registerTMCloneTable' => 'xtl_logger_destroy@@VERS_1.0',
+                               '_Jv_RegisterClasses' => 'xtl_logger_destroy@@VERS_1.0',
+                               '__gmon_start__' => 'xtl_logger_destroy@@VERS_1.0',
+                               'inflate' => 'xtl_logger_destroy@@VERS_1.0',
+                               'inflateEnd' => 'xtl_logger_destroy@@VERS_1.0',
+                               'inflateInit2_' => 'xtl_logger_destroy@@VERS_1.0',
+                               'xenhypfs_close' => 'xenhypfs_close@@VERS_1.0',
+                               'xenhypfs_open' => 'xenhypfs_open@@VERS_1.0',
+                               'xenhypfs_read' => 'xenhypfs_read@@VERS_1.0',
+                               'xenhypfs_read_raw' => 'xenhypfs_read_raw@@VERS_1.0',
+                               'xenhypfs_readdir' => 'xenhypfs_readdir@@VERS_1.0',
+                               'xenhypfs_write' => 'xenhypfs_write@@VERS_1.0'
+                             },
+          'Symbols' => {
+                         'libxenhypfs.so.1.0' => {
+                                                   'xenhypfs_close@@VERS_1.0' => 1,
+                                                   'xenhypfs_open@@VERS_1.0' => 1,
+                                                   'xenhypfs_read@@VERS_1.0' => 1,
+                                                   'xenhypfs_read_raw@@VERS_1.0' => 1,
+                                                   'xenhypfs_readdir@@VERS_1.0' => 1,
+                                                   'xenhypfs_write@@VERS_1.0' => 1
+                                                 }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '1433' => {
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '30',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'XTL_NONE',
+                                                           'value' => '0'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'XTL_DEBUG',
+                                                           'value' => '1'
+                                                         },
+                                                  '10' => {
+                                                            'name' => 'XTL_NUM_LEVELS',
+                                                            'value' => '10'
+                                                          },
+                                                  '2' => {
+                                                           'name' => 'XTL_VERBOSE',
+                                                           'value' => '2'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'XTL_DETAIL',
+                                                           'value' => '3'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'XTL_PROGRESS',
+                                                           'value' => '4'
+                                                         },
+                                                  '5' => {
+                                                           'name' => 'XTL_INFO',
+                                                           'value' => '5'
+                                                         },
+                                                  '6' => {
+                                                           'name' => 'XTL_NOTICE',
+                                                           'value' => '6'
+                                                         },
+                                                  '7' => {
+                                                           'name' => 'XTL_WARN',
+                                                           'value' => '7'
+                                                         },
+                                                  '8' => {
+                                                           'name' => 'XTL_ERROR',
+                                                           'value' => '8'
+                                                         },
+                                                  '9' => {
+                                                           'name' => 'XTL_CRITICAL',
+                                                           'value' => '9'
+                                                         }
+                                                },
+                                      'Name' => 'enum xentoollog_level',
+                                      'PrivateABI' => 1,
+                                      'Size' => '4',
+                                      'Type' => 'Enum'
+                                    },
+                          '1516' => {
+                                      'BaseType' => '1433',
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '42',
+                                      'Name' => 'xentoollog_level',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1527' => {
+                                      'BaseType' => '1538',
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '44',
+                                      'Name' => 'xentoollog_logger',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1538' => {
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '45',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'vmessage',
+                                                           'offset' => '0',
+                                                           'type' => '1635'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'progress',
+                                                           'offset' => '8',
+                                                           'type' => '1677'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'destroy',
+                                                           'offset' => '16',
+                                                           'type' => '1694'
+                                                         }
+                                                },
+                                      'Name' => 'struct xentoollog_logger',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '1629' => {
+                                      'BaseType' => '365',
+                                      'Name' => 'struct __va_list_tag*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1635' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, xentoollog_level, int, char const*, char const*, struct __va_list_tag*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '2090'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '1516'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '89'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '263'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '263'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '1629'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1677' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, char const*, char const*, int, unsigned long, unsigned long)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '2090'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '263'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '263'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '89'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '231'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '231'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1694' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '2090'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1700' => {
+                                      'BaseType' => '1711',
+                                      'Header' => 'xenhypfs.h',
+                                      'Line' => '27',
+                                      'Name' => 'xenhypfs_handle',
+                                      'Size' => '32',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1711' => {
+                                      'Line' => '39',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'logger',
+                                                           'offset' => '0',
+                                                           'type' => '2090'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'logger_tofree',
+                                                           'offset' => '8',
+                                                           'type' => '2090'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'flags',
+                                                           'offset' => '16',
+                                                           'type' => '213'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'xcall',
+                                                           'offset' => '24',
+                                                           'type' => '2096'
+                                                         }
+                                                },
+                                      'Name' => 'struct xenhypfs_handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '32',
+                                      'Source' => 'core.c',
+                                      'Type' => 'Struct'
+                                    },
+                          '1854' => {
+                                      'Header' => 'xenhypfs.h',
+                                      'Line' => '43',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'name',
+                                                           'offset' => '0',
+                                                           'type' => '60'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'size',
+                                                           'offset' => '8',
+                                                           'type' => '238'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'type',
+                                                           'offset' => '16',
+                                                           'type' => '195'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'encoding',
+                                                           'offset' => '18',
+                                                           'type' => '195'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'flags',
+                                                           'offset' => '20',
+                                                           'type' => '213'
+                                                         }
+                                                },
+                                      'Name' => 'struct xenhypfs_dirent',
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '1927' => {
+                                      'BaseType' => '1938',
+                                      'Header' => 'xencall.h',
+                                      'Line' => '31',
+                                      'Name' => 'xencall_handle',
+                                      'Type' => 'Typedef'
+                                    },
+                          '1938' => {
+                                      'Name' => 'struct xencall_handle',
+                                      'PrivateABI' => 1,
+                                      'Type' => 'Struct'
+                                    },
+                          '1949' => {
+                                      'BaseType' => '213',
+                                      'Name' => 'unsigned int*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '195' => {
+                                     'Name' => 'unsigned short',
+                                     'Size' => '2',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '2090' => {
+                                      'BaseType' => '1527',
+                                      'Name' => 'xentoollog_logger*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '2096' => {
+                                      'BaseType' => '1927',
+                                      'Name' => 'xencall_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '213' => {
+                                     'Name' => 'unsigned int',
+                                     'Size' => '4',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '231' => {
+                                     'Name' => 'unsigned long',
+                                     'Size' => '8',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '238' => {
+                                     'BaseType' => '231',
+                                     'Header' => 'stddef.h',
+                                     'Line' => '216',
+                                     'Name' => 'size_t',
+                                     'Size' => '8',
+                                     'Type' => 'Typedef'
+                                   },
+                          '263' => {
+                                     'BaseType' => '73',
+                                     'Name' => 'char const*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '296' => {
+                                     'BaseType' => '1',
+                                     'Name' => 'void*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '365' => {
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'gp_offset',
+                                                          'offset' => '0',
+                                                          'type' => '213'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'fp_offset',
+                                                          'offset' => '4',
+                                                          'type' => '213'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'overflow_arg_area',
+                                                          'offset' => '8',
+                                                          'type' => '296'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'reg_save_area',
+                                                          'offset' => '16',
+                                                          'type' => '296'
+                                                        }
+                                               },
+                                     'Name' => 'struct __va_list_tag',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '3759' => {
+                                      'BaseType' => '1700',
+                                      'Name' => 'xenhypfs_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '4188' => {
+                                      'BaseType' => '1854',
+                                      'Name' => 'struct xenhypfs_dirent*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '5448' => {
+                                      'BaseType' => '4188',
+                                      'Name' => 'struct xenhypfs_dirent**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '60' => {
+                                    'BaseType' => '66',
+                                    'Name' => 'char*',
+                                    'Size' => '8',
+                                    'Type' => 'Pointer'
+                                  },
+                          '66' => {
+                                    'Name' => 'char',
+                                    'Size' => '1',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '73' => {
+                                    'BaseType' => '66',
+                                    'Name' => 'char const',
+                                    'Size' => '1',
+                                    'Type' => 'Const'
+                                  },
+                          '89' => {
+                                    'Name' => 'int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxenhypfs.so.1.0' => {
+                                                            '_ITM_deregisterTMCloneTable' => 0,
+                                                            '_ITM_registerTMCloneTable' => 0,
+                                                            '_Jv_RegisterClasses' => 0,
+                                                            '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                            '__errno_location@GLIBC_2.2.5' => 0,
+                                                            '__gmon_start__' => 0,
+                                                            'asprintf@GLIBC_2.2.5' => 0,
+                                                            'calloc@GLIBC_2.2.5' => 0,
+                                                            'free@GLIBC_2.2.5' => 0,
+                                                            'inflate' => 0,
+                                                            'inflateEnd' => 0,
+                                                            'inflateInit2_' => 0,
+                                                            'malloc@GLIBC_2.2.5' => 0,
+                                                            'memcpy@GLIBC_2.14' => 0,
+                                                            'realloc@GLIBC_2.2.5' => 0,
+                                                            'stderr@GLIBC_2.2.5' => 0,
+                                                            'strcmp@GLIBC_2.2.5' => 0,
+                                                            'strcpy@GLIBC_2.2.5' => 0,
+                                                            'strrchr@GLIBC_2.2.5' => 0,
+                                                            'strtoll@GLIBC_2.2.5' => 0,
+                                                            'strtoull@GLIBC_2.2.5' => 0,
+                                                            'xencall5@VERS_1.0' => 0,
+                                                            'xencall_alloc_buffer@VERS_1.0' => 0,
+                                                            'xencall_close@VERS_1.0' => 0,
+                                                            'xencall_free_buffer@VERS_1.0' => 0,
+                                                            'xencall_open@VERS_1.0' => 0,
+                                                            'xtl_createlogger_stdiostream@VERS_1.0' => 0,
+                                                            'xtl_logger_destroy@VERS_1.0' => 0
+                                                          }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump b/tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump
new file mode 100644
index 0000000000..5237521138
--- /dev/null
+++ b/tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump
@@ -0,0 +1,1711 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xenstore.h' => 1,
+                         'xenstore_lib.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxenstore.so.3.0.3',
+          'LibraryVersion' => '3.0.3',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libdl.so.2' => 1,
+                        'libpthread.so.0' => 1,
+                        'libxentoolcore.so.1' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'xs.c' => 1,
+                         'xs_lib.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '10479' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 'num',
+                                                               'type' => '3872'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi'
+                                                  },
+                                         'Return' => '1800',
+                                         'ShortName' => 'xs_read_watch',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '975'
+                                       },
+                            '10577' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi'
+                                                  },
+                                         'Return' => '1800',
+                                         'ShortName' => 'xs_check_watch',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '962'
+                                       },
+                            '11607' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 'path',
+                                                               'type' => '1777'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'token',
+                                                               'type' => '1777'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_watch',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '811'
+                                       },
+                            '12375' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 'domid',
+                                                               'type' => '68'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_restrict',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '801'
+                                       },
+                            '12436' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 't',
+                                                               'type' => '3777'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'path',
+                                                               'type' => '1777'
+                                                             },
+                                                      '3' => {
+                                                               'name' => 'perms',
+                                                               'type' => '12799'
+                                                             },
+                                                      '4' => {
+                                                               'name' => 'num_perms',
+                                                               'type' => '68'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx',
+                                                    '3' => 'rcx',
+                                                    '4' => 'r8'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_set_permissions',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '763'
+                                       },
+                            '12840' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 't',
+                                                               'type' => '3777'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'path',
+                                                               'type' => '1777'
+                                                             },
+                                                      '3' => {
+                                                               'name' => 'num',
+                                                               'type' => '3872'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx',
+                                                    '3' => 'rcx'
+                                                  },
+                                         'Return' => '12799',
+                                         'ShortName' => 'xs_get_permissions',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '729'
+                                       },
+                            '13192' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 't',
+                                                               'type' => '3777'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'path',
+                                                               'type' => '1777'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_rm',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '720'
+                                       },
+                            '13333' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 't',
+                                                               'type' => '3777'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'path',
+                                                               'type' => '1777'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_mkdir',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '711'
+                                       },
+                            '13474' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 't',
+                                                               'type' => '3777'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'path',
+                                                               'type' => '1777'
+                                                             },
+                                                      '3' => {
+                                                               'name' => 'data',
+                                                               'type' => '1862'
+                                                             },
+                                                      '4' => {
+                                                               'name' => 'len',
+                                                               'type' => '68'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx',
+                                                    '3' => 'rcx',
+                                                    '4' => 'r8'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_write',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '694'
+                                       },
+                            '13666' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 't',
+                                                               'type' => '3777'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'path',
+                                                               'type' => '1777'
+                                                             },
+                                                      '3' => {
+                                                               'name' => 'len',
+                                                               'type' => '3872'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx',
+                                                    '3' => 'rcx'
+                                                  },
+                                         'Return' => '259',
+                                         'ShortName' => 'xs_read',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '685'
+                                       },
+                            '13808' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 't',
+                                                               'type' => '3777'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'path',
+                                                               'type' => '1777'
+                                                             },
+                                                      '3' => {
+                                                               'name' => 'num',
+                                                               'type' => '3872'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx',
+                                                    '3' => 'rcx'
+                                                  },
+                                         'Return' => '1800',
+                                         'ShortName' => 'xs_directory',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '664'
+                                       },
+                            '16916' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'xsh',
+                                                               'type' => '5580'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi'
+                                                  },
+                                         'Return' => '1',
+                                         'ShortName' => 'xs_close',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '385'
+                                       },
+                            '16984' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi'
+                                                  },
+                                         'Return' => '1',
+                                         'ShortName' => 'xs_daemon_close',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '363'
+                                       },
+                            '17253' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi'
+                                                  },
+                                         'Return' => '1',
+                                         'ShortName' => 'xs_daemon_destroy_postfork',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '357'
+                                       },
+                            '17797' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'flags',
+                                                               'type' => '75'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi'
+                                                  },
+                                         'Return' => '5580',
+                                         'ShortName' => 'xs_open',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '313'
+                                       },
+                            '17942' => {
+                                         'Header' => 'xenstore.h',
+                                         'Return' => '5580',
+                                         'ShortName' => 'xs_domain_open',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '308'
+                                       },
+                            '17996' => {
+                                         'Header' => 'xenstore.h',
+                                         'Return' => '5580',
+                                         'ShortName' => 'xs_daemon_open_readonly',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '303'
+                                       },
+                            '18050' => {
+                                         'Header' => 'xenstore.h',
+                                         'Return' => '5580',
+                                         'ShortName' => 'xs_daemon_open',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '298'
+                                       },
+                            '19113' => {
+                                         'Header' => 'xenstore.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'h',
+                                                               'type' => '5580'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi'
+                                                  },
+                                         'Return' => '96',
+                                         'ShortName' => 'xs_fileno',
+                                         'Source' => 'xs.c',
+                                         'SourceLine' => '174'
+                                       },
+                            '19920' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'strings',
+                                                               'type' => '1777'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 'len',
+                                                               'type' => '68'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi'
+                                                  },
+                                         'Return' => '68',
+                                         'ShortName' => 'xs_count_strings',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '177'
+                                       },
+                            '20032' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'perm',
+                                                               'type' => '21550'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 'buffer',
+                                                               'type' => '294'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'buf_len',
+                                                               'type' => '312'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_perm_to_string',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '152'
+                                       },
+                            '20055' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'perms',
+                                                               'type' => '12799'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 'num',
+                                                               'type' => '68'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'strings',
+                                                               'type' => '1777'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_strings_to_perms',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '114'
+                                       },
+                            '20104' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Param' => {
+                                                      '0' => {
+                                                               'name' => 'fd',
+                                                               'type' => '96'
+                                                             },
+                                                      '1' => {
+                                                               'name' => 'data',
+                                                               'type' => '1862'
+                                                             },
+                                                      '2' => {
+                                                               'name' => 'len',
+                                                               'type' => '68'
+                                                             }
+                                                    },
+                                         'Reg' => {
+                                                    '0' => 'rdi',
+                                                    '1' => 'rsi',
+                                                    '2' => 'rdx'
+                                                  },
+                                         'Return' => '4499',
+                                         'ShortName' => 'xs_write_all',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '96'
+                                       },
+                            '20149' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Line' => '61',
+                                         'Return' => '1777',
+                                         'ShortName' => 'xs_daemon_socket_ro',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '64'
+                                       },
+                            '20160' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Line' => '60',
+                                         'Return' => '1777',
+                                         'ShortName' => 'xs_daemon_socket',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '59'
+                                       },
+                            '20171' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Line' => '62',
+                                         'Return' => '1777',
+                                         'ShortName' => 'xs_domain_dev',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '75'
+                                       },
+                            '22199' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Return' => '1777',
+                                         'ShortName' => 'xs_daemon_tdb',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '52'
+                                       },
+                            '22473' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Return' => '1777',
+                                         'ShortName' => 'xs_daemon_rundir',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '34'
+                                       },
+                            '22547' => {
+                                         'Header' => 'xenstore_lib.h',
+                                         'Return' => '1777',
+                                         'ShortName' => 'xs_daemon_rootdir',
+                                         'Source' => 'xs_lib.c',
+                                         'SourceLine' => '28'
+                                       },
+                            '4506' => {
+                                        'Header' => 'xenstore_lib.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'out',
+                                                              'type' => '294'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'out_len_r',
+                                                              'type' => '3872'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'in',
+                                                              'type' => '1777'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'unsanitise_value',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1425'
+                                      },
+                            '4736' => {
+                                        'Header' => 'xenstore_lib.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'ebuf',
+                                                              'type' => '5164'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'val',
+                                                              'type' => '1777'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'len',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '294',
+                                        'ShortName' => 'sanitise_value',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1375'
+                                      },
+                            '5191' => {
+                                        'Header' => 'xenstore_lib.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'ebuf',
+                                                              'type' => '5164'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'min_avail',
+                                                              'type' => '96'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '294',
+                                        'ShortName' => 'expanding_buffer_ensure',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1354'
+                                      },
+                            '6983' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'cmd',
+                                                              'type' => '1777'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'data',
+                                                              'type' => '259'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'len',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '294',
+                                        'ShortName' => 'xs_debug_command',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1229'
+                                      },
+                            '7122' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'cmd',
+                                                              'type' => '1777'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'data',
+                                                              'type' => '259'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'len',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '294',
+                                        'ShortName' => 'xs_control_command',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1215'
+                                      },
+                            '7297' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'domid',
+                                                              'type' => '96'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '96',
+                                        'ShortName' => 'xs_suspend_evtchn_port',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1187'
+                                      },
+                            '7669' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '4499',
+                                        'ShortName' => 'xs_is_domain_introduced',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1178'
+                                      },
+                            '7912' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'parent',
+                                                              'type' => '1777'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'child',
+                                                              'type' => '1777'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '4499',
+                                        'ShortName' => 'xs_path_is_subpath',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1161'
+                                      },
+                            '8044' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '294',
+                                        'ShortName' => 'xs_get_domain_path',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1152'
+                                      },
+                            '8230' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '4499',
+                                        'ShortName' => 'xs_resume_domain',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1147'
+                                      },
+                            '8345' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '4499',
+                                        'ShortName' => 'xs_release_domain',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1141'
+                                      },
+                            '8647' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '68'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'target',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '4499',
+                                        'ShortName' => 'xs_set_target',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1111'
+                                      },
+                            '8936' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'domid',
+                                                              'type' => '68'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'mfn',
+                                                              'type' => '75'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'eventchn',
+                                                              'type' => '68'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx'
+                                                 },
+                                        'Return' => '4499',
+                                        'ShortName' => 'xs_introduce_domain',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1087'
+                                      },
+                            '9338' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 't',
+                                                              'type' => '3777'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'abort',
+                                                              'type' => '4499'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '4499',
+                                        'ShortName' => 'xs_transaction_end',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1070'
+                                      },
+                            '9495' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '3777',
+                                        'ShortName' => 'xs_transaction_start',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '1050'
+                                      },
+                            '9682' => {
+                                        'Header' => 'xenstore.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'h',
+                                                              'type' => '5580'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'path',
+                                                              'type' => '1777'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'token',
+                                                              'type' => '1777'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '4499',
+                                        'ShortName' => 'xs_unwatch',
+                                        'Source' => 'xs.c',
+                                        'SourceLine' => '983'
+                                      }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'xentoolcore__restrict_by_dup2_null@@VERS_1.0',
+                               '_ITM_registerTMCloneTable' => 'xentoolcore__restrict_by_dup2_null@@VERS_1.0',
+                               '_Jv_RegisterClasses' => 'xentoolcore__restrict_by_dup2_null@@VERS_1.0',
+                               '__gmon_start__' => 'xentoolcore__restrict_by_dup2_null@@VERS_1.0'
+                             },
+          'Symbols' => {
+                         'libxenstore.so.3.0.3' => {
+                                                     '_fini' => 1,
+                                                     '_init' => 1,
+                                                     'expanding_buffer_ensure' => 1,
+                                                     'sanitise_value' => 1,
+                                                     'unsanitise_value' => 1,
+                                                     'xs_check_watch' => 1,
+                                                     'xs_close' => 1,
+                                                     'xs_control_command' => 1,
+                                                     'xs_count_strings' => 1,
+                                                     'xs_daemon_close' => 1,
+                                                     'xs_daemon_destroy_postfork' => 1,
+                                                     'xs_daemon_open' => 1,
+                                                     'xs_daemon_open_readonly' => 1,
+                                                     'xs_daemon_rootdir' => 1,
+                                                     'xs_daemon_rundir' => 1,
+                                                     'xs_daemon_socket' => 1,
+                                                     'xs_daemon_socket_ro' => 1,
+                                                     'xs_daemon_tdb' => 1,
+                                                     'xs_debug_command' => 1,
+                                                     'xs_directory' => 1,
+                                                     'xs_domain_dev' => 1,
+                                                     'xs_domain_open' => 1,
+                                                     'xs_fileno' => 1,
+                                                     'xs_get_domain_path' => 1,
+                                                     'xs_get_permissions' => 1,
+                                                     'xs_introduce_domain' => 1,
+                                                     'xs_is_domain_introduced' => 1,
+                                                     'xs_mkdir' => 1,
+                                                     'xs_open' => 1,
+                                                     'xs_path_is_subpath' => 1,
+                                                     'xs_perm_to_string' => 1,
+                                                     'xs_read' => 1,
+                                                     'xs_read_watch' => 1,
+                                                     'xs_release_domain' => 1,
+                                                     'xs_restrict' => 1,
+                                                     'xs_resume_domain' => 1,
+                                                     'xs_rm' => 1,
+                                                     'xs_set_permissions' => 1,
+                                                     'xs_set_target' => 1,
+                                                     'xs_strings_to_perms' => 1,
+                                                     'xs_suspend_evtchn_port' => 1,
+                                                     'xs_transaction_end' => 1,
+                                                     'xs_transaction_start' => 1,
+                                                     'xs_unwatch' => 1,
+                                                     'xs_watch' => 1,
+                                                     'xs_write' => 1,
+                                                     'xs_write_all' => 1
+                                                   }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '103' => {
+                                     'Name' => 'long',
+                                     'Size' => '8',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '12799' => {
+                                       'BaseType' => '3704',
+                                       'Name' => 'struct xs_permissions*',
+                                       'Size' => '8',
+                                       'Type' => 'Pointer'
+                                     },
+                          '1777' => {
+                                      'BaseType' => '307',
+                                      'Name' => 'char const*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1800' => {
+                                      'BaseType' => '294',
+                                      'Name' => 'char**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1862' => {
+                                      'BaseType' => '1868',
+                                      'Name' => 'void const*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1868' => {
+                                      'BaseType' => '1',
+                                      'Name' => 'void const',
+                                      'Type' => 'Const'
+                                    },
+                          '209' => {
+                                     'BaseType' => '96',
+                                     'Name' => 'int[2]',
+                                     'Size' => '8',
+                                     'Type' => 'Array'
+                                   },
+                          '21313' => {
+                                       'BaseType' => '3704',
+                                       'Name' => 'struct xs_permissions const',
+                                       'Size' => '8',
+                                       'Type' => 'Const'
+                                     },
+                          '21550' => {
+                                       'BaseType' => '21313',
+                                       'Name' => 'struct xs_permissions const*',
+                                       'Size' => '8',
+                                       'Type' => 'Pointer'
+                                     },
+                          '259' => {
+                                     'BaseType' => '1',
+                                     'Name' => 'void*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '294' => {
+                                     'BaseType' => '300',
+                                     'Name' => 'char*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '300' => {
+                                     'Name' => 'char',
+                                     'Size' => '1',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '307' => {
+                                     'BaseType' => '300',
+                                     'Name' => 'char const',
+                                     'Size' => '1',
+                                     'Type' => 'Const'
+                                   },
+                          '312' => {
+                                     'BaseType' => '75',
+                                     'Header' => 'stddef.h',
+                                     'Line' => '216',
+                                     'Name' => 'size_t',
+                                     'Size' => '8',
+                                     'Type' => 'Typedef'
+                                   },
+                          '3287' => {
+                                      'BaseType' => '61',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '49',
+                                      'Name' => 'uint16_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3298' => {
+                                      'BaseType' => '68',
+                                      'Header' => 'stdint.h',
+                                      'Line' => '51',
+                                      'Name' => 'uint32_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3657' => {
+                                      'Header' => 'xenstore_lib.h',
+                                      'Line' => '30',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'XS_PERM_NONE',
+                                                           'value' => '0'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'XS_PERM_READ',
+                                                           'value' => '1'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'XS_PERM_WRITE',
+                                                           'value' => '2'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'XS_PERM_ENOENT_OK',
+                                                           'value' => '4'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'XS_PERM_OWNER',
+                                                           'value' => '8'
+                                                         }
+                                                },
+                                      'Name' => 'enum xs_perm_type',
+                                      'Size' => '4',
+                                      'Type' => 'Enum'
+                                    },
+                          '3704' => {
+                                      'Header' => 'xenstore_lib.h',
+                                      'Line' => '39',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'id',
+                                                           'offset' => '0',
+                                                           'type' => '68'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'perms',
+                                                           'offset' => '4',
+                                                           'type' => '3657'
+                                                         }
+                                                },
+                                      'Name' => 'struct xs_permissions',
+                                      'Size' => '8',
+                                      'Type' => 'Struct'
+                                    },
+                          '3740' => {
+                                      'Header' => 'xenstore_lib.h',
+                                      'Line' => '80',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'buf',
+                                                           'offset' => '0',
+                                                           'type' => '294'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'avail',
+                                                           'offset' => '8',
+                                                           'type' => '96'
+                                                         }
+                                                },
+                                      'Name' => 'struct expanding_buffer',
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '3777' => {
+                                      'BaseType' => '3298',
+                                      'Header' => 'xenstore.h',
+                                      'Line' => '51',
+                                      'Name' => 'xs_transaction_t',
+                                      'Size' => '4',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3788' => {
+                                      'Header' => 'list.h',
+                                      'Line' => '32',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'next',
+                                                           'offset' => '0',
+                                                           'type' => '3825'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'prev',
+                                                           'offset' => '8',
+                                                           'type' => '3825'
+                                                         }
+                                                },
+                                      'Name' => 'struct list_head',
+                                      'PrivateABI' => 1,
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '3825' => {
+                                      'BaseType' => '3788',
+                                      'Name' => 'struct list_head*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '3872' => {
+                                      'BaseType' => '68',
+                                      'Name' => 'unsigned int*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '3878' => {
+                                      'BaseType' => '3287',
+                                      'Header' => 'xen.h',
+                                      'Line' => '623',
+                                      'Name' => 'domid_t',
+                                      'Size' => '2',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3890' => {
+                                      'BaseType' => '3901',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '83',
+                                      'Name' => 'Xentoolcore__Active_Handle',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3901' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '88',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'restrict_callback',
+                                                           'offset' => '0',
+                                                           'type' => '4014'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'entry',
+                                                           'offset' => '8',
+                                                           'type' => '3975'
+                                                         }
+                                                },
+                                      'Name' => 'struct Xentoolcore__Active_Handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '24',
+                                      'Type' => 'Struct'
+                                    },
+                          '3938' => {
+                                      'BaseType' => '3949',
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '85',
+                                      'Name' => 'Xentoolcore__Restrict_Callback',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3949' => {
+                                      'Name' => 'int()(Xentoolcore__Active_Handle*, domid_t)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '3969'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '3878'
+                                                          }
+                                                 },
+                                      'Return' => '96',
+                                      'Type' => 'Func'
+                                    },
+                          '3969' => {
+                                      'BaseType' => '3890',
+                                      'Name' => 'Xentoolcore__Active_Handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '3975' => {
+                                      'Header' => 'xentoolcore_internal.h',
+                                      'Line' => '90',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'le_next',
+                                                           'offset' => '0',
+                                                           'type' => '3969'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'le_prev',
+                                                           'offset' => '8',
+                                                           'type' => '4008'
+                                                         }
+                                                },
+                                      'Name' => 'anon-struct-xentoolcore_internal.h-90',
+                                      'PrivateABI' => 1,
+                                      'Size' => '16',
+                                      'Type' => 'Struct'
+                                    },
+                          '4008' => {
+                                      'BaseType' => '3969',
+                                      'Name' => 'Xentoolcore__Active_Handle**',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '4014' => {
+                                      'BaseType' => '3938',
+                                      'Name' => 'Xentoolcore__Restrict_Callback*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '419' => {
+                                     'BaseType' => '75',
+                                     'Header' => 'pthreadtypes.h',
+                                     'Line' => '60',
+                                     'Name' => 'pthread_t',
+                                     'Size' => '8',
+                                     'Type' => 'Typedef'
+                                   },
+                          '4329' => {
+                                      'Line' => '56',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'fd',
+                                                           'offset' => '0',
+                                                           'type' => '96'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'tc_ah',
+                                                           'offset' => '8',
+                                                           'type' => '3890'
+                                                         },
+                                                  '10' => {
+                                                            'name' => 'reply_mutex',
+                                                            'offset' => '184',
+                                                            'type' => '713'
+                                                          },
+                                                  '11' => {
+                                                            'name' => 'reply_condvar',
+                                                            'offset' => '224',
+                                                            'type' => '901'
+                                                          },
+                                                  '12' => {
+                                                            'name' => 'request_mutex',
+                                                            'offset' => '272',
+                                                            'type' => '713'
+                                                          },
+                                                  '2' => {
+                                                           'name' => 'read_thr',
+                                                           'offset' => '32',
+                                                           'type' => '419'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'read_thr_exists',
+                                                           'offset' => '40',
+                                                           'type' => '96'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'watch_list',
+                                                           'offset' => '48',
+                                                           'type' => '3788'
+                                                         },
+                                                  '5' => {
+                                                           'name' => 'watch_mutex',
+                                                           'offset' => '64',
+                                                           'type' => '713'
+                                                         },
+                                                  '6' => {
+                                                           'name' => 'watch_condvar',
+                                                           'offset' => '104',
+                                                           'type' => '901'
+                                                         },
+                                                  '7' => {
+                                                           'name' => 'watch_pipe',
+                                                           'offset' => '152',
+                                                           'type' => '209'
+                                                         },
+                                                  '8' => {
+                                                           'name' => 'unwatch_filter',
+                                                           'offset' => '160',
+                                                           'type' => '4499'
+                                                         },
+                                                  '9' => {
+                                                           'name' => 'reply_list',
+                                                           'offset' => '168',
+                                                           'type' => '3788'
+                                                         }
+                                                },
+                                      'Name' => 'struct xs_handle',
+                                      'PrivateABI' => 1,
+                                      'Size' => '312',
+                                      'Source' => 'xs.c',
+                                      'Type' => 'Struct'
+                                    },
+                          '4499' => {
+                                      'Name' => '_Bool',
+                                      'Size' => '1',
+                                      'Type' => 'Intrinsic'
+                                    },
+                          '492' => {
+                                     'Header' => 'pthreadtypes.h',
+                                     'Line' => '75',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => '__prev',
+                                                          'offset' => '0',
+                                                          'type' => '529'
+                                                        },
+                                                 '1' => {
+                                                          'name' => '__next',
+                                                          'offset' => '8',
+                                                          'type' => '529'
+                                                        }
+                                               },
+                                     'Name' => 'struct __pthread_internal_list',
+                                     'PrivateABI' => 1,
+                                     'Size' => '16',
+                                     'Type' => 'Struct'
+                                   },
+                          '5164' => {
+                                      'BaseType' => '3740',
+                                      'Name' => 'struct expanding_buffer*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '529' => {
+                                     'BaseType' => '492',
+                                     'Name' => 'struct __pthread_internal_list*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '535' => {
+                                     'BaseType' => '492',
+                                     'Header' => 'pthreadtypes.h',
+                                     'Line' => '79',
+                                     'Name' => '__pthread_list_t',
+                                     'Size' => '16',
+                                     'Type' => 'Typedef'
+                                   },
+                          '546' => {
+                                     'Header' => 'pthreadtypes.h',
+                                     'Line' => '92',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => '__lock',
+                                                          'offset' => '0',
+                                                          'type' => '96'
+                                                        },
+                                                 '1' => {
+                                                          'name' => '__count',
+                                                          'offset' => '4',
+                                                          'type' => '68'
+                                                        },
+                                                 '2' => {
+                                                          'name' => '__owner',
+                                                          'offset' => '8',
+                                                          'type' => '96'
+                                                        },
+                                                 '3' => {
+                                                          'name' => '__nusers',
+                                                          'offset' => '12',
+                                                          'type' => '68'
+                                                        },
+                                                 '4' => {
+                                                          'name' => '__kind',
+                                                          'offset' => '16',
+                                                          'type' => '96'
+                                                        },
+                                                 '5' => {
+                                                          'name' => '__spins',
+                                                          'offset' => '20',
+                                                          'type' => '89'
+                                                        },
+                                                 '6' => {
+                                                          'name' => '__elision',
+                                                          'offset' => '22',
+                                                          'type' => '89'
+                                                        },
+                                                 '7' => {
+                                                          'name' => '__list',
+                                                          'offset' => '24',
+                                                          'type' => '535'
+                                                        }
+                                               },
+                                     'Name' => 'struct __pthread_mutex_s',
+                                     'PrivateABI' => 1,
+                                     'Size' => '40',
+                                     'Type' => 'Struct'
+                                   },
+                          '5580' => {
+                                      'BaseType' => '4329',
+                                      'Name' => 'struct xs_handle*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '61' => {
+                                    'Name' => 'unsigned short',
+                                    'Size' => '2',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '68' => {
+                                    'Name' => 'unsigned int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '697' => {
+                                     'BaseType' => '300',
+                                     'Name' => 'char[40]',
+                                     'Size' => '40',
+                                     'Type' => 'Array'
+                                   },
+                          '713' => {
+                                     'Header' => 'pthreadtypes.h',
+                                     'Line' => '128',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => '__data',
+                                                          'offset' => '0',
+                                                          'type' => '546'
+                                                        },
+                                                 '1' => {
+                                                          'name' => '__size',
+                                                          'offset' => '0',
+                                                          'type' => '697'
+                                                        },
+                                                 '2' => {
+                                                          'name' => '__align',
+                                                          'offset' => '0',
+                                                          'type' => '103'
+                                                        }
+                                               },
+                                     'Name' => 'union pthread_mutex_t',
+                                     'PrivateABI' => 1,
+                                     'Size' => '40',
+                                     'Type' => 'Union'
+                                   },
+                          '724' => {
+                                     'Header' => 'pthreadtypes.h',
+                                     'Line' => '141',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => '__lock',
+                                                          'offset' => '0',
+                                                          'type' => '96'
+                                                        },
+                                                 '1' => {
+                                                          'name' => '__futex',
+                                                          'offset' => '4',
+                                                          'type' => '68'
+                                                        },
+                                                 '2' => {
+                                                          'name' => '__total_seq',
+                                                          'offset' => '8',
+                                                          'type' => '829'
+                                                        },
+                                                 '3' => {
+                                                          'name' => '__wakeup_seq',
+                                                          'offset' => '16',
+                                                          'type' => '829'
+                                                        },
+                                                 '4' => {
+                                                          'name' => '__woken_seq',
+                                                          'offset' => '24',
+                                                          'type' => '829'
+                                                        },
+                                                 '5' => {
+                                                          'name' => '__mutex',
+                                                          'offset' => '32',
+                                                          'type' => '259'
+                                                        },
+                                                 '6' => {
+                                                          'name' => '__nwaiters',
+                                                          'offset' => '40',
+                                                          'type' => '68'
+                                                        },
+                                                 '7' => {
+                                                          'name' => '__broadcast_seq',
+                                                          'offset' => '44',
+                                                          'type' => '68'
+                                                        }
+                                               },
+                                     'Name' => 'anon-struct-pthreadtypes.h-141',
+                                     'PrivateABI' => 1,
+                                     'Size' => '48',
+                                     'Type' => 'Struct'
+                                   },
+                          '75' => {
+                                    'Name' => 'unsigned long',
+                                    'Size' => '8',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '829' => {
+                                     'Name' => 'unsigned long long',
+                                     'Size' => '8',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '878' => {
+                                     'BaseType' => '300',
+                                     'Name' => 'char[48]',
+                                     'Size' => '48',
+                                     'Type' => 'Array'
+                                   },
+                          '89' => {
+                                    'Name' => 'short',
+                                    'Size' => '2',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '894' => {
+                                     'Name' => 'long long',
+                                     'Size' => '8',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '901' => {
+                                     'Header' => 'pthreadtypes.h',
+                                     'Line' => '154',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => '__data',
+                                                          'offset' => '0',
+                                                          'type' => '724'
+                                                        },
+                                                 '1' => {
+                                                          'name' => '__size',
+                                                          'offset' => '0',
+                                                          'type' => '878'
+                                                        },
+                                                 '2' => {
+                                                          'name' => '__align',
+                                                          'offset' => '0',
+                                                          'type' => '894'
+                                                        }
+                                               },
+                                     'Name' => 'union pthread_cond_t',
+                                     'PrivateABI' => 1,
+                                     'Size' => '48',
+                                     'Type' => 'Union'
+                                   },
+                          '96' => {
+                                    'Name' => 'int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxenstore.so.3.0.3' => {
+                                                              '_ITM_deregisterTMCloneTable' => 0,
+                                                              '_ITM_registerTMCloneTable' => 0,
+                                                              '_Jv_RegisterClasses' => 0,
+                                                              '__assert_fail@GLIBC_2.2.5' => 0,
+                                                              '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                              '__errno_location@GLIBC_2.2.5' => 0,
+                                                              '__gmon_start__' => 0,
+                                                              '__pthread_register_cancel@GLIBC_2.3.3' => 0,
+                                                              '__pthread_unregister_cancel@GLIBC_2.3.3' => 0,
+                                                              '__pthread_unwind_next@GLIBC_2.3.3' => 0,
+                                                              '__sigsetjmp@GLIBC_2.2.5' => 0,
+                                                              '__strdup@GLIBC_2.2.5' => 0,
+                                                              '__xstat@GLIBC_2.2.5' => 0,
+                                                              'access@GLIBC_2.2.5' => 0,
+                                                              'close@GLIBC_2.2.5' => 0,
+                                                              'connect@GLIBC_2.2.5' => 0,
+                                                              'dlsym@GLIBC_2.2.5' => 0,
+                                                              'fcntl@GLIBC_2.2.5' => 0,
+                                                              'free@GLIBC_2.2.5' => 0,
+                                                              'getenv@GLIBC_2.2.5' => 0,
+                                                              'malloc@GLIBC_2.2.5' => 0,
+                                                              'memcmp@GLIBC_2.2.5' => 0,
+                                                              'memcpy@GLIBC_2.14' => 0,
+                                                              'open@GLIBC_2.2.5' => 0,
+                                                              'pipe@GLIBC_2.2.5' => 0,
+                                                              'pthread_attr_destroy@GLIBC_2.2.5' => 0,
+                                                              'pthread_attr_init@GLIBC_2.2.5' => 0,
+                                                              'pthread_attr_setstacksize@GLIBC_2.2.5' => 0,
+                                                              'pthread_cancel@GLIBC_2.2.5' => 0,
+                                                              'pthread_cond_broadcast@GLIBC_2.3.2' => 0,
+                                                              'pthread_cond_init@GLIBC_2.3.2' => 0,
+                                                              'pthread_cond_signal@GLIBC_2.3.2' => 0,
+                                                              'pthread_cond_wait@GLIBC_2.3.2' => 0,
+                                                              'pthread_create@GLIBC_2.2.5' => 0,
+                                                              'pthread_join@GLIBC_2.2.5' => 0,
+                                                              'pthread_mutex_init@GLIBC_2.2.5' => 0,
+                                                              'pthread_mutex_lock@GLIBC_2.2.5' => 0,
+                                                              'pthread_mutex_unlock@GLIBC_2.2.5' => 0,
+                                                              'pthread_sigmask@GLIBC_2.2.5' => 0,
+                                                              'read@GLIBC_2.2.5' => 0,
+                                                              'realloc@GLIBC_2.2.5' => 0,
+                                                              'sigaction@GLIBC_2.2.5' => 0,
+                                                              'sigemptyset@GLIBC_2.2.5' => 0,
+                                                              'sigfillset@GLIBC_2.2.5' => 0,
+                                                              'snprintf@GLIBC_2.2.5' => 0,
+                                                              'socket@GLIBC_2.2.5' => 0,
+                                                              'sprintf@GLIBC_2.2.5' => 0,
+                                                              'sscanf@GLIBC_2.2.5' => 0,
+                                                              'strcmp@GLIBC_2.2.5' => 0,
+                                                              'strcpy@GLIBC_2.2.5' => 0,
+                                                              'strncpy@GLIBC_2.2.5' => 0,
+                                                              'strtol@GLIBC_2.2.5' => 0,
+                                                              'strtoul@GLIBC_2.2.5' => 0,
+                                                              'write@GLIBC_2.2.5' => 0,
+                                                              'xentoolcore__deregister_active_handle@VERS_1.0' => 0,
+                                                              'xentoolcore__register_active_handle@VERS_1.0' => 0,
+                                                              'xentoolcore__restrict_by_dup2_null@VERS_1.0' => 0
+                                                            }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump b/tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump
new file mode 100644
index 0000000000..d47e757e43
--- /dev/null
+++ b/tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump
@@ -0,0 +1,239 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xentoolcore.h' => 1,
+                         'xentoolcore_internal.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxentoolcore.so.1.0',
+          'LibraryVersion' => '1.0',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libpthread.so.0' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'handlereg.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '1090' => {
+                                        'Header' => 'xentoolcore_internal.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'ah',
+                                                              'type' => '232'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xentoolcore__deregister_active_handle',
+                                        'Source' => 'handlereg.c',
+                                        'SourceLine' => '52'
+                                      },
+                            '1160' => {
+                                        'Header' => 'xentoolcore_internal.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'ah',
+                                                              'type' => '232'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xentoolcore__register_active_handle',
+                                        'Source' => 'handlereg.c',
+                                        'SourceLine' => '46'
+                                      },
+                            '742' => {
+                                       'Header' => 'xentoolcore_internal.h',
+                                       'Param' => {
+                                                    '0' => {
+                                                             'name' => 'fd',
+                                                             'type' => '63'
+                                                           }
+                                                  },
+                                       'Reg' => {
+                                                  '0' => 'rdi'
+                                                },
+                                       'Return' => '63',
+                                       'ShortName' => 'xentoolcore__restrict_by_dup2_null',
+                                       'Source' => 'handlereg.c',
+                                       'SourceLine' => '74'
+                                     },
+                            '943' => {
+                                       'Header' => 'xentoolcore.h',
+                                       'Param' => {
+                                                    '0' => {
+                                                             'name' => 'domid',
+                                                             'type' => '141'
+                                                           }
+                                                  },
+                                       'Reg' => {
+                                                  '0' => 'rdi'
+                                                },
+                                       'Return' => '63',
+                                       'ShortName' => 'xentoolcore_restrict_all',
+                                       'Source' => 'handlereg.c',
+                                       'SourceLine' => '58'
+                                     }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'pthread_mutex_unlock@@GLIBC_2.2.5',
+                               '_ITM_registerTMCloneTable' => 'pthread_mutex_unlock@@GLIBC_2.2.5',
+                               '_Jv_RegisterClasses' => 'pthread_mutex_unlock@@GLIBC_2.2.5',
+                               '__gmon_start__' => 'pthread_mutex_unlock@@GLIBC_2.2.5',
+                               'xentoolcore__deregister_active_handle' => 'xentoolcore__deregister_active_handle@@VERS_1.0',
+                               'xentoolcore__register_active_handle' => 'xentoolcore__register_active_handle@@VERS_1.0',
+                               'xentoolcore__restrict_by_dup2_null' => 'xentoolcore__restrict_by_dup2_null@@VERS_1.0',
+                               'xentoolcore_restrict_all' => 'xentoolcore_restrict_all@@VERS_1.0'
+                             },
+          'Symbols' => {
+                         'libxentoolcore.so.1.0' => {
+                                                      'xentoolcore__deregister_active_handle@@VERS_1.0' => 1,
+                                                      'xentoolcore__register_active_handle@@VERS_1.0' => 1,
+                                                      'xentoolcore__restrict_by_dup2_null@@VERS_1.0' => 1,
+                                                      'xentoolcore_restrict_all@@VERS_1.0' => 1
+                                                    }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '102' => {
+                                     'Name' => 'unsigned short',
+                                     'Size' => '2',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '141' => {
+                                     'BaseType' => '91',
+                                     'Header' => 'xen.h',
+                                     'Line' => '623',
+                                     'Name' => 'domid_t',
+                                     'Size' => '2',
+                                     'Type' => 'Typedef'
+                                   },
+                          '153' => {
+                                     'BaseType' => '164',
+                                     'Header' => 'xentoolcore_internal.h',
+                                     'Line' => '83',
+                                     'Name' => 'Xentoolcore__Active_Handle',
+                                     'Size' => '24',
+                                     'Type' => 'Typedef'
+                                   },
+                          '164' => {
+                                     'Header' => 'xentoolcore_internal.h',
+                                     'Line' => '88',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'restrict_callback',
+                                                          'offset' => '0',
+                                                          'type' => '277'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'entry',
+                                                          'offset' => '8',
+                                                          'type' => '238'
+                                                        }
+                                               },
+                                     'Name' => 'struct Xentoolcore__Active_Handle',
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '201' => {
+                                     'BaseType' => '212',
+                                     'Header' => 'xentoolcore_internal.h',
+                                     'Line' => '85',
+                                     'Name' => 'Xentoolcore__Restrict_Callback',
+                                     'Type' => 'Typedef'
+                                   },
+                          '212' => {
+                                     'Name' => 'int()(Xentoolcore__Active_Handle*, domid_t)',
+                                     'Param' => {
+                                                  '0' => {
+                                                           'type' => '232'
+                                                         },
+                                                  '1' => {
+                                                           'type' => '141'
+                                                         }
+                                                },
+                                     'Return' => '63',
+                                     'Type' => 'Func'
+                                   },
+                          '232' => {
+                                     'BaseType' => '153',
+                                     'Name' => 'Xentoolcore__Active_Handle*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '238' => {
+                                     'Header' => 'xentoolcore_internal.h',
+                                     'Line' => '90',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'le_next',
+                                                          'offset' => '0',
+                                                          'type' => '232'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'le_prev',
+                                                          'offset' => '8',
+                                                          'type' => '271'
+                                                        }
+                                               },
+                                     'Name' => 'anon-struct-xentoolcore_internal.h-90',
+                                     'Size' => '16',
+                                     'Type' => 'Struct'
+                                   },
+                          '271' => {
+                                     'BaseType' => '232',
+                                     'Name' => 'Xentoolcore__Active_Handle**',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '277' => {
+                                     'BaseType' => '201',
+                                     'Name' => 'Xentoolcore__Restrict_Callback*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '63' => {
+                                    'Name' => 'int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '91' => {
+                                    'BaseType' => '102',
+                                    'Header' => 'stdint.h',
+                                    'Line' => '49',
+                                    'Name' => 'uint16_t',
+                                    'Size' => '2',
+                                    'Type' => 'Typedef'
+                                  }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxentoolcore.so.1.0' => {
+                                                               '_ITM_deregisterTMCloneTable' => 0,
+                                                               '_ITM_registerTMCloneTable' => 0,
+                                                               '_Jv_RegisterClasses' => 0,
+                                                               '__assert_fail@GLIBC_2.2.5' => 0,
+                                                               '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                               '__gmon_start__' => 0,
+                                                               'close@GLIBC_2.2.5' => 0,
+                                                               'dup2@GLIBC_2.2.5' => 0,
+                                                               'open@GLIBC_2.2.5' => 0,
+                                                               'pthread_mutex_lock@GLIBC_2.2.5' => 0,
+                                                               'pthread_mutex_unlock@GLIBC_2.2.5' => 0
+                                                             }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dump b/tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dump
new file mode 100644
index 0000000000..9f6a82ec98
--- /dev/null
+++ b/tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dump
@@ -0,0 +1,882 @@
+$VAR1 = {
+          'ABI_DUMPER_VERSION' => '0.99.16',
+          'ABI_DUMP_VERSION' => '3.2',
+          'Arch' => 'x86_64',
+          'GccVersion' => '6.3.0',
+          'Headers' => {
+                         'xentoollog.h' => 1
+                       },
+          'Language' => 'C',
+          'LibraryName' => 'libxentoollog.so.1.0',
+          'LibraryVersion' => '1.0',
+          'NameSpaces' => {},
+          'Needed' => {
+                        'libc.so.6' => 1,
+                        'libpthread.so.0' => 1
+                      },
+          'PublicABI' => '1',
+          'Sources' => {
+                         'xtl_core.c' => 1,
+                         'xtl_logger_stdio.c' => 1
+                       },
+          'SymbolInfo' => {
+                            '1176' => {
+                                        'Header' => 'xentoollog.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '5234'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xtl_logger_destroy',
+                                        'Source' => 'xtl_core.c',
+                                        'SourceLine' => '80'
+                                      },
+                            '1238' => {
+                                        'Header' => 'xentoollog.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '5234'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'context',
+                                                              'type' => '790'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'doing_what',
+                                                              'type' => '790'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'done',
+                                                              'type' => '60'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'total',
+                                                              'type' => '60'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xtl_progress',
+                                        'Source' => 'xtl_core.c',
+                                        'SourceLine' => '65'
+                                      },
+                            '1388' => {
+                                        'Header' => 'xentoollog.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '5234'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'level',
+                                                              'type' => '966'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'errnoval',
+                                                              'type' => '102'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'context',
+                                                              'type' => '790'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'format',
+                                                              'type' => '790'
+                                                            },
+                                                     '5' => {
+                                                              'type' => '-1'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xtl_log',
+                                        'Source' => 'xtl_core.c',
+                                        'SourceLine' => '53'
+                                      },
+                            '1529' => {
+                                        'Header' => 'xentoollog.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'logger',
+                                                              'type' => '5234'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'level',
+                                                              'type' => '966'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'errnoval',
+                                                              'type' => '102'
+                                                            },
+                                                     '3' => {
+                                                              'name' => 'context',
+                                                              'type' => '790'
+                                                            },
+                                                     '4' => {
+                                                              'name' => 'format',
+                                                              'type' => '790'
+                                                            },
+                                                     '5' => {
+                                                              'name' => 'al',
+                                                              'type' => '1068'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx',
+                                                   '3' => 'rcx',
+                                                   '4' => 'r8',
+                                                   '5' => 'r9'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xtl_logv',
+                                        'Source' => 'xtl_core.c',
+                                        'SourceLine' => '41'
+                                      },
+                            '1830' => {
+                                        'Header' => 'xentoollog.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'level',
+                                                              'type' => '966'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi'
+                                                 },
+                                        'Return' => '790',
+                                        'ShortName' => 'xtl_level_to_string',
+                                        'Source' => 'xtl_core.c',
+                                        'SourceLine' => '36'
+                                      },
+                            '3611' => {
+                                        'Header' => 'xentoollog.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'f',
+                                                              'type' => '3598'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'min_level',
+                                                              'type' => '966'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'flags',
+                                                              'type' => '81'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '3869',
+                                        'ShortName' => 'xtl_createlogger_stdiostream',
+                                        'Source' => 'xtl_logger_stdio.c',
+                                        'SourceLine' => '166'
+                                      },
+                            '3875' => {
+                                        'Header' => 'xentoollog.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'lg',
+                                                              'type' => '3869'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'set_flags',
+                                                              'type' => '81'
+                                                            },
+                                                     '2' => {
+                                                              'name' => 'clear_flags',
+                                                              'type' => '81'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi',
+                                                   '2' => 'rdx'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xtl_stdiostream_adjust_flags',
+                                        'Source' => 'xtl_logger_stdio.c',
+                                        'SourceLine' => '158'
+                                      },
+                            '3977' => {
+                                        'Header' => 'xentoollog.h',
+                                        'Param' => {
+                                                     '0' => {
+                                                              'name' => 'lg',
+                                                              'type' => '3869'
+                                                            },
+                                                     '1' => {
+                                                              'name' => 'min_level',
+                                                              'type' => '966'
+                                                            }
+                                                   },
+                                        'Reg' => {
+                                                   '0' => 'rdi',
+                                                   '1' => 'rsi'
+                                                 },
+                                        'Return' => '1',
+                                        'ShortName' => 'xtl_stdiostream_set_minlevel',
+                                        'Source' => 'xtl_logger_stdio.c',
+                                        'SourceLine' => '153'
+                                      }
+                          },
+          'SymbolVersion' => {
+                               '_ITM_deregisterTMCloneTable' => 'vfprintf@@GLIBC_2.2.5',
+                               '_ITM_registerTMCloneTable' => 'vfprintf@@GLIBC_2.2.5',
+                               '_Jv_RegisterClasses' => 'vfprintf@@GLIBC_2.2.5',
+                               '__gmon_start__' => 'vfprintf@@GLIBC_2.2.5',
+                               'xtl_createlogger_stdiostream' => 'xtl_createlogger_stdiostream@@VERS_1.0',
+                               'xtl_level_to_string' => 'xtl_level_to_string@@VERS_1.0',
+                               'xtl_log' => 'xtl_log@@VERS_1.0',
+                               'xtl_logger_destroy' => 'xtl_logger_destroy@@VERS_1.0',
+                               'xtl_logv' => 'xtl_logv@@VERS_1.0',
+                               'xtl_progress' => 'xtl_progress@@VERS_1.0',
+                               'xtl_stdiostream_adjust_flags' => 'xtl_stdiostream_adjust_flags@@VERS_1.0',
+                               'xtl_stdiostream_set_minlevel' => 'xtl_stdiostream_set_minlevel@@VERS_1.0'
+                             },
+          'Symbols' => {
+                         'libxentoollog.so.1.0' => {
+                                                     'xtl_createlogger_stdiostream@@VERS_1.0' => 1,
+                                                     'xtl_level_to_string@@VERS_1.0' => 1,
+                                                     'xtl_log@@VERS_1.0' => 1,
+                                                     'xtl_logger_destroy@@VERS_1.0' => 1,
+                                                     'xtl_logv@@VERS_1.0' => 1,
+                                                     'xtl_progress@@VERS_1.0' => 1,
+                                                     'xtl_stdiostream_adjust_flags@@VERS_1.0' => 1,
+                                                     'xtl_stdiostream_set_minlevel@@VERS_1.0' => 1
+                                                   }
+                       },
+          'Target' => 'unix',
+          'TypeInfo' => {
+                          '-1' => {
+                                    'Name' => '...',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '1' => {
+                                   'Name' => 'void',
+                                   'Type' => 'Intrinsic'
+                                 },
+                          '102' => {
+                                     'Name' => 'int',
+                                     'Size' => '4',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1068' => {
+                                      'BaseType' => '582',
+                                      'Name' => 'struct __va_list_tag*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '1074' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, xentoollog_level, int, char const*, char const*, struct __va_list_tag*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '5234'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '966'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '102'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '790'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '790'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '1068'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '109' => {
+                                     'Name' => 'long',
+                                     'Size' => '8',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '1116' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*, char const*, char const*, int, unsigned long, unsigned long)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '5234'
+                                                          },
+                                                   '1' => {
+                                                            'type' => '790'
+                                                          },
+                                                   '2' => {
+                                                            'type' => '790'
+                                                          },
+                                                   '3' => {
+                                                            'type' => '102'
+                                                          },
+                                                   '4' => {
+                                                            'type' => '60'
+                                                          },
+                                                   '5' => {
+                                                            'type' => '60'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '1133' => {
+                                      'Name' => 'void(*)(struct xentoollog_logger*)',
+                                      'Param' => {
+                                                   '0' => {
+                                                            'type' => '5234'
+                                                          }
+                                                 },
+                                      'Return' => '1',
+                                      'Size' => '8',
+                                      'Type' => 'FuncPtr'
+                                    },
+                          '116' => {
+                                     'BaseType' => '109',
+                                     'Header' => 'types.h',
+                                     'Line' => '131',
+                                     'Name' => '__off_t',
+                                     'Size' => '8',
+                                     'Type' => 'Typedef'
+                                   },
+                          '127' => {
+                                     'BaseType' => '109',
+                                     'Header' => 'types.h',
+                                     'Line' => '132',
+                                     'Name' => '__off64_t',
+                                     'Size' => '8',
+                                     'Type' => 'Typedef'
+                                   },
+                          '145' => {
+                                     'BaseType' => '1',
+                                     'Name' => 'void*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '147' => {
+                                     'BaseType' => '153',
+                                     'Name' => 'char*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '153' => {
+                                     'Name' => 'char',
+                                     'Size' => '1',
+                                     'Type' => 'Intrinsic'
+                                   },
+                          '160' => {
+                                     'BaseType' => '153',
+                                     'Name' => 'char const',
+                                     'Size' => '1',
+                                     'Type' => 'Const'
+                                   },
+                          '165' => {
+                                     'Header' => 'libio.h',
+                                     'Line' => '241',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => '_flags',
+                                                          'offset' => '0',
+                                                          'type' => '102'
+                                                        },
+                                                 '1' => {
+                                                          'name' => '_IO_read_ptr',
+                                                          'offset' => '8',
+                                                          'type' => '147'
+                                                        },
+                                                 '10' => {
+                                                           'name' => '_IO_backup_base',
+                                                           'offset' => '80',
+                                                           'type' => '147'
+                                                         },
+                                                 '11' => {
+                                                           'name' => '_IO_save_end',
+                                                           'offset' => '88',
+                                                           'type' => '147'
+                                                         },
+                                                 '12' => {
+                                                           'name' => '_markers',
+                                                           'offset' => '96',
+                                                           'type' => '699'
+                                                         },
+                                                 '13' => {
+                                                           'name' => '_chain',
+                                                           'offset' => '104',
+                                                           'type' => '705'
+                                                         },
+                                                 '14' => {
+                                                           'name' => '_fileno',
+                                                           'offset' => '112',
+                                                           'type' => '102'
+                                                         },
+                                                 '15' => {
+                                                           'name' => '_flags2',
+                                                           'offset' => '116',
+                                                           'type' => '102'
+                                                         },
+                                                 '16' => {
+                                                           'name' => '_old_offset',
+                                                           'offset' => '120',
+                                                           'type' => '116'
+                                                         },
+                                                 '17' => {
+                                                           'name' => '_cur_column',
+                                                           'offset' => '128',
+                                                           'type' => '74'
+                                                         },
+                                                 '18' => {
+                                                           'name' => '_vtable_offset',
+                                                           'offset' => '130',
+                                                           'type' => '88'
+                                                         },
+                                                 '19' => {
+                                                           'name' => '_shortbuf',
+                                                           'offset' => '131',
+                                                           'type' => '711'
+                                                         },
+                                                 '2' => {
+                                                          'name' => '_IO_read_end',
+                                                          'offset' => '16',
+                                                          'type' => '147'
+                                                        },
+                                                 '20' => {
+                                                           'name' => '_lock',
+                                                           'offset' => '136',
+                                                           'type' => '727'
+                                                         },
+                                                 '21' => {
+                                                           'name' => '_offset',
+                                                           'offset' => '144',
+                                                           'type' => '127'
+                                                         },
+                                                 '22' => {
+                                                           'name' => '__pad1',
+                                                           'offset' => '152',
+                                                           'type' => '145'
+                                                         },
+                                                 '23' => {
+                                                           'name' => '__pad2',
+                                                           'offset' => '160',
+                                                           'type' => '145'
+                                                         },
+                                                 '24' => {
+                                                           'name' => '__pad3',
+                                                           'offset' => '168',
+                                                           'type' => '145'
+                                                         },
+                                                 '25' => {
+                                                           'name' => '__pad4',
+                                                           'offset' => '176',
+                                                           'type' => '145'
+                                                         },
+                                                 '26' => {
+                                                           'name' => '__pad5',
+                                                           'offset' => '184',
+                                                           'type' => '49'
+                                                         },
+                                                 '27' => {
+                                                           'name' => '_mode',
+                                                           'offset' => '192',
+                                                           'type' => '102'
+                                                         },
+                                                 '28' => {
+                                                           'name' => '_unused2',
+                                                           'offset' => '196',
+                                                           'type' => '733'
+                                                         },
+                                                 '3' => {
+                                                          'name' => '_IO_read_base',
+                                                          'offset' => '24',
+                                                          'type' => '147'
+                                                        },
+                                                 '4' => {
+                                                          'name' => '_IO_write_base',
+                                                          'offset' => '32',
+                                                          'type' => '147'
+                                                        },
+                                                 '5' => {
+                                                          'name' => '_IO_write_ptr',
+                                                          'offset' => '40',
+                                                          'type' => '147'
+                                                        },
+                                                 '6' => {
+                                                          'name' => '_IO_write_end',
+                                                          'offset' => '48',
+                                                          'type' => '147'
+                                                        },
+                                                 '7' => {
+                                                          'name' => '_IO_buf_base',
+                                                          'offset' => '56',
+                                                          'type' => '147'
+                                                        },
+                                                 '8' => {
+                                                          'name' => '_IO_buf_end',
+                                                          'offset' => '64',
+                                                          'type' => '147'
+                                                        },
+                                                 '9' => {
+                                                          'name' => '_IO_save_base',
+                                                          'offset' => '72',
+                                                          'type' => '147'
+                                                        }
+                                               },
+                                     'Name' => 'struct _IO_FILE',
+                                     'PrivateABI' => 1,
+                                     'Size' => '216',
+                                     'Type' => 'Struct'
+                                   },
+                          '2177' => {
+                                      'BaseType' => '165',
+                                      'Header' => 'stdio.h',
+                                      'Line' => '48',
+                                      'Name' => 'FILE',
+                                      'Size' => '216',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3000' => {
+                                      'BaseType' => '977',
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '44',
+                                      'Name' => 'xentoollog_logger',
+                                      'Size' => '24',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3173' => {
+                                      'BaseType' => '3184',
+                                      'Header' => 'xentoollog.h',
+                                      'Line' => '73',
+                                      'Name' => 'xentoollog_logger_stdiostream',
+                                      'Size' => '56',
+                                      'Type' => 'Typedef'
+                                    },
+                          '3184' => {
+                                      'Line' => '32',
+                                      'Memb' => {
+                                                  '0' => {
+                                                           'name' => 'vtable',
+                                                           'offset' => '0',
+                                                           'type' => '3000'
+                                                         },
+                                                  '1' => {
+                                                           'name' => 'f',
+                                                           'offset' => '24',
+                                                           'type' => '3598'
+                                                         },
+                                                  '2' => {
+                                                           'name' => 'min_level',
+                                                           'offset' => '32',
+                                                           'type' => '966'
+                                                         },
+                                                  '3' => {
+                                                           'name' => 'flags',
+                                                           'offset' => '36',
+                                                           'type' => '81'
+                                                         },
+                                                  '4' => {
+                                                           'name' => 'progress_erase_len',
+                                                           'offset' => '40',
+                                                           'type' => '102'
+                                                         },
+                                                  '5' => {
+                                                           'name' => 'progress_last_percent',
+                                                           'offset' => '44',
+                                                           'type' => '102'
+                                                         },
+                                                  '6' => {
+                                                           'name' => 'progress_use_cr',
+                                                           'offset' => '48',
+                                                           'type' => '3604'
+                                                         }
+                                                },
+                                      'Name' => 'struct xentoollog_logger_stdiostream',
+                                      'PrivateABI' => 1,
+                                      'Size' => '56',
+                                      'Source' => 'xtl_logger_stdio.c',
+                                      'Type' => 'Struct'
+                                    },
+                          '3598' => {
+                                      'BaseType' => '2177',
+                                      'Name' => 'FILE*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '3604' => {
+                                      'Name' => '_Bool',
+                                      'Size' => '1',
+                                      'Type' => 'Intrinsic'
+                                    },
+                          '3869' => {
+                                      'BaseType' => '3173',
+                                      'Name' => 'xentoollog_logger_stdiostream*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '49' => {
+                                    'BaseType' => '60',
+                                    'Header' => 'stddef.h',
+                                    'Line' => '216',
+                                    'Name' => 'size_t',
+                                    'Size' => '8',
+                                    'Type' => 'Typedef'
+                                  },
+                          '5234' => {
+                                      'BaseType' => '3000',
+                                      'Name' => 'xentoollog_logger*',
+                                      'Size' => '8',
+                                      'Type' => 'Pointer'
+                                    },
+                          '582' => {
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'gp_offset',
+                                                          'offset' => '0',
+                                                          'type' => '81'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'fp_offset',
+                                                          'offset' => '4',
+                                                          'type' => '81'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'overflow_arg_area',
+                                                          'offset' => '8',
+                                                          'type' => '145'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'reg_save_area',
+                                                          'offset' => '16',
+                                                          'type' => '145'
+                                                        }
+                                               },
+                                     'Name' => 'struct __va_list_tag',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '60' => {
+                                    'Name' => 'unsigned long',
+                                    'Size' => '8',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '643' => {
+                                     'Header' => 'libio.h',
+                                     'Line' => '150',
+                                     'Name' => '_IO_lock_t',
+                                     'Type' => 'Typedef'
+                                   },
+                          '650' => {
+                                     'Header' => 'libio.h',
+                                     'Line' => '156',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => '_next',
+                                                          'offset' => '0',
+                                                          'type' => '699'
+                                                        },
+                                                 '1' => {
+                                                          'name' => '_sbuf',
+                                                          'offset' => '8',
+                                                          'type' => '705'
+                                                        },
+                                                 '2' => {
+                                                          'name' => '_pos',
+                                                          'offset' => '16',
+                                                          'type' => '102'
+                                                        }
+                                               },
+                                     'Name' => 'struct _IO_marker',
+                                     'PrivateABI' => 1,
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   },
+                          '699' => {
+                                     'BaseType' => '650',
+                                     'Name' => 'struct _IO_marker*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '705' => {
+                                     'BaseType' => '165',
+                                     'Name' => 'struct _IO_FILE*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '711' => {
+                                     'BaseType' => '153',
+                                     'Name' => 'char[1]',
+                                     'Size' => '1',
+                                     'Type' => 'Array'
+                                   },
+                          '727' => {
+                                     'BaseType' => '643',
+                                     'Name' => '_IO_lock_t*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '733' => {
+                                     'BaseType' => '153',
+                                     'Name' => 'char[20]',
+                                     'Size' => '20',
+                                     'Type' => 'Array'
+                                   },
+                          '74' => {
+                                    'Name' => 'unsigned short',
+                                    'Size' => '2',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '790' => {
+                                     'BaseType' => '160',
+                                     'Name' => 'char const*',
+                                     'Size' => '8',
+                                     'Type' => 'Pointer'
+                                   },
+                          '81' => {
+                                    'Name' => 'unsigned int',
+                                    'Size' => '4',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '88' => {
+                                    'Name' => 'signed char',
+                                    'Size' => '1',
+                                    'Type' => 'Intrinsic'
+                                  },
+                          '883' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '30',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'XTL_NONE',
+                                                          'value' => '0'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'XTL_DEBUG',
+                                                          'value' => '1'
+                                                        },
+                                                 '10' => {
+                                                           'name' => 'XTL_NUM_LEVELS',
+                                                           'value' => '10'
+                                                         },
+                                                 '2' => {
+                                                          'name' => 'XTL_VERBOSE',
+                                                          'value' => '2'
+                                                        },
+                                                 '3' => {
+                                                          'name' => 'XTL_DETAIL',
+                                                          'value' => '3'
+                                                        },
+                                                 '4' => {
+                                                          'name' => 'XTL_PROGRESS',
+                                                          'value' => '4'
+                                                        },
+                                                 '5' => {
+                                                          'name' => 'XTL_INFO',
+                                                          'value' => '5'
+                                                        },
+                                                 '6' => {
+                                                          'name' => 'XTL_NOTICE',
+                                                          'value' => '6'
+                                                        },
+                                                 '7' => {
+                                                          'name' => 'XTL_WARN',
+                                                          'value' => '7'
+                                                        },
+                                                 '8' => {
+                                                          'name' => 'XTL_ERROR',
+                                                          'value' => '8'
+                                                        },
+                                                 '9' => {
+                                                          'name' => 'XTL_CRITICAL',
+                                                          'value' => '9'
+                                                        }
+                                               },
+                                     'Name' => 'enum xentoollog_level',
+                                     'Size' => '4',
+                                     'Type' => 'Enum'
+                                   },
+                          '966' => {
+                                     'BaseType' => '883',
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '42',
+                                     'Name' => 'xentoollog_level',
+                                     'Size' => '4',
+                                     'Type' => 'Typedef'
+                                   },
+                          '977' => {
+                                     'Header' => 'xentoollog.h',
+                                     'Line' => '45',
+                                     'Memb' => {
+                                                 '0' => {
+                                                          'name' => 'vmessage',
+                                                          'offset' => '0',
+                                                          'type' => '1074'
+                                                        },
+                                                 '1' => {
+                                                          'name' => 'progress',
+                                                          'offset' => '8',
+                                                          'type' => '1116'
+                                                        },
+                                                 '2' => {
+                                                          'name' => 'destroy',
+                                                          'offset' => '16',
+                                                          'type' => '1133'
+                                                        }
+                                               },
+                                     'Name' => 'struct xentoollog_logger',
+                                     'Size' => '24',
+                                     'Type' => 'Struct'
+                                   }
+                        },
+          'UndefinedSymbols' => {
+                                  'libxentoollog.so.1.0' => {
+                                                              '_IO_putc@GLIBC_2.2.5' => 0,
+                                                              '_ITM_deregisterTMCloneTable' => 0,
+                                                              '_ITM_registerTMCloneTable' => 0,
+                                                              '_Jv_RegisterClasses' => 0,
+                                                              '__assert_fail@GLIBC_2.2.5' => 0,
+                                                              '__cxa_finalize@GLIBC_2.2.5' => 0,
+                                                              '__errno_location@GLIBC_2.2.5' => 0,
+                                                              '__gmon_start__' => 0,
+                                                              '__tzname@GLIBC_2.2.5' => 0,
+                                                              'fflush@GLIBC_2.2.5' => 0,
+                                                              'fileno@GLIBC_2.2.5' => 0,
+                                                              'fprintf@GLIBC_2.2.5' => 0,
+                                                              'free@GLIBC_2.2.5' => 0,
+                                                              'getpid@GLIBC_2.2.5' => 0,
+                                                              'isatty@GLIBC_2.2.5' => 0,
+                                                              'localtime_r@GLIBC_2.2.5' => 0,
+                                                              'malloc@GLIBC_2.2.5' => 0,
+                                                              'strerror@GLIBC_2.2.5' => 0,
+                                                              'time@GLIBC_2.2.5' => 0,
+                                                              'tzname@GLIBC_2.2.5' => 0,
+                                                              'tzset@GLIBC_2.2.5' => 0,
+                                                              'vfprintf@GLIBC_2.2.5' => 0
+                                                            }
+                                },
+          'WordSize' => '8'
+        };
diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 4ed201b3b3..37a7db5395 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   += solaris.c
 SRCS-$(CONFIG_NetBSD)  += netbsd.c
 SRCS-$(CONFIG_MiniOS)  += minios.c
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.1.2-$(XEN_TARGET_ARCH)-abi.dump
+
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index 3e50ff6d90..95161ae123 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   += compat.c
 SRCS-$(CONFIG_NetBSD)  += compat.c
 SRCS-$(CONFIG_MiniOS)  += compat.c
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.1.3-$(XEN_TARGET_ARCH)-abi.dump
+
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index b8c37b5b97..300d131f74 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   += solaris.c
 SRCS-$(CONFIG_NetBSD)  += netbsd.c
 SRCS-$(CONFIG_MiniOS)  += minios.c
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.1.1-$(XEN_TARGET_ARCH)-abi.dump
+
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 0eb9a3a712..3f2388cf79 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   += compat.c solaris.c
 SRCS-$(CONFIG_NetBSD)  += netbsd.c
 SRCS-$(CONFIG_MiniOS)  += minios.c
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.1.3-$(XEN_TARGET_ARCH)-abi.dump
+
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index ae390ce60f..a4c7abe0c5 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -13,4 +13,6 @@ SRCS-$(CONFIG_FreeBSD) += $(SRCS-GNTTAB) $(SRCS-GNTSHR) freebsd.c
 SRCS-$(CONFIG_NetBSD)  += $(SRCS-GNTTAB) $(SRCS-GNTSHR) netbsd.c
 SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.1.2-$(XEN_TARGET_ARCH)-abi.dump
+
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index 39feca87e8..fb6f6bc467 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -8,4 +8,6 @@ APPEND_LDFLAGS += -lz
 
 SRCS-y                 += core.c
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.1.0-$(XEN_TARGET_ARCH)-abi.dump
+
 include ../libs.mk
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index bee57b5629..59ae142928 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -13,6 +13,8 @@ SRCS-y   += xs.c
 
 LIBHEADER = xenstore.h xenstore_lib.h
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.3.0.3-$(XEN_TARGET_ARCH)-abi.dump
+
 include ../libs.mk
 
 # Include configure output (config.h)
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 1cf30733c9..fbb11979e6 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -7,6 +7,8 @@ AUTOINCS := $(XEN_INCLUDE)/_xentoolcore_list.h
 
 SRCS-y	+= handlereg.c
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.1.0-$(XEN_TARGET_ARCH)-abi.dump
+
 include $(XEN_ROOT)/tools/libs/libs.mk
 
 PKG_CONFIG_DESC := Central support for Xen Hypervisor userland libraries
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index dce1b2de85..c4a61a99cf 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -7,4 +7,6 @@ MINOR	= 0
 SRCS-y	+= xtl_core.c
 SRCS-y	+= xtl_logger_stdio.c
 
+PKG_OLD_ABI = ../abi/libxen$(LIBNAME).so.1.0-$(XEN_TARGET_ARCH)-abi.dump
+
 include $(XEN_ROOT)/tools/libs/libs.mk
-- 
2.11.0


