Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E296479EC61
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 17:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601484.937489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgRbJ-0003iq-SP; Wed, 13 Sep 2023 15:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601484.937489; Wed, 13 Sep 2023 15:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgRbJ-0003gF-OT; Wed, 13 Sep 2023 15:16:21 +0000
Received: by outflank-mailman (input) for mailman id 601484;
 Wed, 13 Sep 2023 15:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fff5=E5=nureva.com=anthonychan@srs-se1.protection.inumbo.net>)
 id 1qgRbH-0003g6-Oo
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 15:16:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20730.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c582773-5248-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 17:16:18 +0200 (CEST)
Received: from DM6PR20MB2779.namprd20.prod.outlook.com (2603:10b6:5:140::30)
 by PH0PR20MB5868.namprd20.prod.outlook.com (2603:10b6:510:28c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.32; Wed, 13 Sep
 2023 15:16:13 +0000
Received: from DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e]) by DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e%7]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 15:16:13 +0000
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
X-Inumbo-ID: 7c582773-5248-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLjhMZoBptIA7xq/DA6R3fvRxZLXSf/KGZ03cjP0MgYutBxhqZ6TanQh242ss6sH6/p896RqCMz7hsL2h7ti9ol1/JlQVV4tnqiQW4dUfyCG/JuMST+36WNJ5qKHqcdVvgRbmlIic29AneL4Tv/FjxdC2Z+5L4A57WpGmITAZ+c6S8Cn5HdOtsh3sR1HtxycR0jFD+YobOeRL30ZhriBO2GWIIJNsoF6rukOm8EMNQhOAB5RZLAqVdsGb06hJy74yaL8e/pxrOG+ANPLUOEvTRWTiNFVJMCQZb4A00nFj9DnxkU83t+4gNFINJD+hftTo8cAtzDHVt3lz40sP4SPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmmsACECVviZJ2mdN4XRi7iU34hFjDIwSw+ed/WV6ww=;
 b=hJs0r5+oug/+i83sYK7Yz+fLeaGe430vo/hvtYYViUnI2Bttxle58j3LjlElV1h+ax+lTCQDPWOrpJUFkGutbKYOUCDD5O/8Ot9z4lLlVMPm6lN+2+N6Kh60v9RGhS80z/FYbMKm86ElY1W2bT3qVUa9AHkJiGY9QH+R/WbhuhF8dAeZ1q6AA8BQjQ6Mfe6jVo+UGpPnSnN2lo6HsEyzTQ36vQ93TLCUVqVr67nRTrCHGkAbUi8TD4YGqFNQllhd+2GQQEE1XUu7DI1YSzU63LpBGDJPt+QcGiIFJ//wwphd053R4sJ51brNeaFgVK0qdRq9o3gyd+htQACCDVmWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nureva.com; dmarc=pass action=none header.from=nureva.com;
 dkim=pass header.d=nureva.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nureva.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmmsACECVviZJ2mdN4XRi7iU34hFjDIwSw+ed/WV6ww=;
 b=pJBW0hpbxVvp5BHHWegz7OakSi73PT2HIe0TBO6P4I+iwiTimwlzDXwAovpkddsNaJkMBZY2nUC7EgRbvG83aYaGpqybu75BhZve3GJxj/B2/1El3ove+k/oEu4TJw7C8SV5ecrfK4JzoH8Rrom/jbyeP+5vED3VdVtKHLeavVk=
From: Anthony Chan <anthonychan@nureva.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Dan Waqar
	<danwaqar@nureva.com>
Subject: RE: [EXT] Re: xen arm64 low power sleep support
Thread-Topic: [EXT] Re: xen arm64 low power sleep support
Thread-Index:
 AdnanCj70Orzia5aQfSER7H0AUNnzgAKb5uAACL7QIAAFccGAAAoRLpQAQalgwAAJhokEAAI5CkAACis4mAA1S71AAAexGNw
Date: Wed, 13 Sep 2023 15:16:13 +0000
Message-ID:
 <DM6PR20MB277966FD3886CAFA912A81AEC1F0A@DM6PR20MB2779.namprd20.prod.outlook.com>
References:
 <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2309051848590.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779A22E8CA641F0B2BBF038C1EFA@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2309061629460.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779BA8D352E566A350844FCC1F2A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2309111822330.1847660@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309111822330.1847660@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nureva.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR20MB2779:EE_|PH0PR20MB5868:EE_
