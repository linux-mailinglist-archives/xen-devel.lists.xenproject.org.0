Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE2441A2D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 11:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219127.379801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUqr-0002Nv-Iq; Mon, 01 Nov 2021 10:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219127.379801; Mon, 01 Nov 2021 10:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUqr-0002L8-F5; Mon, 01 Nov 2021 10:47:41 +0000
Received: by outflank-mailman (input) for mailman id 219127;
 Mon, 01 Nov 2021 10:47:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=37jG=PU=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mhUqp-0002L2-VU
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:47:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 914fc80a-dddd-4547-8fa6-689247351442;
 Mon, 01 Nov 2021 10:47:38 +0000 (UTC)
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
X-Inumbo-ID: 914fc80a-dddd-4547-8fa6-689247351442
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635763658;
  h=to:from:cc:subject:message-id:date:
   content-transfer-encoding:mime-version;
  bh=lpcIIIMk0BRMb5RwyYTYn2cRUb+VsDULAQQuRhoeBfI=;
  b=IfDay+86MjlUo7D42dhUuIrj5DyWuEnm6saohr/LScxgPU07LtqAYd6X
   gQ8QpHEwXZAOoMA+3EEGgQxu7uPFw9JqE2wUB5b7heTFsclXEYcXmGb6z
   z1YyRHTwsEtKcVHWTpZ2ty5lcbuI43owmP9hyPy+cyYPfU0DgZMWUJ8hx
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A4VzhuG7eaDX89sSDeDA8ay4tGv1vXUdYRJkyk4DC4Y7BlQ9DfKSg4g+AlvR5wqzzOxfmdT4qN
 XivkI9QO/HSQrxVttbE0Q1SrLi3myvW3FB19ogDgmJ5O/3Q32d8KhPZE2wGDcRNkNFPv5VSxRn
 f+iIi0ofp0iIO56exRjsacx2wtouo828D1w4bPI8r1B3hUkpAaGikp8zO+weBlRWv34jTI4emQ
 wdcsy/7SBa9ttiRhRVN8m2+5k5Qp5mATWiZFCi4uWJmTQcGmvq9Xq8jvbdfXC97IMC9DP7QOAD
 0XFXlT6TdWH+JqY984Ca/NE7
X-SBRS: 5.1
X-MesageID: 57161669
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fUXky6v//SkRuSPUKaIYDQy1oOfnVDRYMUV32f8akzHdYApBsoF/q
 tZmKTuDaP7eY2X8foojYN638UIFu5aEn4c3QQQ//i4zQ39B+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllMGeEC4RHo73h/UzXzBVPHBvPfVC9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DO
 JNHMGQxPXwsZTVWIQ87ArE8ndz13HvffA8JsFCyhIk4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMHMN2SzxKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 04e9zcqrKMy3Fe2VdS7VBq9yFafpQIVUddUF+w86SmOx7DS7gLfAXILJhZIbN09qMY3X3okz
 FaPlNLyLSNju/ueTnf13ryTqzW1OyQcM24ZTSABRAoBpdLkpekbsBXLSdpyFb+vuff8Ezrw3
 jOioTA3gvMYistj/6+891rWjimsopXMRwgd6QDeX2bj5QR8DLNJfKTxtwKdt6wZat/EEB/R5
 xDohvRy8sgvUL/UvRStY94SDZ+lzvuqYSzc2VpgSsxJGyuWx1aveoVZ4TdbLUhvM9oZdTKBX
 HI/qT+997cIYiL0MPYfj5aZTp1zkPO+TYiNuuX8N4IWOvBMmBm7EDaCjKJ690TkiwASnK42I
 v93mu78XC9BWcyLINdbLtrxMIPHJAhjnQs/prihlnxLNIZyg1bOEd843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyNmWsir9pYHJ7LSSuaDJI3HI6WLqV/GU9c995m5a8+Sp
 i3tMqOm4AOn7ZE4Fel6Qi86M+6+NXqOhXk6ITYtLT6VN4sLOu6SAFMkX8JvJ9EPrbU7pdYtF
 qVtU5jQU5xnF2WckxxAPMaVkWCXXEny7e54F3H+O2ZXkl8Jb1Ghx+IIiSO2r3RTVXXr7ZNWT
 n/J/lqzfKfvjj9KVa7+QPmu00mwrT4anudzVFHPOd5dZAPn940CFsA7pqZfzxgkJUqRyz2E+
 RyRBBtE9+DBr5VsqIvChLyerpfvGOx7RxIIE27e5LewFC/b4mv8ntMQDLfWJWjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRC7/UfxrJQtQasd
 FiI/91WZeeANM//SQZDLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIeIsYo0/w
 OontMoH0CCFi0InYoSckyRZ12WQNXhcAa8pgY4XXd3wgQ0xx1AcPZGFUn3q4IuCYslnO1UxJ
 mPGn7LLgrlRyxaQc3c3EnSRj+NRiY5X5UJPxV4GYV+IhsDElrk82xgIqWY7SQFczxNm1eNvO
 zc0ax0pdPvWpzo41tJeW22MGh1aAEzL80P8/FIFiWnFQhT6TWfKNmA8Zb6A8U1xH7iwpdSHE
 GV0EFrYbAs=
