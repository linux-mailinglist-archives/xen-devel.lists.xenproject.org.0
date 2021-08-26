Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC93F90FF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 01:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173230.316101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJP0z-00005Z-9H; Thu, 26 Aug 2021 23:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173230.316101; Thu, 26 Aug 2021 23:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJP0z-0008V0-5S; Thu, 26 Aug 2021 23:42:33 +0000
Received: by outflank-mailman (input) for mailman id 173230;
 Thu, 26 Aug 2021 23:42:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJP0x-0008Uu-NO
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 23:42:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46f19710-06c7-11ec-aa7c-12813bfff9fa;
 Thu, 26 Aug 2021 23:42:30 +0000 (UTC)
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
X-Inumbo-ID: 46f19710-06c7-11ec-aa7c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630021350;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qQRtLIxDo3dBTKtWevj4AOWpU9OBbTyN9NpI/1nvHZU=;
  b=dVgBy8g6+qnzpPJB5NrBperx8cPbTatonHId9C0XYUW+hbOOJaMfdym/
   1HjH80rlBq0gMJVm29jICK71OmzVolLpKUyEVrzcShgiLPoqu0z2FSUT2
   35xpEBB7j21SAVFtnEuD40CtKSgqG/5j92EXsOTzFgRpfTitW7r+8KW6Z
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cIv441xJEEeTq4AsL3MRboM4sY5i6yNPqEHqLMe3SrYQ68+9UbWmbI5GtUYdQG16HeWjOQZiyN
 4jXOpWHooT6Ah2iesgqoLFiZavMS8mVNugTj2P7PnheRpCIlr1eAUoRqzOPSsz3Ccq8/BeTDbg
 3z1Sv1pLjeBbHyQCboEk0HaWLOzuIKAplLVGtfzW+B8XX5GdG6PZIspWIjWleIDgPQQWvKwYC8
 m3kQeXoXGazlB4gVRwYYlg4XumjodJcQDZNFmmzME/NVfu3T62j4v6WWMse16YAuNOSyp6JjgN
 j8C8fro3vHlCAT3KbYsBn75L
X-SBRS: 5.1
X-MesageID: 51399819
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:v4sMeK/mb147Az+ohJ1uk+FPdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Scy9qADnhOFICO4qTMuftWjdyRaVxeRZg7cKrAeQYxEWmtQtsp
 uINpIOcuEYbmIK/foSgjPIaurIqePvmMvD5Za8vgVQpENRGsVdBm9Ce3em+yZNNW977PQCZf
 ihD4Z81kGdkSN9VLXEOpBJZZmOm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv2nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLbU5nghBgr/DWQZAV2Iv/fKXJy/fB9kgIm3UyR9nFohvD2xRw7hdQAo/Au3Z
 W2Dkxq/Is+BvP+I5gNXdvpevHHflAldyi8eV56EW6XYZ3vBEi93KIfwI9Frt1CK6Z4gafbpv
 z6ISVlXCgJChrTNfE=
