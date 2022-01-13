Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E098C48D6C6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 12:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257140.441770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yTb-0001uO-Ku; Thu, 13 Jan 2022 11:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257140.441770; Thu, 13 Jan 2022 11:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yTb-0001sH-Hc; Thu, 13 Jan 2022 11:41:07 +0000
Received: by outflank-mailman (input) for mailman id 257140;
 Thu, 13 Jan 2022 11:41:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7yTa-0001s1-JR
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 11:41:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae771231-7465-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 12:41:02 +0100 (CET)
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
X-Inumbo-ID: ae771231-7465-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642074062;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OQkvPVfHtC9itFzEKwiWYcXmq7frihiq4T1pHAYvacw=;
  b=VNlXHYRZMyCBZsxQaDZ1wrH3okNDTsr7Cuactcj7fA8WX8mSM7AyecPq
   nw5IRXqjPezM0nj40Yz/MHUkpaKCRxQl8q9PIRoeZW1AFkYfauXp+rWth
   IAHHfc49O+F/reuHaa4aeRhiT/c59GcrbR+Qzlv7bO+zeffWth4H8sNAV
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3H7nXsMPztkyviVA3Zmx/BUhvXGoB2r8JnCc7uMbt0YuMZgE600tiWK1ZraMaoeqdfz3LzTrAC
 RJF+QUrnhPrjGVipZy5hNJ9da5bNoTypbVxJPHS1BYbU2IPNvpvNd84100iyoCPD/nM7rZd0OB
 Xqo2PnGsRM3mYKqkqDTCCgNW0euD0Gwz0j5E+UD6/6VqGJqIcyY82FRTx9aP9csr44jCJVi+7m
 LyHAzXyNgFkk6T+W0gyBZVtYETKQyzkkLPAbmUUgV8S7Y9hasG/vxT+9aQGsu3C7Pbw8Uqdqvj
 YrFD6/bCGIp9fkd5xXw8WYVE
X-SBRS: 5.2
X-MesageID: 61911924
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Fd7ZAqCyMJTSmxVW/+nlw5YqxClBgxIJ4kV8jS/XYbTApDgl1TxSz
 GccWj3VaavcNmX1c40nbYyzox8O6pfVyNdmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940Ek7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/lyyluPN1j
 /53iKOOFlgYeYiXhr03XEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHfybvIYJhmtYasZmAq/Ud
 ZMpNhlVaFfZZhpiFFgvJMIitbL97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibcdfk1ucp
 2nG13/kGRxcP9uaoRKs6G6hg9jqjCzyWY8MPLCg//ssi1qWrkQUDBAVTlK9reOOg0iyQc9EK
 0cU9ywtqoA/7EWuCNL6WnWQuneEoxpaQNtWHO0S4RuIjKHT5m6xDGUeUiRIbtBgscYsXCErz
 XeAhdavDjtq2JWXVHac+7G8vT60fy8PIgcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxAA3gbkJ15ZTj420+FnGh3SnoZ2hZhAy4gLbT2e09DRzbYSuZ5GrwVXD5PMGJ4GcJnGGu
 HUHgMGY4Po5EYCWlCeNTeMOG5mk//+AdjbbhDZHBII9/j6g/3qie4F44zxkIkptdMEedlfUj
 FT74F0LosUJZT3zMPExM9nZ59kWIbbICc3JcdPQKfF0X6dPK1C2uwQ1exe60DW4+KQzqp0XN
 ZCeeMeqKH8VD6V70Ta7L9sgPa8XKjMWnj2KG82ip/iz+f/HPSPOF+9ZWLebRr1htMu5TBPpH
 8Gz3idg4zFWS6XAbybe6ub/xnhafCFgVfgaRyG6H9NvwzaK+kl9Wpc9Ipt7IuSJepi5cM+Sr
 hlRvWcCmTLCaYXvc1niV5yaQOqHsWxDhXw6JzcwGl2jxmIuZ42ihI9GKcdtJeB8rLI/naUuJ
 xXgRylmKq4fItgg025MBaQRUaQ4LEj77e5wF3fNjMcDk25IGFWSp46MkvrH/ygSFCun3fbSU
 JX7vj43taErHlw4ZO6PMarH5wro4RA1xbwuN2OVfIg7UBi8oeBCdn2q5tdqcp5kFPk27mbAv
 +pgKU1G9bClTk5c2IShuJ1oWK/yQrQuRRQLTjCLhVt0XAGDlleeLUZ7eL/gVRjWVX/u+bXkY
 uNQzvrmN+YAkkoMuI15e4uHB4pnjzc2j7MFnAliAlvRaFGnVuFpLnWchJEdvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzoOiNX3JNMkTekydaNrZ0bt8om
 L9zpM4M5gWjoRM2KdLa3DtM/mGBIyVYAaUqv50XGqHxjQ8vxg0QaJDQEHauspqOd89NIg8hJ
 TrN3PjOgLFVx0zjdXsvFCeSgboB1MpW4B0TlQ0MPVWEnNbBl8Qb5hwJ/GRlVBlRwzVGz/l3Z
 jphOXpqKPjc5DxvnsVCATyhQlkTGB2D90Xt4FIVj2mFHVKwX2nAIWBha+aA+EcVrzBVcjRBp
 ezKzW/kVXDhfd3r3zt0Uklg8qSxQdt0/wzEucamA8XaQMVqPWu72vejNTgSth/qIcItn0mW9
 +Bl8dF5ZbD/KSNN8bYwDJOX1OhIRR2JTICYrSqNIE/d8bngRQyP