IronPort-HdrOrdr: A9a23:4r9kKqwUoaxF3B3GDmQgKrPxyOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZquz+8J3WB3B8bZYOCGghrSEGgG1+XfKlLbalTDH4JmpM
 JdmstFeaPN5DpB/KDHCWCDer5Kqrn3k9HYuQ639QYTcegAUdAG0+4WMHf4LqQ7fng/OXJvf6
 Dsmvav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.87,199,1631592000"; 
   d="scan'208";a="57161669"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8cExbAoPv3m/pdx3scSRgTftffwkdIWx7Qn1l1IVS+o7vd8Er4/wqXOKc0+LILKECNy52iOYFIUDLZd5r2KRETrLwSPQCYc8mhbHeu+ksFFRxEWdMmcL32u9L14GMxSpEziTA1/QqCTk+qjudNMhDelW1H9PGNSoH5FNt3dFeIzG3t2u+ndf7zl/mHyydBcO9B12LyNf2dX0HQfC4SZgp7rmepvGV9l0mpAyBrE/3Q0BepEvlkCmr8k4e8/BdgJqh0ddARuIV9dB5mHwqjAtp0GaspqUaYXPhxAk3GGJCLPn+2B6D9jt+CXBs/JSYECd6KNBA6UymEY77pUkTh1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpcIIIMk0BRMb5RwyYTYn2cRUb+VsDULAQQuRhoeBfI=;
 b=nCZL0/6tq9cNbhUzSR0Af2nEw3S5hA+rDnqOlxI9MLP0PfA9TpGm90ycseOSL2tL/FYyHQQkcTDpX3EgCALyyWg71mJguBPrxq/aJ3GDpDl58QPqeO3TG4L3HCmxNo3bAXgVGMNgdjI/3cDAkOYy2iE2fIaVwohzjSZtKM5y8m9u+zOjTPabG0H/D7lOAa6Y+vMFdHwNVbqL0gIV+WSU4orv3jsHZ843TQ5GxPuMiK9hQw9JUg7vtOINF0gUIdbDTQklJsqEHB9lxfZAUWTnsqo/jgOA/hz2UCY++Xks0EY4cYwQZTfVECX1kf8P8Eg3SQI72g7618Pz6U59o3v6qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpcIIIMk0BRMb5RwyYTYn2cRUb+VsDULAQQuRhoeBfI=;
 b=oygw6KJdRf+rdNZPaS3DvyQF/VlIDB2/s5YyPLQlQWmoAjQ9C8txv+b4L6B6Lrlhi7PGxVfdqfzjsVlJhY0dCowKtwB5wxsMZn+5EZ2J3UfKy0ISVwP+Yr6D6894BQ2aOgb5v/tUA1QMI6ZOem2JfudR6nn159kFDU/6DSWO3m4=
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jane Malalane
	<jane.malalane@citrix.com>, Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>