X-IronPort-AV: E=Sophos;i="5.84,354,1620705600"; 
   d="scan'208";a="51399819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmZDpQmMao+xzqH1G57ETCYP38TZH4ooyFs4oAU0r7h6SgW9vgsyBUb1WKYVtwUl8MGHXd6dxfcDtKIlHXRmT8ERa77PfbKafQhZgfjvs7GJnNOJFA6/pg262eV2rMwL/Uybn3bwwilo8vHpWBXrZifPAKwsI3KMELqvtU6A/nSzhDeby6YL3Wfy+FNwA+mEP2ImU7sKdubEJ+tefTH4RZqa4XNvnICjjKn+yrrQVtH40vHUYJQ3+Q0MRroM6lsRrG3zIt5jzxLv1FGNBwaBOuDyQvJm5uXQ2HSGOkPj2kgxCJMk0w9gXKI6IteEJCYGjGbru+p1HZoOdyRVWo2nPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQRtLIxDo3dBTKtWevj4AOWpU9OBbTyN9NpI/1nvHZU=;
 b=C2/JrSWDFv3qb8lLTYC8w/jNidzu/wpL6VprkfDBgZB75ewkPiHhmH3Y2rDgHAzXFoyxtmYwWLtyuadd6ylrhZYAknsIRdgV6QONnEmHg6XQ5vIMQ3hKBJMWHeKqRxvJL4sDkYm1OfYkIkZcOy1D3dBXAjkKFJObWjL3mEDc5D3LrSnIJy9PdCo26AoZBtV762dMed1nhE3c+FRAp70zW1TJHcTJNfBSxYpQeH4BBK/LpBqxg0E67/CQa5YW3+tb7fsDwL+kG3o9VLFQoj2dvX6fdHbX9tQc4OnkNkhrnayHyDsbHvUQZo/4UmwFlLc65pCSPSqMiw6vQBB9At2/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQRtLIxDo3dBTKtWevj4AOWpU9OBbTyN9NpI/1nvHZU=;
 b=c6CbZ0IE51iek7MouLSGpDpp7hUODxHHYXhu6PO5buZXmU8Sw8Zr8QTtdF7ql82TnSVjBaT4AMDyV1EmDLDt2vVgwgkv6SVl80G+doezw8CfWsZo3D2S8mK9EZ61lgy/sEHjtC3uBE0Xi9PahAg8O7u8iSOKbj9Ax2zjpV9bqhE=
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>
References: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: HVM guest only bring up a single vCPU
Message-ID: <781aeba6-5e77-9995-cf58-9dc6fd443ad8@citrix.com>
Date: Fri, 27 Aug 2021 00:42:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0386.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19e33158-ff4e-4d67-bcd7-08d968eb1d0a
X-MS-TrafficTypeDiagnostic: BY5PR03MB5156:
X-Microsoft-Antispam-PRVS: <BY5PR03MB515628E6D9DB9EB9C153B980BAC79@BY5PR03MB5156.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4L6QqJ7mt01QJpQfxXo1kFeIuAeu7qnia3iaFXuOyh+FovpMUSh48tRXgVHGffOqx5JZUBNhIpj0bjGnHlR1mvNelH3BnJ8avuPpo3uqEjzR4ApRmxZbm/Te7cKBx84bPLneXc/82NWmIt6+xiwoUa1BQ9sZbaKeYzzfFpKzmyVGhWmtKBRUTnY7hIyd40j2fVXiP94nIH1u8NKAjOorD9D93TCoEBxBl7rx2BY1ZRhTsoGBquWAq1kqiWAEAYJjS33yA/SnqK1apD4e4niL20wARDLn5Bz0j+C01GDRLiNGdCfhHI35SPTRlM+FrdPLaw3bETrlwujGVxpS2XK0TzbiVTm/VZxZPeYkTeWb3YMx9jcwwXwcUZ+XLRhCTETQVBW/rULzk5RAfGF/tTOnRSBYxPRYjZtQKxIHuBfyzDY8u4hCHn5GBjpQ7McLfep6BM+yzrVjCs0oA3heA/2fGtyC68kz6aG3Wh0ZZG/SxGuIsERaAPnWXjTQ4ziC5nOWs7GubyczyAr9t/lBK90Rr2BuIK9/3cReXMweOdSZZ7bzWNBXlkDWJBwAyRD788/onOd9SkTHi8zowVUo725SH2FYwSHE7dqzLtpP0VmFEJ/+aFSw9kaMS6m4ZBD7QSZbJk2x41RfHEogWd/ieuYSjhZnSNl9p/o41Cuosf6zRnvZbnZqDUN1lF3mnK2Xs+mxyXnP8+94Y2S2dkWu92IaAHBs+bijL+rsxH04Q5WXoy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(16576012)(53546011)(5660300002)(31696002)(38100700002)(6916009)(55236004)(4326008)(8676002)(36756003)(2616005)(8936002)(54906003)(86362001)(956004)(316002)(186003)(6666004)(66476007)(31686004)(26005)(508600001)(66556008)(66946007)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZPdDJmZzFVYVpoWUJScWVRM1FoQllyUFllY0lkVWZUdDJ6UWxYejExT2tk?=
 =?utf-8?B?KzZ1ZFcxdjlZdkNiZTk0ZDQ4RnIyd1JOTUZDcTZrMzVsTXFFK1Nqblk5QXUy?=
 =?utf-8?B?WXJKRHAva0NlVktWNW5xcEtBTW1rM2g5dklweHRZRTFNYUthQ051U1RjbHBE?=
 =?utf-8?B?SkQ2T1pjY01GU2RtbDZpRTdqdWNacUFtRDJVYjhLQkpzcnowMTlJSCtZNHRS?=
 =?utf-8?B?YWVtTmI1TW9HMnFFRXUyeDlJSnVqSUJicWc2UGU0enRwZlZtN1llbnJmMW4w?=
 =?utf-8?B?K25pOUxRL3lVam5yK0s5YmNTUlhUblQwaVhMYUs2dHNXMWI0VyswOU5JSC81?=
 =?utf-8?B?cCtmdzlpcGdjN1Q4WlpGTEFrSHBucSs2L0FITXY2UnpENEtHamN4Qnh2b05z?=
 =?utf-8?B?UUd4QUJkMGdpZEtNd1lscWFqNURuRWV3ZXk5ZzBzcHZpMS83RWFFcXlMQkxD?=
 =?utf-8?B?Sy8zbUpPTmlhTHQ0T3R3WFV1eDRCYUt1TlBqdksvbzBHemlBY1VoYVl3NjRx?=
 =?utf-8?B?WjFoYVVmMkEzaEhNRnAxd2R2WEtUU241OWxhTnV6TnR5QnNNOFdJYkowYTRl?=
 =?utf-8?B?Z3p4L00yd0VCbWhJNHJ5ZWhXS3VLR044NHFJTnN1TlVZVXFwMDY5UTU3Z1Q0?=
 =?utf-8?B?cTZsb2lyTnczZ3JsSWRENVlwc2JJMVZYc3RXbmxZamduR3Q0WVhmRFJqSFpl?=
 =?utf-8?B?aEp6WHE1aDd6d2o1Q3Z1bUxSdWpWb0FhSlhGaWhha1AzSDJGeUFuS2wyenVJ?=
 =?utf-8?B?b3lXWEhITE5ENzVoa1ZWZjF4UzJrNFN5UlJiSWZLbDVPYnBMSkhRZnFHZlBV?=
 =?utf-8?B?ZGtTSS9VU0t2V1ErZU9uWWs1anVIRWNPODRCRjFEcUFaV1FtT3RFeS9EOG1s?=
 =?utf-8?B?Umx2V25tYTI2dGZpQmlrb1ROR1dSUTJXalFBcUtOMHRGa01pT2dvME85UnhS?=
 =?utf-8?B?Q0lvSHpyekZMRnI3YzJHN0RpakpFR09QNEdSMmE5VjE4bWlrV1hRRXFMUWhJ?=
 =?utf-8?B?THFtdkQ5empaVDE2WHJlaWlFcmpNWFVDNWJ2WVZESXMvekJ3QnRxODJWWUtE?=
 =?utf-8?B?anVObm4vdVZ0SnV1cmRxVkh0QVZ6ekZrTXNNOGpNQVgrQnRXVnNUU2NnamFm?=
 =?utf-8?B?MmtOSjdkY3dMSnV6VXRndVVLR0M2eUVPQmNCaENlZUg5a1J6U3VjeXhGWkJR?=
 =?utf-8?B?bXljczBNS1g1S0lQRGo4WmFWbXloMkxjQjBmT3FCbmh0N05XS0V1cVh0cGp2?=
 =?utf-8?B?OUFSWEthM0dJNzdEQWZuVkwxSnR6VE56QXhwYTYybjd2TDNPZm5yNkVDOGc1?=
 =?utf-8?B?UnMxakE5TC8yOUM2WFo1K3EyZG9ma013cFVkenZoVnl2RXdDd01XZVpCWWJr?=
 =?utf-8?B?SWdXbXdCc1hXSU9CeUQ0K1U5WGFGL003OU1IZVVXOUtDTFpZMU9Dczh0STZj?=
 =?utf-8?B?R2RTYTYycTVad2N5Um96SzJHN1FmZFRHOFdiM2hPY1FuakwvbDh6R3lzemJE?=
 =?utf-8?B?MklxWElGUUNYditoaDl5aHlKZXNvYlkzRWN4dndwTFdWN3lyQk9YbEp6dTFZ?=
 =?utf-8?B?WVd5aW9pRGQzWFJqUUxzcVZvMU1ZYW1Ec3RuTStkN1FpQU5jY2lzMVdLblBJ?=
 =?utf-8?B?R3lKNnNlOTFjOE5FUFdtM2VLdmhoMHlNNXNML1VQRzNMenkyVWw5a3JxS3dR?=
 =?utf-8?B?S1dGY3YyTWtWeWhUV09oVW0wS2NyaURMWFNDVlNHTU5ySzR2Uzhxb0dNRFZ0?=
 =?utf-8?Q?GwcRw8j+TwEz2CB4JBQrDsr48UGv65zmk8W+JZd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e33158-ff4e-4d67-bcd7-08d968eb1d0a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 23:42:06.4621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3ce7vSL/LA4pru4mohyh9VFAr1MKWYamat/33d99Ab1w+92dL1pi0KH3KhJbBRxn+IFa3wUaGlXe7eM8lC3iycv16q6o19M8aZXT+MjNlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5156