IronPort-HdrOrdr: A9a23:Y3DpFahX2RoP3qsVOmbeFOUH13BQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUZqFh5dL5iUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHkondotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="61911924"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwwKK8Kx/pOmaohb4HeR+Zy4CHtVXhIjoa1EDS+Vl89JY/HjnlBTs0kUl0L9H0WKHT9f2IM0sdBvhsDBudNEZ3UnZJnmaGQv+QSwgfQliju4Ok2Act16okSzOPkbWYEyX57D4VSzwPX7NqRyuPR8SgBeAlMw3dnZUX0YXTNpdmu+4aTWtYLQPhdRcdO9R4s0hw0NU/y2AOyXdUHTlM/XIIx21wt+AOp/5Wc+GHl5PaodOD4KX/FuR3BFZjDl4Y1pXr6q3dULQCGV19GN2RoPUyo1RScvagmmODaSENdwsvVuJ2rklBHg1k3PHOg3GSODBPpD/iveaM4kjaG5Q/WXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Whnu4s4Kz3TznB2fQ1mDh5SGxRBCi6ctjNEfiolaOGo=;
 b=g15iX11cIb6BcMy3c1LHi/f0AVi1aqQHFOhq9rrrlWDOPE2HpDuX3SH5hRbwU0+oruGYkiIiorQDfMJJrzlHKZGTrnVosbI0I27Sbax1Ujxolcv9wjFyk7uY754ZGYbNiiOmL6eDL/3bZoQgViXhjnbsitNIFtn9QbkazYDPifeR74loQlDkU1njQ2xMZ2MZqdRuN/uRlXymThjOOczbeBX/NmC69f5n5+LFOHdM/YaAt0GRjzs6MJXQVBlw8H8gKmdIZpwjRA4WkTITH0BaQXgHcCWHRLCegbixDw6OmDWTTNHuPAfAvdlRTWtH2fUYR6mlQZtDxZLfHcwyzt8FMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Whnu4s4Kz3TznB2fQ1mDh5SGxRBCi6ctjNEfiolaOGo=;
 b=NCa/b3SSkD+udykav9SDyqrANRDE573getIsyWuPEb2PJ9AUNCGlTlR4491s/iWbkDB34VHAELtSxrQysuakmyTfOenNCOa61Fz1frY70wqrgXmu5SFvKmW6q2WoJ7VPa+rvJ57Wypu86dWSM5aHK+jMY5m4l4tRtYPF1Cmm+zQ=
