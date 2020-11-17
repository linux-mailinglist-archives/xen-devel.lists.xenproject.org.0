Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0082B5D37
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 11:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28899.58041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keyZZ-0004CT-12; Tue, 17 Nov 2020 10:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28899.58041; Tue, 17 Nov 2020 10:50:52 +0000
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
	id 1keyZY-0004C4-U7; Tue, 17 Nov 2020 10:50:52 +0000
Received: by outflank-mailman (input) for mailman id 28899;
 Tue, 17 Nov 2020 10:50:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1keyZX-0004Bz-IN
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 10:50:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a024ab34-5031-46a9-a2cb-c96e8e4b8386;
 Tue, 17 Nov 2020 10:50:49 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1keyZX-0004Bz-IN
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 10:50:51 +0000
X-Inumbo-ID: a024ab34-5031-46a9-a2cb-c96e8e4b8386
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a024ab34-5031-46a9-a2cb-c96e8e4b8386;
	Tue, 17 Nov 2020 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605610249;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tlzdjdDywLVOnuvIHuRCFG+th2PC85iGGj0Q+vgpLEk=;
  b=W+HvRgdhUelnYYrpyXDNJTev+u0tLdzL6a3hFkrxRtlg2izP7Q7OnzvS
   JvduflyBTiZEzG52G62Qrmotx/1UPWvfS1yXrLNKh0crri3kfPVq2yVAZ
   QTtk6U70zmhGS7P6y0kSp0YIUdp3B+ClUOYia7O7tZXMumVbIfmjx9nTW
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FKjlv3YfwYSrQSW08yte8xOBAMsixhHcsyDowvcPWJu/Q/nqEwHf9mdtnv5r9Q0+G5AGN+oh37
 GujbNScSqMfq8B1mUwIAzENtVbIwPhtfhV22Anzlp8lAxTsgylEzX0niV3EHqjOZEVg5r/CzW9
 /VLIPXTIp/ZpFOuo9StMj3+/fp7Ro6Ey+bpy7MlNrc/mYZBReNCZoTKJ68IplgwAEiFrbEsw9K
 zyh9Uzd/2GGYD4pJevKB8DLpePmZ/01hM+cBVLsrWG3tSa2aHUunWb181dSKFFK5aNG+rsSiX5
 tIo=
X-SBRS: None
X-MesageID: 32461328
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,485,1596513600"; 
   d="scan'208";a="32461328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9VDXH1Zj1T0k4TcTcQt7mLiKKtl+DnaA3afWT5JwoDmNp16lh/lqyVGsRCzCR73uFPS5VSNZQFV7Il7VuIgXABO9cXOiq5iH5hVceRf1D8lVuSV9tQOHKP3eq3hXSjXnT46x1H9cu1xj5s+SBAhgf+6tA7zCjImSGboWhEPA+9qH9TfNx5AQH6hlx6uakB+22Auku5muVuaHCGg2YI6xbF+Aref1i/i+Y0UxQuq3KaDV7xaEQV6dRH7DAFJLtkdDFU62avwVJeiRNLOR2KuddWirWotjQUXrGMByB14azjIDFbX8qaoms6v98M9r/EeGX1/aqqQX5d/wCKrgp1NNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ubiuhm/ubfrsk0kdCcuBS9nyUq95olb7mUVepFOwJPo=;
 b=AQ7yQDiBLde+L+QvHzec4kTpbUcx571/KYHy6qNukOJIoMC3+h7Ygy0UN/t0zi9TmWBdnNwbMZrZmqeSohbLYOw0tLvFBpVGMcr2Pf0hLdMAE4+jjKWsWTd5FQSiGCRkKSYiu01JXwfUAVQMUSFFIEHSS1A58uE1BplkUjYxmFNMy0EC7+gRCNOZGFQDpXV+VDVBOIL3BbAjmbFxdwPtHFEH70x6ZCcf1OaAdzArXc6zem+UCzQdr0CYKEWO08395gIvk+A8W2g36LUX09y5AMoMO6HFOtS5UU1BkYC5LzvihNRnucyugnT1jdtw6zWY5Xhsql7VU5rmmVAqD36zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ubiuhm/ubfrsk0kdCcuBS9nyUq95olb7mUVepFOwJPo=;
 b=I2Z+TUpUh7N80e6Bq5DGphjK6l9SdVmOz9bUKRx6S7lOSWexExcx5TmHDBt5eqU2NlIjYXeaUokAyDXi4IfCb0kDlMjiJtQUlXrydKdaj8AYrXQylnaefEInh4/so+v4CrVvMQtufsw3OM2+luSdO5mXsILJjHsrS00Lu3She24=