x-ms-office365-filtering-correlation-id: 81ad1284-9ab1-487a-bb0c-08dbb46c5e2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UlXfahutxGUzd8Hzqx7qzNjOsZUFg0QBdqeCznr7jF6tkKaeLOvv/i9IQHNogJ7N3602w/iBX/D6s8JoLPYv4MqKSrTbTeyQ5TDZ+/OUqaLb7vGYnrm6dj+po/1bM0WDN6ypfIGmDHR+4bNn82tRIUd5zG9MrtMpXCrVxmYu6wiAbHKnCzpPyjnHCdl4DSaDnMJ7wxLDrRrT7A6cwvXa6ddljHnpeIbBOkZ5H3zrZM0yYjPOa248cTrOBZoLCt8ZGsiRVBKAi78ZsZ5KqKBf4xCrtMOr+b2LtbiU30gw3sxjdl1qPmEUPOIyQw/2m1m5Jn7wvIGT+C1E+T+voeiY18NnOIs+/+yySRG7hAGwJzjAZ6O94X98rcOM11APV32NEPqmIflOf+jiCNQEy5mUPM1wQL23fQt9LoHy09GsRr6P2v1o+nbnUwQYaGFyGKoR8GYSLiZnBvhH5NtgfoLntSttAtXDD+YzBDPxk/vHAWhx6wMmYB0j0MTwuTD7pXxB67cM9xbHG79Lcil1tkQA00Tn4UcCQo0qwFExENI7H20TfDST+JQwxc3YumS8L5VK1o7+HL2SUjwynZ5NOtpGFh3XXycJ9DQpmwReUHI+B+DdcxNlQveT4ayMjPcyFyqo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR20MB2779.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39840400004)(396003)(376002)(136003)(346002)(186009)(451199024)(1800799009)(2906002)(4326008)(52536014)(8936002)(41300700001)(5660300002)(66476007)(54906003)(66446008)(76116006)(64756008)(66556008)(107886003)(8676002)(316002)(66946007)(6916009)(55016003)(478600001)(9686003)(7696005)(83380400001)(6506007)(71200400001)(33656002)(122000001)(38100700002)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?b3WVhQMIdQfdJsXIMQtTBDEiq3qpsQR5uxz4nI1MuukN00COfDDoFSUqffCA?=
 =?us-ascii?Q?mY7yhGw8ASSnziOUrVWZ3nxbkXXZ43a/LaRVGvxS50UDNTohb/+EwO0Hvmy2?=
 =?us-ascii?Q?+bJw8IKUE7LUEaoH1dePGNbPxyl6i1JYDQeSnaove7cU1E5i/z7ZlmNIhmSJ?=
 =?us-ascii?Q?ww7ozODR7y6vVrRxWjVhCfwkCbitsuVWOzVFB9ddDLLIe5/BPedmr7JyWhMm?=
 =?us-ascii?Q?MF+vLcTAGYbOY7AnxJryC6qBeIF0bYfBCnK2TJ6gzARPcWgtKt5v3XHKMESo?=
 =?us-ascii?Q?xuswuz1BHESMiVDTl5HcqQpQtkOvapkc8K/Oi5xsQJzvJfmQdxKcKTdycUra?=
 =?us-ascii?Q?cBiJCSthZ0hwyp3b6uYVpOXBe/C3Fr+7yZ7wZ48nJmFoKwqS3p7CbLBwUSBt?=
 =?us-ascii?Q?owmv/+E02jZFayOecusv55m3LTSJdS0pizoGaPt8m2/h1DTIpUKfpxPUdOu3?=
 =?us-ascii?Q?UEjAjZS0nGIVrfer8LDkrkLIlMyzkO/Bt1F6oVXJfJ7F8FoEaGz4dtJAMuH7?=
 =?us-ascii?Q?5DnUX9CPT3m0SzgSpJDaY0KMzEpsuRjyTnf/NvCXMi0duglwpP5TgXfvLLsZ?=
 =?us-ascii?Q?hEj8R+6XKUO0cv10Yn8rmShevWbQmXL7o8kbNfmDwIoP4PeCno0BW5Y0R804?=
 =?us-ascii?Q?tLPKcCJ3IX0qBQ7CX7ggvMc4sPcxjE1pRR/58CeGKPAw4YgEiOF+Cj/fmKm9?=
 =?us-ascii?Q?Eu+6MqnFc8jac8tw/P7+7TxtvUaq6OOiYWxt4uJgMtFYcRusukEhcW8Iw5Th?=
 =?us-ascii?Q?V6gLwB4NO1RMBk1KmDKcNPHKXtEts3yArag+him/NzYmsyzway8dzIWXSZqQ?=
 =?us-ascii?Q?/fKxJTzy8f11vWI4ZfmByyWtwzJ8JamlrCGFbiFkBKGbwgDcn24fzVElxB1K?=
 =?us-ascii?Q?q+Uopag9PiqcVfU9XGRq2zm2GkfgIvUFyTedGnhzIZdOJXAL4I9iU7eq4Xs2?=
 =?us-ascii?Q?2xnw86NlcvV1NuH7Taa7B/dJToNPJwgq9oc/sLMoxgGrhin490RXMr7+eZuL?=
 =?us-ascii?Q?iXN37za3WDSL/zVl2nDCN8GNJeWDG4LXf4PYkdonjwV3XxyWPgWvJr/bRDWE?=
 =?us-ascii?Q?303cBYJBMCyb2+BncVYybrteDSpEdbH0/2/J0WLvZmF86WA0xh9ZpW5QXu/J?=
 =?us-ascii?Q?OU+QbL6Rcurqxt9kU5MWZeFqgPukunwUUD5EY2+oa+rojXTPZPqAA005NfwI?=
 =?us-ascii?Q?ICLyZXZFXWEjfF5p4tH+C2eznWeX4Ii4auaEkWna4+6MiUe1fTIoDZNCiFKs?=
 =?us-ascii?Q?CseBTDrIqgUp3fRI22PiueoIBiHk7a95hWWAz+DB2YPOTWI6qnPoGLsZykAo?=
 =?us-ascii?Q?/wNtY/7cxW/QnH78CVbOe9UEuRnq1eqAfeKBUPIBPTiBFRoXKjeWUS6s5KTW?=
 =?us-ascii?Q?VjAO+LxLiXjPBTohujpjPPMgZFS5kcH8g6kvGWa5HRj9tnX8SIKugVzcYQZ8?=
 =?us-ascii?Q?DO+s+3A2tjg58KGOmzCRMiwIvJAaPs/ZolJOCABHRgmhTR8OdfyyCPpWetMz?=
 =?us-ascii?Q?f9nJvt/yqsJX31OhyUGuzdud0+dwumlf0xcWwvtDSSqSqkFOefxWpSCDVZZt?=
 =?us-ascii?Q?FFe4/J6WFuoq+Z2/48Khex8r+30Qo+j7xG8nI1xg+PJSq9Ywz+N+/wyBdDEm?=
 =?us-ascii?Q?sbxnLMvM/7z8xXOuatQV1pm1C4TkwNGZYcygK5h4D9m0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nureva.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR20MB2779.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ad1284-9ab1-487a-bb0c-08dbb46c5e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 15:16:13.2260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5aeb77fa-643b-473e-aee0-cb54a11ccba3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sezwO9gr4QALePBHArdVFGg2rDlhIbPtDIpGmVcFJCas4djjuDAVZf+ERHgBEHPg4ijeu3aDJtgE0H5Q3Pj64A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB5868

