Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC572B2962
	for <lists+xen-devel@lfdr.de>; Sat, 14 Nov 2020 00:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26943.55531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdiv2-0004a2-9B; Fri, 13 Nov 2020 23:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26943.55531; Fri, 13 Nov 2020 23:55:52 +0000
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
	id 1kdiv2-0004Zc-5l; Fri, 13 Nov 2020 23:55:52 +0000
Received: by outflank-mailman (input) for mailman id 26943;
 Fri, 13 Nov 2020 23:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0O7E=ET=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1kdiv0-0004ZX-Fk
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 23:55:50 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e6c5d94-fb0e-4696-b0f1-8140c394a959;
 Fri, 13 Nov 2020 23:55:48 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADNpCIi132206;
 Fri, 13 Nov 2020 23:55:10 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 34nh3bcx5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Nov 2020 23:55:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADNpFw3096479;
 Fri, 13 Nov 2020 23:53:10 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 34rt58rarc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 23:53:09 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ADNqphm028281;
 Fri, 13 Nov 2020 23:52:51 GMT
Received: from tomti.i.net-space.pl (/10.175.204.43)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Nov 2020 15:52:51 -0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0O7E=ET=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
	id 1kdiv0-0004ZX-Fk
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 23:55:50 +0000
X-Inumbo-ID: 1e6c5d94-fb0e-4696-b0f1-8140c394a959
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1e6c5d94-fb0e-4696-b0f1-8140c394a959;
	Fri, 13 Nov 2020 23:55:48 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADNpCIi132206;
	Fri, 13 Nov 2020 23:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=flCTDbb+FvykrJGMFxj/7GupN5n5PIJFx8mRlgaUwxw=;
 b=UbbR67q6JD+oUzxTtsXjZSqU4hofW+yhSERzgRYrDmt1vP26stuVzfJ3elePn8I9EGk7
 uTYBkCy+em0VXFy5ySI73d/vtG+9g8amfwakDfrM/Nt05hEjrkxxmMCNR4k2LwfQUaCn
 BHIhnBC6MdrAFVo9QKm5uzvGxhaUGRFXoPGsxA3oAME9skxGjZWxjZpJZobLwP8R+a3w
 Vq6j84Vmht/kwlYYtohC28hwV5Ug1oQkZAPOBfZa0pMZuBQBZkyPPfAxkgXnQ0bYSRbA
 je895e77dV9kENe+RP+w+DHyX1+t/XJOzpnfIp0BlKzkE+3jvQ7udpWBbHIG9yFijWPH ug== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 34nh3bcx5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2020 23:55:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADNpFw3096479;
	Fri, 13 Nov 2020 23:53:10 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 34rt58rarc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Nov 2020 23:53:09 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ADNqphm028281;
	Fri, 13 Nov 2020 23:52:51 GMT
Received: from tomti.i.net-space.pl (/10.175.204.43)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 13 Nov 2020 15:52:51 -0800
Date: Sat, 14 Nov 2020 00:52:42 +0100
From: Daniel Kiper <daniel.kiper@oracle.com>
To: coreboot@coreboot.org, grub-devel@gnu.org, linux-kernel@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, trenchboot-devel@googlegroups.com,
        u-boot@lists.denx.de, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: alecb@umass.edu, alexander.burmashev@oracle.com, allen.cryptic@gmail.com,
        andrew.cooper3@citrix.com, ard.biesheuvel@linaro.org,
        btrotter@gmail.com, dpsmith@apertussolutions.com,
        eric.devolder@oracle.com, eric.snowberg@oracle.com, hpa@zytor.com,
        hun@n-dimensional.de, javierm@redhat.com, joao.m.martins@oracle.com,
        kanth.ghatraju@oracle.com, konrad.wilk@oracle.com,
        krystian.hebel@3mdeb.com, leif@nuviainc.com, lukasz.hawrylko@intel.com,
        luto@amacapital.net, michal.zygowski@3mdeb.com, mjg59@google.com,
        mtottenh@akamai.com, phcoder@gmail.com, piotr.krol@3mdeb.com,
        pjones@redhat.com, pmenzel@molgen.mpg.de, roger.pau@citrix.com,
        ross.philipson@oracle.com, tyhicks@linux.microsoft.com
Subject: [SPECIFICATION RFC] The firmware and bootloader log specification
Message-ID: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9804 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130153
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9804 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130153

