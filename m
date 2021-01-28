Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994E30746B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76907.139006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55A1-0008CZ-QE; Thu, 28 Jan 2021 11:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76907.139006; Thu, 28 Jan 2021 11:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55A1-0008Bs-ME; Thu, 28 Jan 2021 11:08:25 +0000
Received: by outflank-mailman (input) for mailman id 76907;
 Thu, 28 Jan 2021 11:08:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umji=G7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l559z-0008BC-IC
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:08:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41606628-13b1-476b-bb04-e2615a76da50;
 Thu, 28 Jan 2021 11:08:20 +0000 (UTC)
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
X-Inumbo-ID: 41606628-13b1-476b-bb04-e2615a76da50
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611832100;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=orzzDS478oMRIz5LY2eYjMuIoP6gs1is+87lR5OY7w4=;
  b=MmYUar71u32grXFKlNzeEXVoemOKsSKHMgFx2aUZ2Yti8w6s/MRcyjZR
   ksGQfLnWJT+Z5DwquA472+vpQCncrv/3Y23alhSe8EvG4A5ejG0zlKS/O
   zdFm98s4oZgLacAGVGuCCysj4CvYMSIT3B8kSAC+MblvMUieCsAG+YKD8
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LkcjW+hGT0xmfXTh8rcvE4uWW+Ejg5tfy7hJoQLqVuZH9OoUBPJQQq+BtfYc5bxKLGXSpcjfz6
 tzh93tOVQLhi2pQ6SR//oL4JrBcUzxXFrq6K96TIgLWcSiuAczRgPjtlKaukacEnpJN3YCB0rq
 dqY4YyC7RIl3u461iNfmaCxNxN3JYa/mwPf2djunVykYUf6JFU7BSH4WBVzr50voi2vOSEBevx
 2kuiGDNhAJNvTpE1Zh5thJWbwmWzkksmDw4tVkx6y8W89zD3XRhCSHnP+c7MAGxEU/6cupnT27
 058=
X-SBRS: 5.2
X-MesageID: 36090850
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36090850"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+eUXa2iQaR2nqNM5uP15LNgJUmXv/GF2ocbANdOsA4SVJUAQqhVUoZ4B2iq7A1rWbD2qNVi+TT2GntWDz8Fjcl9bDhSIof3o6G9IDcGjFoO3SDcj9n1iMQ/AQrEAKZLxZa3bSujmtwgb8xEAjyzNoebc3/GbTCxcbI3UK/6bz9IbtCxqedZcUzbLkHHnpQH+zTo1xisEbhI25c2XG6gSQH7h/e7vfKHnwyoj55djBryo4d4/wj0bsw9qOUbaw/SCfIOB9NEiAsKaYzX3nY+TW2f84mfNpsejyKahxrRw8w4dwmfyAX/w0BttRHO3BNjOliHYPOt/UYRxFW6P5GB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PgsZaoWnAz+d/ukaybwjCFfqKuUkKYOqt1+K/9n7y8=;
 b=jy56piELvZveqY3fKunXVTtlUcqtkFte1LfKwq+FseTGZV1PJ03iB2Kn0oRw40j9PISTOLY6dlO6jWdqxLI9rA/3EurmwzOcZ1YzCBW+orhtbWDg8S5ht9So/NpdMKWe6c43WTiJx17LdiTaA4akCppqgnxu0kPZNTIxOaciYrc4kMHtXiWGVxflPn9g/PtH5kgpeKI+395eznU9RxrMsQixFeCIiYLaM9DKLzjkornJwZcMdTPJJ3orf4mVfH6agsCXSBFdh6RaZc+iAB72C/0AaFLX9ldEo6RnuojXvZRqnrKyNCFo8++OnDeKXtCel32t6ZtW704y0nffJrlqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PgsZaoWnAz+d/ukaybwjCFfqKuUkKYOqt1+K/9n7y8=;
 b=VeqhiPK4cye1Pt9ytIvhtZyuDhVBj4+F1Es3rgsvpZTyPKn9aZ5i2KIsbtAKlSrj92b45mETrM+puduY4qqD1AIoWk92DmnLVq/vjRVwYGmDai72jyB6MD78fW5Jd/DmoJHGO6LDaWkDvaJ6CHyXnswuL64NSq7Iqz/RTqB9dHk=