Subject: Arch-neutral name for hardware interrupt support
Message-ID: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
Date: Mon, 1 Nov 2021 10:47:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32fbb3d3-4eaa-4890-1cf8-08d99d250318
X-MS-TrafficTypeDiagnostic: BYAPR03MB4552:
X-Microsoft-Antispam-PRVS: <BYAPR03MB45523A35381A70EA5409CFFEBA8A9@BYAPR03MB4552.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57AqIwGJ9YBbU8i0/cYO30QTIvLWFUbIQOBjd7O9PjaCqgh5JOnCbzANzq3gHcZDkfVy9E522wi/7O8EnfswvqoQySO/sMRIyjsR45nxoeI3N0zdpnUwUSA+elsomQEXze5j89YuxWvJ1bATGt2az+q54WkDQoUI6hUd7flV/XNHjSygmEJ6pnrBKJQbpgk3GfTvNTnnCy2OJxLwh6+LKKZau0DIf2hX24BACF8nyzxVv11eAax+GV8gS2AVE2oMlUowefcYZHsKZWsV5cIp+EzHrCmG0U0V7CdE/ED4VynZjjFjnmLI2WCXXzA2MjfFdvDUvTJTYt4EW1jBJRimoe27GRK0bXh60emqqAn/zN466KALfhjnEJTpccyPq9FLfCrXRFt/8I+krsOSmqSzNx2eE73yP959kFyWDiDi1BnGTmU1fNRcGgcq8x4PX2wM4vSYTscJWHUXvWy5/9j2LvVFQD8YXb+WFH/NBko0kgenlz3JidbSDN/J1IGV0jS51Tp9fnGkxzhmIc7nfm+6D44554tujV5cHpG+UbtaW4ENU/6DMuy2E8U7D++1HT4A1OkseHso7+MNApaiHX8eGQXVk2Korl4CkUtrIlwUBsSU7qCtLd0/HoBTb3yLAKzMPrteyw0v04EQoe98hAkX8tzgvjPAv8X846mLFv4EKqkQ0hJi1StcLIpPSQ6s6pQ8RxU3xpu3TKwzhGQ/gT4Lnz+bFkDlO6IiiG/sFtq7ftAA+WXSCiiqlGCLet4mN6wA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(4744005)(82960400001)(8676002)(5660300002)(38100700002)(36756003)(83380400001)(4326008)(31686004)(956004)(54906003)(2906002)(2616005)(66946007)(66476007)(66556008)(186003)(26005)(6486002)(16576012)(316002)(6916009)(8936002)(31696002)(6666004)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZERqdGlTaEoyQ2xmN0VPUjk1TWVSc1RqQXpsSDgrbWNLbVBZdVIzWlIwN0Iv?=
 =?utf-8?B?K3V1YzhrcHMxYzlKVlVPelJoaU44cG45bjhXcG1JV2liRGNLVEt4SHBHUGVQ?=
 =?utf-8?B?NFhKVVJ2VjFCd1R5V1pmc3RNd1B1TXBoVjlMWS83Ly9LU3A2ZFE3UGNWMkNh?=
 =?utf-8?B?MHdIYnBQY2RXaUp0YmxNbG1ZSmZ6V0MwZ25Ec0VNUmUzc1N4NG41UDJpTkd3?=
 =?utf-8?B?aUhETXhkTlVUUW0wNGRTRWxjOVl1dDdZTXRvdzJURHQrUTBYR3NjRDUwdEc4?=
 =?utf-8?B?bjF5aG9hTDhRQkdQOWV2T2M5MFFuU3dIMnYzOEF1cnBZVmlCdHhIYm9tN2xE?=
 =?utf-8?B?L1djYk0rU1BUOTRiUGZJTFo5UXptT3dNbjZPNXpReEprVnFvZE96blpMMWlI?=
 =?utf-8?B?WnJweExPRFBtT2RPd1k2RHpNQ3cwblFISldpZThwekxRMnJQUG51ZDlFSm1C?=
 =?utf-8?B?Q1B5Q09jdnFIR0Fud1ZLN0M4MFU2MlFHZStuL2RvRk1PbTE2OHZRNklOSFJo?=
 =?utf-8?B?a0Q3ZDZjbnExWEY0UlRTcUxBYURNVGs0cTRMVHRSZjdSOXZYUEVoY3RlNklY?=
 =?utf-8?B?UUVpTzViWFVsalA4SXJxYTBkbEx5cGlKSlJHZEtlLy9xRTJYSFUzVWNVN29p?=
 =?utf-8?B?VDFVSXk1YXZlTTFLVmRackFzazMyOUJNWVBINTNITFNoNjBMdk1xS0tnRDIv?=
 =?utf-8?B?QlRVOGZVUnE5SThoN0ppRDI0UjZhSmRoK1VBek5lOTErbVpjZXdxY0V2cEZt?=
 =?utf-8?B?MzFrUFNKVlIyUE44Y2JrOVU5Nm8zU2tDMFJHTVFocDA4SEpFanBibUZ3R1Rl?=
 =?utf-8?B?Mll1aTBaNzJQRWttV0FHMVpQYWprUkc0UnZqekhvVU90T21UQmNRQkxEcUJq?=
 =?utf-8?B?TnRTY2pmY2hzUGJFN0kwRjNhbHNZSUZTdlIzb3k3ZUpKaENrSndNRDl5NVA0?=
 =?utf-8?B?RUtCU29WUG15SjZBclNLbFlrWVJvUVBTd2VZMkhGWFYvZUQzUnE0d3hhVnEz?=
 =?utf-8?B?WnpaT3RPcDY2M1F3b3Vhdlc3SGl3VVlpcDRwbkY5WlRISStaZ283RU1sejJB?=
 =?utf-8?B?cU8vTDNpM0NTSVYxdGFXTlZ5VkFNekJpVHZ5MStPZGR2NXNBYmk0NW1pclA1?=
 =?utf-8?B?RlRqMlBzSjRrSXNtc2lVWTlZYzZKMUNrSTlySEhxTjMrdEZPVmlqb24xZmp2?=
 =?utf-8?B?VFFFRy8vWUhTZUxWbGkzUC9wQUd3TVhuWEwwaWYvc21VNmZHQjdiM0NJUFRO?=
 =?utf-8?B?WjExcmU1bGxkWmhBVWI0R2xjejVaUkczVDQ1a3BlQkNKdHl5TDNZa0JENXpp?=
 =?utf-8?B?RnJMdThCMkRDb1AyWEFTYUxveG14Y2tBcVBqdEV1TWlBM0lYRFcwSDZZZWIw?=
 =?utf-8?B?cm9MMzJQYUpzZURYREt1Smw2dWJycCtQZjlTWDlUOUZpd2RHU2FPVmxBZjZ1?=
 =?utf-8?B?S3NsbXhLSjBxeW5adjVRQlFUMkNDdHlPaVVOaGlYRXVEYkxTYzhJNUN3WTUz?=
 =?utf-8?B?dks4R0V6TUZUV2xtZjc5SEN4SDAvbHpSd1R2RCtWakV2K0xCWlNYbm1yc0Nz?=
 =?utf-8?B?Ty9HL3pjUVdzVldNa21IaFlwUmdLdFFMRVMzcituUGJBUEtLa0VQcExVd0VQ?=
 =?utf-8?B?bkh1MDlQRkxSNEhQdTJSbVY0ZWVXTklUSkNhV1BqR2ZjQjVaUWwvQ3JsMnIr?=
 =?utf-8?B?c3VYdkJDTkJqaWdBZ2lNSkczYTU3MHRmcGk2OVpuL3daZnVYZzFwU0xkekxE?=
 =?utf-8?B?RmZ1bjlFNjBKUWlZWjlEc3d6SmsxeGtvQ01zdW9aMm5pL0RMZGd1Z3A4OGpw?=
 =?utf-8?B?Nk8rQVhKUWttd1U5WDNhWHVMY1VFTXZTR1F1dXVCUytGSzRmSUJHUDZqM0lr?=
 =?utf-8?B?Y2l3L3d3Y1dYR2NUU0JvVVZNKytzZS9hQzYxRzdQQ1MrL0p6TnRRQnpVd1Iy?=
 =?utf-8?B?OE55Qk9EdHJDcnI1anF4Y09mcWdMV2l6WEEzOEc5cVRDT0k4S1JWZHJBNUI0?=
 =?utf-8?B?NVV1VkRaZGEvVmNGNDY3bkIwVVZtZjVvTGxTdjQzTGpRS0VLMExDNkFXTXpG?=
 =?utf-8?B?YWZnQVVBSnN2NjJFelJpVzZHN0dhMENCODdldm1mZHVndWNqeW81TFM5UzA5?=
 =?utf-8?B?UmxLMVdEN3JWNFZSaWZWYTN3VDAzWXNncWtPb0FwOVhlaXc3MkpYdzZJWGJC?=
 =?utf-8?B?c3JVdm4raEl0bnZuSU1KTlFvQ1JLdVN3WkFnd0xsVUFjemZrdG9xbGZRNE0x?=
 =?utf-8?B?WGFhdWM4aTBwVm5LcU9xc3hreEt3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fbb3d3-4eaa-4890-1cf8-08d99d250318
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 10:47:34.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1ICEn0NZzeUp2meITV5X9o5WtpX22Z2L/1YM537Y2jOivcOaos/GofLdfyfBorD3r8FcrXVhngP/biulNeQqJnNmEOEDdYPluAV4QUZb1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4552
X-OriginatorOrg: citrix.com

Hello,

On ARM, the GIC is a hard prerequisite for VMs.

I can't remember what the state of RISCV is, but IIRC there is still
some debate over how interrupts are expected to work under virt.

On x86, the story is very different.=C2=A0 PV have no hardware assistance,
while HVM hardware assistance depends on hardware support.=C2=A0 Therefore =
we
want to introduce a new CDF flag so we can control the setting per
domain, rather than globally as it is done now.

This brings us to the question of what a suitable architecture name
would be.

Hardware Virtual Interrupts is a little too close to Hardware Virtual
(Machine) Introspection, and Hardware Assisted Interrupts (mirroring
HAP) doesn't seem great either.

Thoughts / ideas / suggestions?

~Andrew


