Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D8D8528AA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 07:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679700.1057418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZm5y-0006PE-9c; Tue, 13 Feb 2024 06:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679700.1057418; Tue, 13 Feb 2024 06:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZm5y-0006Ml-6n; Tue, 13 Feb 2024 06:16:42 +0000
Received: by outflank-mailman (input) for mailman id 679700;
 Mon, 12 Feb 2024 18:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jcaA=JV=knorrie.org=hans@srs-se1.protection.inumbo.net>)
 id 1rZbOZ-0002Ce-1a
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 18:51:11 +0000
Received: from albatros.knorrie.org (albatros.knorrie.org [35.156.0.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae91aca5-c9d7-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 19:51:08 +0100 (CET)
Received: from [IPV6:4000:0:fb:a::15]
 (2a02-a213-2bc5-6a80-0000-0000-0000-0004.cable.dynamic.v6.ziggo.nl
 [IPv6:2a02:a213:2bc5:6a80::4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by albatros.knorrie.org (Postfix) with ESMTPSA id 0E66D30BA8;
 Mon, 12 Feb 2024 19:51:06 +0100 (CET)
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
X-Inumbo-ID: ae91aca5-c9d7-11ee-8a4c-1f161083a0e0
Message-ID: <509f476b-1c0a-401a-a564-28490c96e2ab@knorrie.org>
Date: Mon, 12 Feb 2024 19:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1063270: The "64bits time_t transition" in Debian/Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>, 1063270@bugs.debian.org,
 zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org,
 Maximilian Engelhardt <maxi@daemonizer.de>
References: <51e993f4-c250-400c-bbf4-017a1dbf1c2d@rabbit.lu>
 <170717408685.1943167.14081331758881904940.reportbug@homer.dodds.net>
 <2922b179-571a-4745-b204-7dc7e2beeeea@citrix.com>
Content-Language: en-US
From: Hans van Kranenburg <hans@knorrie.org>
In-Reply-To: <2922b179-571a-4745-b204-7dc7e2beeeea@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/12/24 18:43, Andrew Cooper wrote:
> On 12/02/2024 5:27 pm, zithro wrote:
>> Hey all,
>>
>> the Debian project is focused on the "2038 time_t" switch.
>> So the maintainers of the Debian Xen package must ensure that all
>> imported Xen code conforms to the new Debian standards.
>>
>> I was asked by Andrew Cooper to post here about this, I'll quote him :
>> "So I had been idly wondering whether Xen would match up to Debian's new
>> policy, and it appears not
>> this topic really needs to be brought up on the xen-devel mailing list
>> do you have any more details as to what has gone wrong?
>> this is something we ought to arrange to happen in CI by default
>> but it sounds like there's some work needed first"
>>
>> (Not answering the question because I'm just a messenger).
> 
> xen.git/xen$ git grep -w time_t -- :/
> ../tools/console/client/main.c:106:     time_t start, now;
> ../tools/console/daemon/io.c:272:       time_t now = time(NULL);
> ../tools/libs/light/libxl_qmp.c:116:    time_t timeout;
> ../tools/libs/light/libxl_qmp.c:585:                               
> time_t ask_timeout)
> ../tools/libs/light/libxl_x86.c:516:        time_t t;
> ../tools/libs/toollog/xtl_logger_stdio.c:61:        time_t now = time(0);
> ../tools/tests/xenstore/test-xenstore.c:453:    time_t stop;
> ../tools/xenmon/xenbaked.c:98:time_t start_time;
> ../tools/xenstored/core.c:109:  time_t now;
> ../tools/xenstored/core.h:150:  time_t ta_start_time;
> ../tools/xenstored/domain.c:143:        time_t mem_last_msg;
> ../tools/xenstored/domain.c:188:static time_t wrl_log_last_warning; /*
> 0: no previous warning */
> ../tools/xenstored/domain.c:1584:       time_t now;
> ../tools/xenstored/lu.c:160:    time_t now = time(NULL);
> ../tools/xenstored/lu.c:185:    time_t now = time(NULL);
> ../tools/xenstored/lu.c:292:    time_t now = time(NULL);
> ../tools/xenstored/lu.h:32:     time_t started_at;
> ../tools/xentop/xentop.c:947:   time_t curt;
> ../tools/xl/xl_info.c:742:static char *current_time_to_string(time_t now)
> ../tools/xl/xl_info.c:759:static void print_dom0_uptime(int short_mode,
> time_t now)
> ../tools/xl/xl_info.c:810:static void print_domU_uptime(uint32_t domuid,
> int short_mode, time_t now)
> ../tools/xl/xl_info.c:847:    time_t now;
> ../tools/xl/xl_vmcontrol.c:336:        time_t start;
> ../tools/xl/xl_vmcontrol.c:495:    time_t now;
> ../tools/xl/xl_vmcontrol.c:504:    if (now == ((time_t) -1)) {
> ../tools/xs-clients/xenstore_control.c:33:    time_t time_start;
> arch/x86/cpu/mcheck/mce.h:224:    uint64_t time;     /* wall time_t when
> error was detected */
> arch/x86/time.c:1129: * machines were long is 32-bit! (However, as
> time_t is signed, we
> 
> 
> I don't see any ABI problems from using a 64bit time_t.  The only header
> file with a time_t is xenstored/lu.h which is a private header and not a
> public ABI.
> 
> I guess we fell into the "could not be analysed via
> abi-compliance-checker" case?

Thanks for also looking into this!

Maximilian mentioned in #debian-xen that doing a Debian package build
with DEB_BUILD_OPTIONS=abi=+lfs and _FILE_OFFSET_BITS=64 and
_TIME_BITS=64 resulted in the exact same binaries for shared libs.

What we also found is these reports:

1. Enabling lfs, which has no effect:
https://adrien.dcln.fr/misc/armhf-time_t/2024-02-06T16%3A48%3A00/compat_reports/libxen-dev/base_to_lfs/compat_report.html

2. Enabling the 64-bit time_t as well:
https://adrien.dcln.fr/misc/armhf-time_t/2024-02-06T16%3A48%3A00/compat_reports/libxen-dev/lfs_to_time_t/compat_report.html
In there, see "Problems with Data Types, Low Severity  2 " about
struct_timeval:

---- >8 ----

  [+] struct timeval
    Change -> Effect
    1 Type of field tv_sec has been changed from __time_t to __time64_t.
-> Recompilation of a client program may be broken.
    2 Type of field tv_usec has been changed from __suseconds_t to
__suseconds64_t. -> Recompilation of a client program may be broken.

  [+] affected symbols: 3 (0.2%)
    * libxl_osevent_afterpoll ( libxl_ctx* ctx, int nfds, struct pollfd
const* fds, struct timeval now ) -> 4th parameter 'now' is of type
'struct timeval'.
    * libxl_osevent_beforepoll ( libxl_ctx* ctx, int* nfds_io, struct
pollfd* fds, int* timeout_upd, struct timeval now ) -> 5th parameter
'now' is of type 'struct timeval'.
    * libxl_osevent_register_hooks ( libxl_ctx* ctx, libxl_osevent_hooks
const* hooks, void* user ) -> Field 'hooks.timeout_modify.p2' in 2nd
parameter 'hooks' (pointer) has base type 'struct timeval'.

---- >8 ----

So, the question is, is this correct and would it cause a problem.

If so, it also means that those functions are in a versioned lib,
libxenlight.so.4.17.0 (in binary package libxenmisc4.17).

Coincidentally, we are currently preparing the upload to switch from Xen
4.17 to Xen 4.18 in Debian unstable. So, if we just go ahead with doing
that, and make sure it's built in the new way already...

then...

tada.wav!

We just immediately have the correct libxenmisc4.18, and no other
(stable lib) packages have to be renamed.

Hans

