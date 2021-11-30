Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3747463434
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 13:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235093.407915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms2Cm-0007RN-MD; Tue, 30 Nov 2021 12:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235093.407915; Tue, 30 Nov 2021 12:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms2Cm-0007Oh-Iw; Tue, 30 Nov 2021 12:25:52 +0000
Received: by outflank-mailman (input) for mailman id 235093;
 Tue, 30 Nov 2021 12:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xd2=QR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ms2Cl-0007Ob-An
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 12:25:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5bb0e4d-51d8-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 13:25:49 +0100 (CET)
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
X-Inumbo-ID: a5bb0e4d-51d8-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638275149;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SaDDE5MbMqlOymwZWcv3iwYIvBUaKDqhfLgemxUrhdU=;
  b=HlK8luW5KSXqI5hnU9O4gJmNSddoXWzfvGLX4cYP121s+MYI/zPx1Vc1
   E44FKuBErGNvlYU2md11y82pZ4qLyoFxTarGVYaVd3G/Rd9Rtp6oEI+lf
   IbB5RdqsRoYE6g4oqq7sovyN7B11ZnJ6Y0bMfTtPpXkWVcOtw+puiwB+e
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gU+7FGlrsQFxJg9WihioeOWLJ5Nw6VUU+fEr7Zr5H1mbeT5AcjZlChM+wBuq4o6NWmLMDZtSbg
 +nRXEUxaau0+cb5ANE1HQAbh2RQCuSpPlUgXT4ST9SzJ3lP8HmtXQS1FN8L/9e+opwMKaIG0Wk
 Ek5fumSlSWB8wVBqI44sLFIxSzcx5OBVgElKka3DgheyQd0tlRCvfS/+lkEeMGlYrFhQPmDSDe
 PfsftRrpKbgGyoheqXay1Yo6ZOnjwk6d25vdLOi6ycec/er6mYda9pVjE8pt9zv7ks40wf1dro
 DQBBsFrHoibk9zoW75V2hg7g
X-SBRS: 5.1
X-MesageID: 60923245
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GkoHV6wqtnUhquAEcml6t+dXwCrEfRIJ4+MujC+fZmUNrF6WrkVWm
 DEeDD2GaK7fYGfwe98nboXg8E8FsZPRx9JqSgNpriAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrVh2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9V9+
 tAT6seocBxzZPLrhqNMfUdpKxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEAjW1r3JwTdRrYT
 5AUWAE3fFPRWDF0BGc+EbkfwsyM32aqJlW0r3rK/PFqsgA/1jdZzr/pN9bEf82Qcs9clE2Yu
 2Hu8nzwB1cRM9n34SGe7numi+vLnCX6cIEfDru18rhtmlL77lYaCAASE2C6p/a5okekXpRUL
 El80iAjt7Qo/UqnCNz0RQSloWWstwQZHdFXFoUS6hyJy6fSyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZtVuDq+zyMH0EDfYw
 jaWoSx4jLIW5eYT3ri/1UDKhXSrvJehc+IuzlyJBCT/tFo/PdP7IdzzgbTG0RpeBIOVfFzf4
 yMcotPEtr8pE9bcunK8eNxYSdlF+M25GDHbhFduGbwo+DKs52OvcOhs3d1uGKt6Gp1aIGG0O
 Sc/rSsUvcYOZyXyMcebdqroU5xypZUMA+gJQRw9gjBmRpFqPDGK8yh1DaJ79zC8yRN8+U3T1
 HryTCpNMZr4Ifg3pNZVb71EuVPO+szY7TiILXwc5076uYdynFbPFd843KKmN4jVFp+srgTP6
 Mp4PMCX0RhZW+CWSnCJqt5JdAlRdiZhWcqeRylrmgireVEO9IYJUaK5/F/cU9Y9w/Q9ehngo
 BlRpXO0OHKg3CaaeG1mm1hoaa/1XIYXkJ7IFXdEALpc4FB6OdzHxP5GL/MfJOB7nMQ+na8cZ
 6RUIK2oX6UQIgkrDhxANPERWqQ5L0/17e9PVgL4CAUCk2lIG1aUp4S6J1S3r0HjzEOf7KMDn
 lFp7SuCKbIrTAV+FsfGLvWpylK6p38Gn+xuGUDPJ7FulI/EoeCG8gT90a06Jd8iMxLGymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB745eiuG0MBDu7dj3LhcvQfqC
 EuD9sMDYeeCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fZkDehjZcIb15NJIe7
 d0g4MNGuRaijhcKM8qdinwG/Wq7MXFdAb4ssYsXAdG3h1NzmE1Ce5HVFgT//IqLN4dXKkAvL
 zKZ2PjCirBbyhaQenY/DyGQj+9UhJBIsxFW1l4SYV+On4Od1PMw2RRQ9xUxTxhUkUobg74iZ
 DAzOh0nP7iK8hdpmNNHDjKlFAx2DRGE/lD8lgkSn2rDQkj0DmHAIQXR4wpWEJz1J46EQgVmw
 Q==