X-OriginatorOrg: citrix.com

On 26/08/2021 22:00, Julien Grall wrote:
> Hi Andrew,
>
> While doing more testing today, I noticed that only one vCPU would be
> brought up with HVM guest with Xen 4.16 on my setup (QEMU):
>
> [=C2=A0=C2=A0=C2=A0 1.122180]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0=C2=A0 1.122180] UBSAN: shift-out-of-bounds in
> oss/linux/arch/x86/kernel/apic/apic.c:2362:13
> [=C2=A0=C2=A0=C2=A0 1.122180] shift exponent -1 is negative
> [=C2=A0=C2=A0=C2=A0 1.122180] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5=
.14.0-rc7+ #304
> [=C2=A0=C2=A0=C2=A0 1.122180] Hardware name: Xen HVM domU, BIOS 4.16-unst=
able 06/07/2021
> [=C2=A0=C2=A0=C2=A0 1.122180] Call Trace:
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 dump_stack_lvl+0x56/0x6c
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ubsan_epilogue+0x5/0x50
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 __ubsan_handle_shift_out_of_bounds+0x=
fa/0x140
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? cgroup_kill_write+0x4d/0x150
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? cpu_up+0x6e/0x100
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? _raw_spin_unlock_irqrestore+0x30/0x=
50
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rcu_read_lock_held_common+0xe/0x40
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? irq_shutdown_and_deactivate+0x11/0x=
30
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? lock_release+0xc7/0x2a0
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? apic_id_is_primary_thread+0x56/0x60
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 apic_id_is_primary_thread+0x56/0x60
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 cpu_up+0xbd/0x100
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 bringup_nonboot_cpus+0x4f/0x60
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 smp_init+0x26/0x74
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 kernel_init_freeable+0x183/0x32d
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? _raw_spin_unlock_irq+0x24/0x40
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rest_init+0x330/0x330
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 kernel_init+0x17/0x140
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rest_init+0x330/0x330
> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ret_from_fork+0x22/0x30
> [=C2=A0=C2=A0=C2=A0 1.122244]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0=C2=A0 1.123176] installing Xen timer for CPU 1
> [=C2=A0=C2=A0=C2=A0 1.123369] x86: Booting SMP configuration:
> [=C2=A0=C2=A0=C2=A0 1.123409] .... node=C2=A0 #0, CPUs:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #1
> [=C2=A0=C2=A0=C2=A0 1.154400] Callback from call_rcu_tasks_trace() invoke=
d.
> [=C2=A0=C2=A0=C2=A0 1.154491] smp: Brought up 1 node, 1 CPU
> [=C2=A0=C2=A0=C2=A0 1.154526] smpboot: Max logical packages: 2
> [=C2=A0=C2=A0=C2=A0 1.154570] smpboot: Total of 1 processors activated (5=
999.99
> BogoMIPS)
>
> I have tried a PV guest (same setup) and the kernel could bring up all
> the vCPUs.
>
> Digging down, Linux will set smp_num_siblings to 0 (via
> detect_ht_early()) and as a result will skip all the CPUs. The value
> is retrieve from a CPUID leaf. So it sounds like we don't set the
> leaft correctly.
>
> FWIW, I have also tried on Xen 4.11 and could spot the same issue.
> Does this ring any bell to you?

The CPUID data we give to guests is generally nonsense when it comes to
topology.=C2=A0 By any chance does the hardware you're booting this on not
have hyperthreading enabled/active to begin with?

Fixing this is on the todo list, but it needs libxl to start using
policy objects (series for the next phase of this still pending on
xen-devel).=C2=A0 Exactly how you represent the topology to the guest
correctly depends on the vendor and rough generation - I believe there
are 5 different algorithms to use, and for AMD in particular, it even
depends on how many IO-APICs are visible in the guest.

~Andrew