On Mon, 11 Sep 2023, Stefano Stabellini wrote:
> On Mon, 11 Sep 2023, Anthony Chan wrote:
> > On Wed, 6 Sep 2023, Stefano Stabellini wrote:
> > > On Wed, 6 Sep 2023, Anthony Chan wrote:
> > > > Thanks, I've tried patches that stemmed from that discussion but
> > > > unfortunately, doesn't resolve the issue.  In fact, the
> > > > s2idle_loop branch might not be the problem at all.  I
> > > > experimented with Xen to allow the 'idle-states' into the FDT and
> > > > prevented xen_guest_init on Linux from disabling the 'cpuidle'
> > > > driver (arch/arm/xen/enlighten.c).  When I trigger a suspend, I
> > > > can see now another thread (believe it's the idle thread) call
> > > > into drivers/firmware/psci/psci.c:__psci_cpu_suspend and then the X=
en
> > > > counterpart at xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend.
> > >
> > > OK but remember that Xen is not implementing do_psci_0_2_cpu_suspend
> > > correctly at the moment. Either we need to fix the Xen
> > > implementation, or we need to configure Linux so that it calls WFI in=
stead
> > > of __psci_cpu_suspend.
> > >
> > > As a test, can you try to apply the attached patch to Xen as a
> > > tenative fix?  Or you could change
> > > drivers/firmware/psci/psci.c:__psci_cpu_suspend to call WFI instead
> > > of the PSCI operation (making sure to go to the entry_point instead o=
f
> > > returning).
> >
> > Tried the patch and substituting a WFI for a PSCI op, but Xen still wat=
chdogs
> on the VMs in both cases.  I noticed the other Linux generic arm 'cpu-idl=
e'
> driver which used to do issue a WFI/cpu_do_idle isn't useable anymore eit=
her.
> I'm not sure if Xen may have used to rely on this generic driver to get t=
he WFI.
>
> I was running out of ideas so I went back to look at the watchdog console=
 log:
>
> (XEN) do_psci_0_2_cpu_suspend
> (XEN) Watchdog timer fired for domain 0
> (XEN) Hardware Dom0 shutdown: watchdog rebooting machine
>
> Checking the code, it seems that the Xen watchdog is set by
> xen/common/sched/core.c:SCHEDOP_watchdog, which is called by
> tools/libs/ctrl/xc_domain.c:xc_watchdog.
>
> xc_watchdog is called by tools/misc/xenwatchdogd.c. Is it possible that t=
his
> problem is entirely caused by the daemon xenwatchdogd running in the
> background? What happens if you kill xenwatchdogd and try again without i=
t
> (even better not start it at all)?
Disabling that daemon resolved the watchdog timing out.  Never noticed that=
 daemon running before.  That clears a lot up and I think I understand what=
's going on here now, thank you for the help.

CONFIDENTIALITY NOTICE: This e-mail, including any attachments, may contain=
 information that is confidential and privileged. Any unauthorized disclosu=
re, reproduction or use of this e-mail is prohibited. If you are not the in=
tended recipient, please notify the sender by reply e-mail or telephone and=
 permanently delete this e-mail and any reproductions immediately.