IronPort-HdrOrdr: A9a23:PmXSU61ggJ3bdIZRhYAAcwqjBSFyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdL3AYV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1E9Qq4Lbw5eXbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Hh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1ImjzsV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MTTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4K0upk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizylSKeSXLzEO9yq9Mww/UpT/6UkQoJk59TpY+CUnpAZDyHpnIKM0od
 gtMcxT5flzp4EtHPtA7dw6ML6K41r2MFvx2VKpUCba/Z48SgbwQr7Mkf8IDbKRCdE1JKVbou
 W2bLofjx9rR37T
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="60923245"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwB4K3/NbOaGJeswaaKQ4s98sTJdVgWwGmMsjU95nqGq5mwJqjwkJKryxVHdSnAgwBRdxbTdlDVi9+xE/JESqA2nSnRlQCjYmauweVmvdKTQNDVqUDxvV8GvvF3PRWnDB/slVZe0Qiv7X5XzI+svr/vwcVzlwz5AVWJRxzyal1gnNdoSmh6yRZrRhlHilnvIzV94p/shnIuXSex2WgYs2b3j7G6Tfl5YVDIUVu7auM5bM02tMEx1iWYJQnRTK8WSjbiwfwasOp3KrRuoFahZiT4s29/aPivxAyFwpHl+SwxbYYsXhfCEIqI1TTkHwEmhALihFMuqpXrkyCCBowulxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eTHE0aKPnGmJ6SUpksA5QfQfjCETbAUmOjSzwbOQfk=;
 b=JGHlb4zprVfwU+xlQY6QZN3mqSTS89NZt4odWNyWq2ZTFVG543KK/Af3zMrM+V/6dp6311o/rA5qP8hu+y2oCGEW/NSTm70g2QOq6wOrq7E0sLo9TPfAyky7y3lPamc54/5KXeic2us3J0Xwh1mUsQDDblNqvzEzeQapOfepG0Q4Fv0EYPpnr/O/AhTTd6IAkxShMrnAVKrjj+3u5x8u6L2SZR+qqiAS+I7yBKD28BYRvQNBsAh78b/Hf4I1SVEqUfmd+DRfA2Ff2RMgqi60hiU6u56RAZzNsV+mpcjsg0i1UT4HfK47QZEP3cnLYXxN2x0M89iugR2Oo8NJk92x0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eTHE0aKPnGmJ6SUpksA5QfQfjCETbAUmOjSzwbOQfk=;
 b=Sj8KKaZmGcLs8hGMxqzN9gZm+/H4dzImyAWWNDq9JzYu1Bk0+EF8QTx1623um4dReg+Ru7woh0eS+Vwx5t8xsa4DAEZv+KTv8n8u9Rcm679oio1eAUTUcy37rSNP2jbdqIA1zYA0lPqSB7EUKVd4EM7eWXm2c5AHMrGSeztScBI=
Date: Tue, 30 Nov 2021 13:25:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 03/18] IOMMU: have vendor code announce supported page
 sizes