Date: Thu, 13 Jan 2022 12:40:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Message-ID: <YeAPxA8gZZ/xBYdA@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-6-andr2000@gmail.com>
X-ClientProxiedBy: MRXP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ba4a4f-3f9b-4f74-2b84-08d9d68990a7
X-MS-TrafficTypeDiagnostic: BL1PR03MB5973:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB5973FB507C58CBE3B3397C1A8F539@BL1PR03MB5973.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5DiQrX23sgCBZGiM6GUBqzXMq8kcU26JHCDrNKkvJqHt1o3vrxgXFN0xAW/6cDa77GfMh4w9Wm0Clc9+tBA1RX1NtvaLKV4hzDxn77QID8c2vHhRsRjYuT7G7GwMudoD3nAA9mCWJ8vLzsYPNVBtYcvYdDrXNV8CQrhcSBf1jcyVZUMRcwV8AIS/upajAS3OMV7rpE8opMbESo2FuemI3nxsYcFQKXhQAR3BLbL/nkJ1fHXIpTXldis3PcTOy8iZNxjahNn2vJdH3rqUYX9yJJ0RgTTN2oqeHb2JkjoRlGVvxqY9LCioaPPaWbeIp3wh95X3IDA6XHtUBRLIASSkZRA1x5kdLGtglZkx6famM09z8r8nvlYgZiK6ZPeDMBd+iBd5jcArWysnBtCh/PzI3dC/ZTcTv7Oj4A5taUmycWvp3Bp3R5apYrnnT29b7so0aB2qRm0DonRok7Bwq8pu+kW1io9SIBC0F82uibdNHE4LFCso+erLdp/p/azdoVwKOBstC0bR5pgO1q5U9Inn+z78KIAAFvS7O0DtrVWm2kfnPKB/tdkafq/zYMxRgtCheqI+9HEnAELxgs3GidlPhAFQ0J31Hp2lAxEjuQDbaSpGcaAOYiDb7UYEqrEidl5SBM10tbhxFVyANjy9fieTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(2906002)(9686003)(6506007)(8936002)(6512007)(4326008)(38100700002)(508600001)(316002)(8676002)(66946007)(66476007)(66556008)(26005)(82960400001)(6916009)(6666004)(5660300002)(85182001)(86362001)(7416002)(6486002)(186003)(83380400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGpZU0RXdWFYcFN4OUllUTFFSEtXdkNpam9NMW04U3dwV2FueVJ5TS9Za1ZS?=
 =?utf-8?B?TE9NNnpjUUxBbVNOY0VjS29HV3RvcDlHdUdkbEczTmV1Ri80aFV0THorMFc2?=
 =?utf-8?B?L2MxUUc1RGlpb1ovYTlyRFdXbktqRnZ1cjFJNlRMNW9nMVM0b3ozQzEwVTgx?=
 =?utf-8?B?bWxyRGxhd3BRek9teUN4MVBsVUdicEQ4YmpHc01CeXdrZ0tTQmpPRlRYRk9I?=
 =?utf-8?B?M2p1d1ZURW1LVTk5anBYVm5JS1hkWlpmWlFnWTJpUFVwaUVIckxUbXZvV0F5?=
 =?utf-8?B?UFFONkpnekpJTnUzcEFZVDUvQko1Qm55cEJxcWVhdHBWL2ZTZElnQzZkd3hV?=
 =?utf-8?B?Si8zd0xEZ25xODlDclIvN1IvQ2xCd3ZLWDRJZk8ybkRGVG53OUp2NEthUXJo?=
 =?utf-8?B?andBNHZ0cWJXR2pESU0wY3hwaWl2czFvaHNDQXNrdlU1ZDZ2eGl2US9seWF5?=
 =?utf-8?B?UDdxazV6OUIvR0J6VGd2bFZnc3dJb3d1Mlp6amorWm5ZOGszMC9FTlY3TVB0?=
 =?utf-8?B?dXpsWmM2dmRUS05mN3hmc01aNExSL0o4VWJaVm1rd3RRSHRhdGpwNllGZk5M?=
 =?utf-8?B?T1hpcGFPTFBIeEdqSU50Y05YTWJIWndHcTNIUGQ5bEpHd0xUdDVIZVZrdGJS?=
 =?utf-8?B?ZFlTcmR6VlpBa1p2bml0WWFQNHpJTzVqblBvSDg5cFZGbExscVZwZnRjeDEx?=
 =?utf-8?B?NnVHSms1WTFpQk1DbnVPMUdoV2REc2xSUSsxQjIzUGNkMDEyWTVVcmxDSWpE?=
 =?utf-8?B?a3IxZDZhMit4OFdvUDdkUFJLUC9ZTXBiVE9MeXZCNU43U0Y0Z1RvWlhyUWh2?=
 =?utf-8?B?VTZRU0wzcUpxeVE1VWZqNnMvZ2tsSnJUQk44azNlcTNISlBIQXl0RmEwbXBJ?=
 =?utf-8?B?VVIveGNHZHRpVUd0WWNwS1hXVC9ZdDJvZGlpZkZoNC9INGl5OERGeTczekg1?=
 =?utf-8?B?R2tQbDR2NGxGQlF3amlnSVJPZWJOd2hCRkVXV1BCb3lJZGJuekdIaXBLdXUx?=
 =?utf-8?B?NTRFeE1PeEVwWWlqeExrZ3JmUzZlRjNIbE9NOC9XYllXNURFdXNYUWF4Nmpp?=
 =?utf-8?B?Skw2ei9HS1pXbjJtdVd1b2o0MFZXazMvaWF3NGl3QnRhUER6UlZXMEljU3Uw?=
 =?utf-8?B?RlJqMzlpVG9mT1E5OEtPZ3pNVXJpTUtjRGlSZEtodm9hK0FRTmNaQjZ1bS9N?=
 =?utf-8?B?RTZSOGZtdFRSVGxmTEVadFBpSWR0aloyRHJObTNndi96SDFSZGc0eVlDdDRX?=
 =?utf-8?B?UFdtV0phOURBSFlZL2RnaEJhdFlsZERrVkZlV25HMVFBSFQ4Rk9ka0lLblYx?=
 =?utf-8?B?WFA3REJMeUJ2a0htVmMxOEZTVmhaZHZUSkVWS2V2UFJ2M0JXNDVPd01QS2JK?=
 =?utf-8?B?K2k1QXhLT3pIMFpuc1NvQmpPREVIRzY3SFUyQWxKSjczNEw5bG9ObUs1MVht?=
 =?utf-8?B?R3BOMzVIdFRRY0VOS1RuR0o2M1ZLTHJTanBoMEkrcjNzeWNBTHJRUHJUQ0dz?=
 =?utf-8?B?Wm1tWGlqTERpYm1TUWRUbDFkeHpGTkova1Y3UVNHcm93MDRxenlmbyt5eWJG?=
 =?utf-8?B?Z3BpSVZnTWhuaFkrR3RJS015bFpTdk1VUnZjREJmcnNrcmkraFpTZUMwUVV0?=
 =?utf-8?B?dUJQN3FUYXQ2YWpHSEdxUHBUZ09RaGliRDBnUnJNMmIwM0F0akFnTmdNNGhL?=
 =?utf-8?B?ZEQyTEdGbVdEOHZLQ3BCeit2TzhnUldsY1BjK0Mxd3NKakxwOCtFam5sdG5G?=
 =?utf-8?B?N0pzTnY5Z0xnZ1ZDM2lld0ZpV1M1cnRLbjBwZ0lIUTJxeVBLQUV0R0hvaUgv?=
 =?utf-8?B?VDBDWVpWcHRZWlEvd1JFK2ZsaVY2LzRFSE5hVGhmRzV0TWdxWGpKVk13czJU?=
 =?utf-8?B?Qk5zNWc4L0FXd1RnUUFVRnhFMjJ0d2pVTU8zazR0RU0xcnVScWNuYmpvei9M?=
 =?utf-8?B?YzE3UjdlYTF4QzA5VzNZcUNyeCtBQmVLQ3d4RmxCSkdRbHdMbXJ1MUd3b25n?=
 =?utf-8?B?VDhKTTZBT0puUVJ4cnZ1S0UzRktYN3RKOWJzNkM0KzV3UC9yNXBFUnIxZjRP?=
 =?utf-8?B?Q0FQaEorU1M3blNnMUhpRDBzYTdzR1hQRS9EZHgwQlp1TkJtSHQ0S3hWakhF?=
 =?utf-8?B?aEs1TmgrU3V5SzVxWm5LMnZkRDFjc2tQZWNncG9TUXQ5VzMrRVkyR0tDRE5B?=
 =?utf-8?Q?tOd6nGdIVrltr/AyVMbJXCs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ba4a4f-3f9b-4f74-2b84-08d9d68990a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 11:40:57.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJ8VjH7gLhN+Hj0Qp7tt+M//AdflZk1KdHCu5xldvbYSkKcwtjvfW099jJWjx3jBzppSSxiyJbxVETsvAuJtew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5973
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:42PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    /* It only makes sense to assign for hwdom or guest domain. */
> +    if ( is_system_domain(d) || !has_vpci(d) )
> +        return 0;
> +
> +    spin_lock(&pdev->vpci_lock);
> +    rc = run_vpci_init(pdev);

Following my comment below, this will likely need to call
vpci_add_handlers in order to allocate the pdev->vpci field.

It's not OK to carry the contents of pdev->vpci across domain
assignations, as the device should be reset, and thus the content of
pdev->vpci would be stale.

> +    spin_unlock(&pdev->vpci_lock);
> +    if ( rc )
> +        vpci_deassign_device(d, pdev);
> +
> +    return rc;
> +}
> +
> +/* Notify vPCI that device is de-assigned from guest. */
> +int vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
> +{
> +    /* It only makes sense to de-assign from hwdom or guest domain. */
> +    if ( is_system_domain(d) || !has_vpci(d) )
> +        return 0;
> +
> +    spin_lock(&pdev->vpci_lock);
> +    vpci_remove_device_handlers_locked(pdev);

You need to free the pdev->vpci structure on deassign. I would expect
the device to be reset on deassign, so keeping the pdev->vpci contents
would be wrong.

Thanks, Roger.