Date: Thu, 28 Jan 2021 12:08:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] libs/light: pass some infos to qemu
Message-ID: <YBKbEhavZlpD75fU@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-12-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126224800.1246-12-bouyer@netbsd.org>
X-ClientProxiedBy: MRXP264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f669af35-2e63-46b9-bcce-08d8c37cfdcd
X-MS-TrafficTypeDiagnostic: DM5PR03MB3372:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3372B0B4C50C8708A75828B08FBA9@DM5PR03MB3372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hagD5Mf6h0TIET6U+7oLeWBoCIhW4N/Dk33YHmRWTqlIdO0aD/G/HyeHr+3ZhVOGQY7zSLtL8Ns4eWo9RHdNQUzBBtjvr02ozp/RhFFg1c5wKTs+7IHdTOh6Rdhw5+jD98GRaLe5hGkSnZfqWD4IvbBb2q92/npeK3OCN5mBB+O3MZnqnUlV2wmHZTCQhHBwvHjueaQw75OI/+JvqyLR9xHu+tx1yrrQVS9ZRTBw15ww5Es2wVNmldGo6lLL8SZy3xZC2WIvs4vt5aIyq6agjQVCzQ6b5fEG7Uiwnt3w+6cpx5BThMMyi7gm/9S6P0MY0VYe+x8aYybX7J2XDY4k4gq0CFAlS+SXVIWM3KYBC2GhIK7NKwwbsg1swvDkus7pj/0/za9N2ydOVAoJsdOEI2LWbXATDQsnAWpAgMYYjEumNFX2uVNs45ByQvgDbnl6/sfIA6kb73o+d9oOQg30uP/jGS5cyYDfJohOZ7DuW+EDeoBMkk63XeHePNeiJknoQ+lHA2OHYDvRCC7r8s7/6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(346002)(396003)(39860400002)(366004)(136003)(8676002)(107886003)(16526019)(86362001)(4326008)(5660300002)(83380400001)(33716001)(54906003)(956004)(26005)(186003)(8936002)(6916009)(2906002)(6666004)(9686003)(66946007)(66556008)(6496006)(66476007)(85182001)(478600001)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzlhUHlzTlptS1paNWpMemNERHdZK0d4L1BuZEluVUFCUlh3VG8xLy83M0JM?=
 =?utf-8?B?YnJzdXI0aUdmdE9qM240VGw2Wmg2cnNkV1R1MmhveXB0Y0o3dDhrb1lGMGhM?=
 =?utf-8?B?SjN1Y0MrNHRLUmFsZTBSL2ZmREJqNlBJMkZnN09mUkJFQnFnMkFPclozdVQz?=
 =?utf-8?B?ZDZOMjBJM3lEWnNiSzJkc0RCSWtwRDZkMWVZSzJGQ1dtc0lGcEFOOXg3Yk8z?=
 =?utf-8?B?SldNdTYwZVdWdjVHUWY2cmt1TzM5c1d1YU1HTGlmTUtwaWR5OTJNTFkrRnlK?=
 =?utf-8?B?YW1udFZIMnY5Yk56N2o2bm1Oc3ZOblBtY3NBUDFWeEhtcWRYQWxlUzZYV3Bw?=
 =?utf-8?B?NEpvOGxMS3JoUHpFV1d3TzRiaEdiQXI4SllnSVVIRTdENFZkakFvSXdxTUsx?=
 =?utf-8?B?QUxGTTRkdXZkcVFuZWxjK0lrMG4rTEpXckx1RFg1RVJWNEszTzdnend0Rkt2?=
 =?utf-8?B?cXVrSk1aN1h2eGJpZ0NnT0NHRUJud2NlczlOS3d4SVk4SlhENjFjK3Qxa2k5?=
 =?utf-8?B?Rk5lZFQwdmdzTzFmQWEvQ3NNQmNkTUJMNHJEN2M5cU4wQ090QkljVlNEQ2tn?=
 =?utf-8?B?bjZwbG5CYVRTanFxZjZJaDhOVDFRODNFcmNIakJEdFVtK0s2THBaZ3M1eGd6?=
 =?utf-8?B?cWE3UkxkUHZNYkhMSFJDMHdSOExKaEgybkcwQlFPZnVxREVpalRMUlFuOXlm?=
 =?utf-8?B?K2xuOWFFc1JjYmhUMDdhYmdvTXpVVk9sN1pLZ3ZSYXlRZ0dOemlXVHBCN0VE?=
 =?utf-8?B?dDUyOGMzODZGbzltejdjMytoRkt3R0Nlc3Ivb1drMGtFNVFaYWhLSzJacWJi?=
 =?utf-8?B?QnRuV090WHNBeG9wRzBieVUxVFhMT0djbjBSTmFvZW5EQ2d2cTFmQzZIc05U?=
 =?utf-8?B?SVlORjA0QktaTHJyQll0Wnc5U21yMWdkNkR6aVZSeDRUblpCN0pxSHUya01y?=
 =?utf-8?B?eTNpWFJBWHZDMjQwY2JZcS9KUE9jYUZRVWNuMytMemlrVW5sUHRHMkxvM3Aw?=
 =?utf-8?B?aFlvY3pmNzFLK2xFb0o0eW1KSHJ1SU1HaFV2WDcxK0dGdlpYUWtHRTlwVjdT?=
 =?utf-8?B?eGsyN05kZTRxQXBEaFhpUmZSV0RuRnNUeElOa1R5ZkF4c2xtNm03OG5BS251?=
 =?utf-8?B?N2lMUUVjVnJhYUtPVUtaOHBEWE1FY3NCZEVKYkVSa1VRNUQrT3BVQnIyb1FS?=
 =?utf-8?B?M2VQWlp2ZFpvenlGRjNnajNHMnYyNG8xdjFvT3hMZjk4K3hYQjgxVWppRkp3?=
 =?utf-8?B?SnJrUG1meU1jcmdSRWlpVXpUNnY1V3FuVVJBcTI0bU91Z29xcFFuL3dJbFpC?=
 =?utf-8?B?UmpxTWpWUXpTd2lmYUZmd3hFWnJNdHFHVWxQSEg5dzFCVGlxWkNXWjZWb2ZO?=
 =?utf-8?B?VTcrbHdQZUVYelN4YmN6VWIvSXN3Q2NOYncrUWcrNlRIY2UzaDRUQ3RvanVW?=
 =?utf-8?B?R09GZzFBRFZ0dlZsQVNrRDhxSXJuMnhJeTRFcXV3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f669af35-2e63-46b9-bcce-08d8c37cfdcd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 11:08:07.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whcDAMDEvFk2gjfgWzroqT/Q64N/0t1GV7LCF2kuDcwFFncAxBJ3WaLHUa+6pFqdRj9HsC/Cs2FE45n6skAJeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3372
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 11:47:58PM +0100, Manuel Bouyer wrote:
> Pass bridge name to qemu as command line option
> When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> to be used by qemu helper scripts
> The only functional difference of using the br parameter is that the
> bridge name gets passed to the QEMU script.
> NetBSD doesn't have the ioctl to rename network interfaces implemented, and
> thus cannot rename the interface from tapX to vifX.Y-emu. Only qemu knowns
> the tap interface name, so we need to use the qemu script from qemu itself.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

If you have a moment might be worth adding a note in
xl-network-configuration.5.pod that NetBSD in HVM mode requires
bridged networking I think?

Also, the qemu-ifup script doesn't seem to be part of the NetBSD
scripts that are upstream, is this something carried by the NetBSD
package?

I certainly don't mind adding those extra parameters/env variables,
but might be nice to clarify the expectations, that can be done in a
separate patch.

Thanks, Roger.