Message-ID: <YaYYK36zzJB2kiun@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <3f0adf5b-cc2a-1b72-8376-baad574fa824@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f0adf5b-cc2a-1b72-8376-baad574fa824@suse.com>
X-ClientProxiedBy: MR1P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b96c787-2969-44c3-259b-08d9b3fc79c8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB4476F31687ED44A0541FF2838F679@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xf25vved9+eocnOiGkI3sscS1SFnbBGxkNbzM+tj2ch6eLRCI4g9Itg1+bgWTyi5xd+mCRoJP3HzAyegOMWpqky2hGfttOsDBBcCoMTrZE4EP3taj1q/8RN//qq/V2iPUZLRug/mVz45wUrMrCYXenQv9aAOmFPJEUuuGr/jUwRtyEVyfq4SzraQzwHHeiqVqycD4tur/K9dxNAPw48InbT9oFs22+usIMFUmaBs9q8HUwhAd8FlVkoY6qO9uFS7Dp1bNNRqutOSeTQSX3AtxeJP65QKl2CoHXe0G2JbwQ/6LfQq47YTNB02lRMv0JbWMJxmHMnsKmdkCdt8mVTJNR8dL19zRE8cbJHrMI1rUtb/UuOdT8XCq6lVJkbPHq4+ykT1Y4OmMpghat300zdhjXPzwSby1mzn8s627coTGvHf3PUAJFSFC7G+fcGHxBvTsIT6qQmNoacxiQm2344VguTdKPnEqwDrwYGKvItjdjp5kAeFntfTiAAoeyKF8YqjnyawQgknFXSIgpK3+m5KcRczR3pcdxb+VPLKsILJk3RdrGWmIB3hlZDLdnLtuCB+a0CM8RtvnI6pniM+YT25z8uv2Uhu+3AneUOx3SiHkRlOiMXE3coXx+DqbBl8daHCNJ2WJkqy0wAuenc4lFwjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(2906002)(33716001)(316002)(83380400001)(66946007)(66476007)(85182001)(6666004)(8936002)(38100700002)(6496006)(54906003)(956004)(26005)(4744005)(6916009)(66556008)(9686003)(5660300002)(6486002)(186003)(86362001)(82960400001)(508600001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG5JUGlzQSt4YkdvcnZXQS8wb01pWjFkSGJMQXVZbWVJWEl0RGk2WmpZYkMr?=
 =?utf-8?B?QjY3cGRHQVBPTDczWjk4OXpIdEdBZmlZQkMxYzRkTnI3V1ZjcFhmT1E2bkZj?=
 =?utf-8?B?RjhPdktNMWRrTEpLT0ZZbWNuUzdxWlJ4ZkRaalFqN0c4Mkxld0o1K25zS3ZT?=
 =?utf-8?B?MnpIZUd3Tjd2bFJTcmhFYk9Xay9GYVA4eC82Qy80N2J0NnpMa0dtOWxQSlBY?=
 =?utf-8?B?cjFZazlwMW56WTZXSmNjaWQ0YU1CV1FUNGhwOEppUmMvRmRuVTF4TC8zWlMw?=
 =?utf-8?B?Z2thcU91MTR0RXM1OW1VMTVXQ0tLYjd3MzdvWTlmN1VSNEkydmVyOXhFMzRv?=
 =?utf-8?B?NUYzK09QUGtldFljdTVud01hZW9qaVdiZlBJZ1o2MWNSSDJDajJXU0pVMnNL?=
 =?utf-8?B?VVdZWjdhVG5zYTcxVy82MVV0QkdzN0RYVitqSDRyMzNZSW53eGZrMWVvSU9x?=
 =?utf-8?B?K1JOOVJEZVd4MnV5VHVJR0NwUU9TOGxoWkV4cFdUOC9mUyt1ZGNqR1dGdFBv?=
 =?utf-8?B?NmpyTE11d3dYQ05xU0dQdllXZmVxdjNqZSs5Y3laQTY3QzVhMEw3LzdtZ25S?=
 =?utf-8?B?YUlTK1d6TlBUbzJiYnJ0ZFY3d2RZTkkwd2dIaUQwTHk1ZXRZbjRYZTRaQmMz?=
 =?utf-8?B?NVhuUnU5MVRqSUlid0RYTVF1KzFqV0xMOHFDVEhDMHBGdXcxQVlqcmVhZ1Z1?=
 =?utf-8?B?YjMrSTVTMXRObXpySU80cWU2V2huY3VSUTAyQ2x4d3cybUZCQ2YwWCt0T3l2?=
 =?utf-8?B?ZVFGYnk4QW5TMS9MMU5leURxaGw1cDk4ZFZZd0tlT2IweFlBd3RxRmRGNjd5?=
 =?utf-8?B?VHlHMGRCRm13Z0x6bWNNUGxUdXR4RjhMbkRvbjljTnVBVUNMZmdNdUE1aEh5?=
 =?utf-8?B?Ni91VjREM25MTVlMeUZ4QnhDdUMwaVdwbDB2Y0QwZzFVZ1ZjckZOM0Zaa1du?=
 =?utf-8?B?ZFI0MXM0RklxZ212RlFpWkFKS1FoVTErdWt1cmgwY2ROOTZ1WWtkN2ZWUmNs?=
 =?utf-8?B?cStzRFB2SDJINjhlcC91R3ZkNC85YUswbWRqbkNRaGdHcW9jTUwzbzF3c1FJ?=
 =?utf-8?B?cFowTFoySGhVZUhNc0Mrc2NwQWNmOWVZSVpmOU54VVIrdnBJbUVuS1ozUGFT?=
 =?utf-8?B?YmpVL1pGTTNvcHNFRlBVQko3SXpwVHMvNGt4NUF3RXB6M3lQQVpCYlZwQVNu?=
 =?utf-8?B?RFNtTFkxWTNSSWt1TU8zWkRnSVlUK1hkZU9SMVhRQ0NUQlhqdkFaRFpiUzhK?=
 =?utf-8?B?VzRTZlZVYS9JYS94T2hERktDMldZaWNZeDN5TWRKQlduenJXUkdkdDZYTVN1?=
 =?utf-8?B?VVdxRnB2eXMvT0xpN2JGTTZZOTF5Y2pLaGphRVJDV3VOUDFHb1RyM2MzdGtE?=
 =?utf-8?B?bzZKZldjeHRpQ3p5Q1lqS1FaSWxkcDlYS2hKUmxhSHpQaW1IWFhHc2FOeUVC?=
 =?utf-8?B?VGJ4V3lLakkvOWlHaUdCc1RhNTZUMlBmQUYwNUZORnNDYndiYkViVm9YZ3cy?=
 =?utf-8?B?SjBKWWFPK1A3bVBGcmVocDFkNyt4QUwyU3Vhazd1Uzk2ZENKZzIrTDRYNDBr?=
 =?utf-8?B?eExzWXhqcmhjSzdyekVNczVnbCtCeFh5Ym8zMnAvTkFNOG1sbU5ER0MwMjAy?=
 =?utf-8?B?eXBKUWZEZjVrSHMwVVZoSVFVYUxHQzdid21WLzdlMFBCZGtjN01NeGhHUnR6?=
 =?utf-8?B?U2JYUHNZTmg5eElJZ2IrM09JL0l4RnlyUWpLYnJlcFA0S2JnSGxtUnh2N2hs?=
 =?utf-8?B?R1JHS1IyVXZDNVlzeEZqUElxd2lBMGkxS1pFR2p3Z25aY2hTbWdBcWRXRjFH?=
 =?utf-8?B?NGFlZ0VTaFczalNSZFh2UzZLRVRYTDU5NDh0UDlPVFh1NklNYThIeEJ4ZFpB?=
 =?utf-8?B?RmFUdTAyZm8zWWxzSjR1eGpodWxJR1o5aHNmeTI4ZFZiVHY1Qjd5MFRRYk5I?=
 =?utf-8?B?c1Z3QlRPUEhMQUpMTWJVMVJ3bUJ3NWQrTm9VYktNNVUvSUU4SFYwVTB2TXVC?=
 =?utf-8?B?TTgvZFNseHNQckVieEtsbDJ1c0syU0hqa2RMZUJhZG16K1JRTzZRc3g0Qnd3?=
 =?utf-8?B?bFgyTGZkcnFnWmdYcXhRelorNkpCWUtGVWlmZkp6aFZhUHVpbWxvQlZ4WXp0?=
 =?utf-8?B?b1ExTENrbUtZUFdWd3JVYzRDWDd6cGlyS2ZCSHc2aGc3N3NKZkpoSlBkOEgv?=
 =?utf-8?Q?PxJSI3K02SPeoce0UTZ/qf8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b96c787-2969-44c3-259b-08d9b3fc79c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 12:25:20.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr9SoYReukszXvXsdYTpHGpWc3iwwzoIOzWLxql/VCRpRS6G1w9IvNqehtW4ZYgjVTJvjcdI0bISupj3Eaurmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:43:57AM +0200, Jan Beulich wrote:
> Generic code will use this information to determine what order values
> can legitimately be passed to the ->{,un}map_page() hooks. For now all
> ops structures simply get to announce 4k mappings (as base page size),
> and there is (and always has been) an assumption that this matches the
> CPU's MMU base page size (eventually we will want to permit IOMMUs with
> a base page size smaller than the CPU MMU's).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