Hey,

This is next attempt to create firmware and bootloader log specification.
Due to high interest among industry it is an extension to the initial
bootloader log only specification. It takes into the account most of the
comments which I got up until now.

The goal is to pass all logs produced by various boot components to the
running OS. The OS kernel should expose these logs to the user space
and/or process them internally if needed. The content of these logs
should be human readable. However, they should also contain the
information which allows admins to do e.g. boot time analysis.

The log specification should be as much as possible platform agnostic
and self contained. The final version of this spec should be merged into
existing specifications, e.g. UEFI, ACPI, Multiboot2, or be a standalone
spec, e.g. as a part of OASIS Standards. The former seems better but is
not perfect too...

Here is the description (pseudocode) of the structures which will be
used to store the log data.

  struct bf_log
  {
    uint32_t   version;
    char       producer[64];
    uint64_t   flags;
    uint64_t   next_bf_log_addr;
    uint32_t   next_msg_off;
    bf_log_msg msgs[];
  }

  struct bf_log_msg
  {
    uint32_t size;
    uint64_t ts_nsec;
    uint32_t level;
    uint32_t facility;
    uint32_t msg_off;
    char     strings[];
  }

The members of struct bf_log:
  - version: the firmware and bootloader log format version number, 1 for now,
  - producer: the producer/firmware/bootloader/... type; the length
    allows ASCII UUID storage if somebody needs that functionality,
  - flags: it can be used to store information about log state, e.g.
    it was truncated or not (does it make sense to have an information
    about the number of lost messages?),
  - next_bf_log_addr: address of next bf_log struct; none if zero (I think
    newer spec versions should not change anything in first 5 bf_log members;
    this way older log parsers will be able to traverse/copy all logs regardless
    of version used in one log or another),
  - next_msg_off: the offset, in bytes, from the beginning of the bf_log struct,
    of the next byte after the last log message in the msgs[]; i.e. the offset
    of the next available log message slot; it is equal to the total size of
    the log buffer including the bf_log struct,
  - msgs: the array of log messages,
  - should we add CRC or hash or signatures here?

The members of struct bf_log_msg:
  - size: total size of bf_log_msg struct,
  - ts_nsec: timestamp expressed in nanoseconds starting from 0,
  - level: similar to syslog meaning; can be used to differentiate normal messages
    from debug messages; the exact interpretation depends on the current producer
    type specified in the bf_log.producer,
  - facility: similar to syslog meaning; can be used to differentiate the sources of
    the messages, e.g. message produced by networking module; the exact interpretation
    depends on the current producer type specified in the bf_log.producer,
  - msg_off: the log message offset in strings[],
  - strings[0]: the beginning of log message type, similar to the facility member but
    NUL terminated string instead of integer; this will be used by, e.g., the GRUB2
    for messages printed using grub_dprintf(),
  - strings[msg_off]: the beginning of log message, NUL terminated string.

Note: The producers are free to use/ignore any given set of level, facility and/or
      log type members. Though the usage of these members has to be clearly defined.
      Ignored integer members should be set to 0. Ignored log message type should
      contain an empty NUL terminated string. The log message is mandatory but can
      be an empty NUL terminated string.

There is still not fully solved problem how the logs should be presented to the OS.
On the UEFI platforms we can use config tables to do that. Then probably
bf_log.next_bf_log_addr should not be used. On the ACPI and Device Tree platforms
we can use these mechanisms to present the logs to the OSes. The situation gets more
difficult if neither of these mechanisms are present. However, maybe we should not
bother too much about that because probably these platforms getting less and less
common.

Anyway, I am aware that this is not specification per se. The goal of this email is
to continue the discussion about the idea of the firmware and booloader log and to
find out where the final specification should land. Of course taking into the account
assumptions made above.

You can find previous discussions about related topics at [1], [2] and [3].

Additionally, I am going to present this during GRUB mini-summit session on Tuesday,
17th of November at 15:45 UTC. So, if you want to discuss the log design please join
us. You can find more details here [4].

Daniel

[1] https://lists.gnu.org/archive/html/grub-devel/2019-10/msg00107.html
[2] https://lists.gnu.org/archive/html/grub-devel/2019-11/msg00079.html
[3] https://lists.gnu.org/archive/html/grub-devel/2020-05/msg00223.html
[4] https://twitter.com/3mdeb_com/status/1327278804100931587