Date: Tue, 17 Nov 2020 11:50:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Cheyenne Wills <cheyenne.wills@gmail.com>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
Message-ID: <20201117105039.mpfrnwvojpmfaopx@Air-de-Roger>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15b17550-1f14-4944-2e70-08d88ae6a321
X-MS-TrafficTypeDiagnostic: DM6PR03MB4394:
X-Microsoft-Antispam-PRVS: <DM6PR03MB439493DFC5DEB40D8B9626958FE20@DM6PR03MB4394.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KbU1AByWq4sjPxglErZdzHr+NIIJJg5k86WnYSW41TFs2KG92dk6tqkeXWTP1P9qTJew+Rlov8IEeceXbckUzVXqA/F7FVhCyr1g326f5AVTcyeVHweAel47U/O3rBYcKp159T9uGVMlJMR79QdIh32W+XfYViEKkQXNfQvMDd9h8GM0tSUyG9cMQGhri8GJXE/pb9i7R38gEDvBh6EtEKrqEiaAWXl8tJ1I+BPHpWlNkj2CbNiAylbz71NeQQOy2y/Y+c/qXGpx7r0iN023K7M0Ly6lkXTmW1aFRA0d9fGOeQcy54+ryIhp5nJq2rBi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(396003)(366004)(376002)(346002)(33716001)(66946007)(4326008)(66556008)(66476007)(316002)(85182001)(5660300002)(1076003)(83380400001)(6916009)(86362001)(6486002)(478600001)(3716004)(26005)(16526019)(186003)(2906002)(8936002)(956004)(8676002)(6666004)(6496006)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /OEhSO2TOyswfsityGkZlg74R5GeDsp30bRBdw2N3e76vm7vpweepvzFZbXoFmMGaNrFrIKNCxX0NUzUoR6QI4txMTCNi2FjalX3FBJsLnMBN2iVTQ7UQwsr1bo5RN6uIwIknuVPFew57h7W2b5kYThC6xFRjiE7g+RRvHwA8PWb5x6QyAIP7grOYmXJgFVTXGZpbp3D8Kb3NPaFIiuKVLt9x943JkqQ7LKYcyEfbRK1kiqbsUpDEpSDy9QBzVCpKhXUthZ60ohdBVsRWcxWWC+cMumbZ7lAOgHELIWmz7vePnOZW0pwHLCSF4atyWcymuoBsdgx29U/Ho4UK0VsdwRvowAXHkR7D9nQw1TQo0JIRAOL1d4k4n8QkbLp2fQZ/KFtWrLDBuAsriTnFVaQKAvPd/xDtABrZXx5kiyJ96DLcl6n8Do1BXwqadIPDcmQErlEfeyDtt6UaVQJ+jSCqY8AynhW6Kj5dw/A+fxr4BjxFnBF6mRBWGuZWe8VVgeOKmFFAel8eWPdgs7Hq775q1L2nkb/mUY93wY4P1n0+TRHapfI5KhEqGqG620mKlrinKKpPpmxbc9114E3nvhOIeXsddTkQjYoIatOdCfdM4umn5mudLn4rK89pXYeGSXWUWKBB0rggFHuG2yuJ8PQX4bhDhbuwmclqg9XPCxD+vIovbg5yHY2KF/06ql/3gg9yK394wgoSPpZf6fTmf/I1BjmKq9NTH/BO7yHm7Uz0Cw4Fel2DGEBoZQ5VcH6+W5Tpuhxzb9yGGRoSYHOzfFWO2iH8Dx10v05fbdMoRBJCHDkWcfTMyV4fkZFsWZCc+tCZucFkc+LaR4Q7dZ+v2jRj30jsnfbYn4cE1Q5WdgpMBACpVln0rgy63Yp4ro3VPeJtTDwMMku/IBTSzlTFowX2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b17550-1f14-4944-2e70-08d88ae6a321
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:50:45.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtTvozFX/0cnb3DnNo8tXWLc5YBT6XC+k6NAa3w17qCU2+ENrCoNy0N9ARemHafmISpHsBgkiPrceFHuSCHeRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4394
X-OriginatorOrg: citrix.com

On Mon, Nov 16, 2020 at 02:57:14PM -0700, Cheyenne Wills wrote:
> Running Xen with XSA-351 is causing Solaris 11 systems to panic during
> boot.  The panic screen is showing the failure to be coming from
> "unix:rdmsr".  The panic occurs with existing guests (booting off a disk)
> and the  booting from an install ISO image.
> 
> I discussed the problem with "andyhhp__" in the "#xen" IRC channel and he
> requested that I report it here.
> 
> This was failing on a Xen 4.13 and a Xen 4.14 system built via gentoo.
> 
> I understand that ultimately this is a bug in Solaris.  However it does
> impact existing guests that were functional before applying the XSA-351
> security patches.

I seem to have some issues getting the Solaris 11.4 ISO to boot, which I
think are unrelated to the MSR changes. I get what seems to be a panic
just after the Copyright message, but there's no reason printed at all
about the panic. The message just reads (transcript):

SunOS Release 5.11 Version 11.4.0.15.0 64-bit
Copyright (c) 1983, 2018, Oracle and/or it's affiliates. All right reserved.
System would not fast reboot because:
 newkernel not valid
 fastreboot_onpanic is not set
 ...

The config file I'm using is:

memory=1024
vcpus=4
name="solaris"

builder="hvm"

disk = [
  'format=raw,vdev=hdc,access=ro,devtype=cdrom,target=/root/sol-11_4-text-x86.iso',
  'format=raw,vdev=hda,access=rw,target=/root/solaris.img',
]

vif = [
 'mac=00:16:3E:74:3d:88,bridge=bridge0',
]

vnc=1
vnclisten="0.0.0.0"

serial='pty'

on_crash="preserve"

Is there anything I'm missing?

Thanks, Roger.

