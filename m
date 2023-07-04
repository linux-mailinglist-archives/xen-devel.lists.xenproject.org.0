Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30A747784
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 19:10:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558573.872798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjXm-0004BT-Kv; Tue, 04 Jul 2023 17:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558573.872798; Tue, 04 Jul 2023 17:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjXm-00048P-Fj; Tue, 04 Jul 2023 17:10:26 +0000
Received: by outflank-mailman (input) for mailman id 558573;
 Tue, 04 Jul 2023 17:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvOH=CW=citrix.com=prvs=5429f199a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qGjXk-00048J-NR
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 17:10:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a83d2bd9-1a8d-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 19:10:22 +0200 (CEST)
Received: from mail-bn8nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 13:10:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6393.namprd03.prod.outlook.com (2603:10b6:303:120::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Tue, 4 Jul
 2023 17:10:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 17:10:15 +0000
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
X-Inumbo-ID: a83d2bd9-1a8d-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688490623;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VuyYMdc3d5GX8D5b2DQCfaSJ+K7fEs29bUWq+BkmG9s=;
  b=ZEqyDlhM/jRqqnVHxeA+daODH/Bmgy9sYR3PyCJ0886KjMpOgAKZXpbr
   tCJdLOiMx0oOGcOfioZq9W3ZpdJ3z4+U1txtDGpNMEUN/UqxnhJOMx2Wd
   FdZmvE/3ieNKgyvFkEkPKUYwCuovVVePi2FLwoSKNXSGX+6Xi2ovVMQ28
   8=;
X-IronPort-RemoteIP: 104.47.74.47
X-IronPort-MID: 114443518
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TFhjT6PCRY55hdbvrR1ql8FynXyQoLVcMsEvi/4bfWQNrUp31TFUy
 GJNC2zXP6uCMTOgc95waYvg8UID7JPVxt9nGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5gBmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sNZL3sQ0
 vEYEj1OMSnSv9icmuqpT/Y506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvze7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWwX+nA99LRNVU8NZBvVO25jAJJicddlyrjsL+kFLvZvVQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqf67OVoDWaKSUTa2gYakcscwwB5NXypZApuTjGRN1jDa2dg8X8HHf7x
 DXihCIznakJhMgHkaCy50nagimEr4LMCAUy423/VGWv5BJ0f46haomh73DU6P9BKMCSSVzpl
 HEAmtOC5eEUS5+XnSqGQf4lA72iof2CNVX0illpGZ4j+z2z+mWLcoVZ4TU4L0BsWu4DfTLqe
 07S/wBM/phYPHitRaByaoO1Tc8tyMDIDt3jX+vIZ8FPZbBrfReb+ztjY0GR2W3gikkqnuc0P
 pLzWdq0AH8AEqNh5CC/X/say7ItySE4yG7JRJb0iR+g1NK2fnmfRK0ZNx2EZ+8/5bmNiA/I/
 M1SMcTMwBJaOMXuby+S/YMNIFQiKXkgGYuwu8FRbvSEIAdtBCcmEfC5/F86U4lsnqAQnOGY+
 Hi4AhNc0ACn2SKBLhiWYHd+br+pRYx4sX8wIS0rOxCvxmQnZoGsqqwYcvPbYIUayQCq9tYsJ
 9FtRilKKq0npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:qrav7aP+tXRmVMBcTv6jsMiBIKoaSvp037Dk7TEJdfU1SL3hqy
 nKpp4mPHDP+VMssR0b6LK90ey7MBDhHP1OgLX5X43SODUO0VHAROpfBMnZowEIcBeOkdK1u5
 0QFZSWy+edMbG5t6vHCcWDfOrICePozJyV
X-Talos-CUID: 9a23:VsWS5W2KShjTUl5W5UrZX7xfP+4LaCP6wXfqLgznMDdRcpfPEU2V5/Yx
X-Talos-MUID: 9a23:LmqleQmraOCZ2yuNANgndnpJCclNw/i0JnoGspIWlPLDLzAhBhCS2WE=
X-IronPort-AV: E=Sophos;i="6.01,181,1684814400"; 
   d="scan'208";a="114443518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n39cnCBrCDSGX9wet+s/jz0VuPslPIwvkN16Dz1PbFffNZCYiN4W6r1jiuFPoHN10tKTtWg/U67iFXi4od328aSCfPL26RoSm/UVANtrhAT8VcqbLAychuhSV/jsoY4uFmp/93QeG48wCadm/q5wdiRkIT132VM4VL1vSx0mRZgsiC2tuPlIeYK8IPdm8BlnzsGGFMtUjSHcbqA94VsL3r32RnaYZMkorsEhm9fAu0eiY3Sy+roLVyTdz1AO4M5+XJxzKAq1AteQ/HYPxXvFQKCxGxjhQpatlYer0wpfHp3GenlYM5LmVRefk+sV1MDcQJEtlFWM7iisP3g4Cm2rHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaOq7/wv29wZjSZRbL/M3qEI7N0Fz0HPjs+f+AcSvhQ=;
 b=jYeTxvuGJIQpn5IvbEXCpkj5qfunDy3JLSvieD4p2o4viTzlY+60BWvJwp4UC/5dlQWq9fsrWC1GkhM7CE2Wk0YEnXLkGpDrLpaR/ysfeqrRNTYEoHCA778IUW2Iumc2uRqPh/mueh00976y4K3XfSdTL/MTrPDNd1cMHkmfwwORBI2Nt+RAWE/pWyvINwuyMCa93VfePFAJ9rJsxIROXGGflobD7pA3YkpfR9z1XFjI2cU7ospPQJteg5LpAsqyxfqnXK56G1Z9giaBixOC5lr/rtH+noSe9LGiWzlV/O/BEsDzoQfEyd8B/Q981uoTDutRhdMJ3PGj1iS6vPe4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaOq7/wv29wZjSZRbL/M3qEI7N0Fz0HPjs+f+AcSvhQ=;
 b=l9+Lw2LiBSOxJuKG4N2YpbOD7bdRv//CsyKkbZ2E+jkZM8n8P47FYFxfXPlp7ybnjNFQdlL5QQizAX6u4EC1sKrQX/F0xG84HlGEXD1Kz7uS7+ydUBJG/rMLfJr5MiMLCIpH71ym6R/0x5I7rphGarTnoCx3nhijRfUsv7OgI/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <15e7fee6-a64e-e6c4-af5f-dbf2e9f22cd5@citrix.com>
Date: Tue, 4 Jul 2023 18:10:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2.5 3/3] xen/types: Rework stdint vs __{u,s}$N types
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230627075618.1180248-4-andrew.cooper3@citrix.com>
 <20230628145403.3630-1-andrew.cooper3@citrix.com>
 <ba212e0a-1bbb-9576-f6ff-c6d46d80b17a@suse.com>
In-Reply-To: <ba212e0a-1bbb-9576-f6ff-c6d46d80b17a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 9369991f-8a79-4ebe-9531-08db7cb188fe
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mQqHlR+EW+GB2u3wjUaaaPN6/eudAiZRIVPTbRSdRGxnrZYZVZrlv/iKB4dvVDy9Wh04rXxCg8BlWJ/+k3+jymSiQWhOrqiubh37ocvLvBHVyoR7FUvOQrIcSyBIRBwKgjyv/gUTAD8nfQGFe06yVFo+o39wUNBaL36LK910EJFsMU/Q6kthpMWVED6fwEf4UUPb44FU+RpCym49jhD4vU50mNi52+79w2RLHJM9nuuTK60NVCT/mq64uatnBkCXKX4cEkeaVXJaZKtsBMjd+CeYBAyZqT+AsqBnpraqGOcpO4ZXY5gC4WcS0ekCktWfeuuwrpa0lplWJnqR033rQsIJiB5U6KJk2jqoO/6PxT50L7ABfqKDiWcj/Jpge9Lwxm5an5uVs3MXck6WzKDurDWryHrjHaSnAVxmLmrnRTSx59CDNLpjne0sbEIPBboeuEM6qqSvIV3gpYd0/F4IjS3I1aG9XOHSpOEU5e5yrVue/KMkHJL62kwk0qe3qX9htzReiu5V2b4nYQ1JvCNHLQB8Nf4aU/b0vVeGNB5MeqQuJ09I9D0hSLKfoXGl78tu2nmZGML7o4XHVHcTwcwPjvT+/LLfVGsBSgvkP1U4CjJiHNAkT3v5PuR5b2VXvsnCUqh/vwORmPiTU1gu7bdALw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199021)(6666004)(26005)(6512007)(2906002)(6486002)(86362001)(6506007)(2616005)(38100700002)(82960400001)(83380400001)(53546011)(966005)(31696002)(41300700001)(54906003)(186003)(316002)(36756003)(66946007)(66556008)(66476007)(4326008)(6916009)(31686004)(5660300002)(7416002)(478600001)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmhVMjN2TlRJODAvWjYrVnZXd1Z3eXFjZ1ZUWmJVdDB6L2QvMURhYWllMWlC?=
 =?utf-8?B?WGhSOGp4SVNQY2hyRjBVSjZScWg3Y01tckszTjVvLzE1VFdJSW50bzA4SGx0?=
 =?utf-8?B?aDVVNDYwdi9QRlpOeUlWYjZHaE1UeDZFRW95QW5nc050K0RGUUFqNThjSW9H?=
 =?utf-8?B?TktyYWJPa3R5WlpCNnlLU2JMb1lVWG5jYzZMeGVBaENMSmE1cER2bHM4ZWt0?=
 =?utf-8?B?WkZJVEV1eTBTWDdsbzBzZ0FxcExPZnJwZWtKdVNGc3FnL0FIbU91M2w4dWVF?=
 =?utf-8?B?ZUFmZkJJVk5XdU40YXRDQ0VwemF4YWk2SjJydVNMZlBrN0RjRGdwWFBGZzhp?=
 =?utf-8?B?cTQrR0VWaWZJUm00QmdTdlRwMHdjRjBuRmFFdXMraDkzd3E5c3R2RmtiYzhj?=
 =?utf-8?B?bW5TNXNRb3pkaGJGU2xyVTlZZnhGcVBXNFhJTGRqTmFrSnp2VFA4VHJEYVNT?=
 =?utf-8?B?V2tMSjFlZEIvanVQTThpdXVCYlIzYWZxenAzVVRmZFlBZGdWN2RwQjQrRGht?=
 =?utf-8?B?YzgxU2JPUzhrYWFPUU5WVTlXNWNrZ2pjMG5xdXNsY25CN0ZGQWVXd0dleWhM?=
 =?utf-8?B?VTNHWjRQb3JtZnUzOGp2bXBaUGpDZmlBTkF6OW01Y2htQloyWUtCZUZvR3li?=
 =?utf-8?B?SVFLcWxmTUN3bVVYb3BJak9PU2liakZENVV0ZWpjK29DZ3E4bmExYzIxNHVw?=
 =?utf-8?B?bWY0WFYwbFlGZzdqN0FDWnZxS2dsbldpaWxRSzZLU3B4TjdSY1gyVUV2TjJE?=
 =?utf-8?B?RHZpOTdBVmZZOE9QQ1I1dGZQenhVcVNPTmhWMXV3aUlyVm8wTWhhTGRzR0U4?=
 =?utf-8?B?NVo2aXpjWk9CZ0JpZWZSV3VtTlNQRmwxS3ozR2NGQTZZRmlyM0hxQVB2Z0cz?=
 =?utf-8?B?M0lkWVZRYmtlQ2w0bjd5Y0NGRit6RjJFL0hpWkFuSk5HaHovVUhkazlZUmdB?=
 =?utf-8?B?QmhRbDVDZ1NkbWZHeGd4WkxkcHJsR3hIM3RGdWhJNDYxK1E2L0pQTjZjVDBu?=
 =?utf-8?B?Ymt4TW9vZ2VMWjJXT01QdFpWcFRuWGlZTWJIR01vZjF6U1FxTktXM0lTMWxw?=
 =?utf-8?B?YnIyNm1NZS8vSEtnb250RWNqWWlHL1ZXZy9BTmYvZmhwTE5aTDBVdjhKK0g3?=
 =?utf-8?B?OWhnQ3J0WElEeHV2b3NCUTlxdlpFOXBGZEZLaVU2bFdOOFBac0tlSU1HTlEz?=
 =?utf-8?B?RnN2ZVQ2QWtVU1hGMHRIR2VTVE9BZ3B3aXo3QVRYNjhyQnV1QzdzUU1NV1Zt?=
 =?utf-8?B?MlJVQjZNTWwxQjc5NFJNYlVYOGY2QkkrenhrOVdKa2FxWU5HM0FLNHFDd2li?=
 =?utf-8?B?ZHQyNDkxVlFUUmEzek9hMmJ0aDZHdjNiTWVVaEtROHNjSU4zQ0VydnJKbkhJ?=
 =?utf-8?B?SFhiRENmb1VLWHJ4Uy9SYXlTbzRpTURGa2pra0EzVTM4OUw2VFN0cjF5dDJx?=
 =?utf-8?B?b2ZZN1lpSVRSd2YrSks2Y1NYM1RaNi90bTZGMTlKMVFyTXljaTNBbHAxUldy?=
 =?utf-8?B?S3ptbVY2UDhzMVZsV2Y4R0RrRGp5R0JUNldyUW8wbjY0ZlhiQ2RsakpCK0dy?=
 =?utf-8?B?YWcrVk9vZmY2YkJoeHhHeU14RWM1YTBtNzVCTmNwWEsyZ20wVWxmQXlhQUt4?=
 =?utf-8?B?WGVtQU9oZmxSM0MvRW5aR3NjamZ4dmpIRDhac1VKYnIzRndMMHlFQU1ZSWIv?=
 =?utf-8?B?WVRlRHpERHhPRWxVaUllYzdNMmdNUmlwb1R1L3AvRkxEeEhaUVYxb01NM1Ry?=
 =?utf-8?B?bmtUN0xyVXBrQ011Sk55UkpneFFLUStNUkQ1blZsWDRRK0ZlU0dvZWpkVmxx?=
 =?utf-8?B?Z3RxUG11d1RHSzJhai9xM0NBRDNjODZFbEVSQ1BPY3NlM0loVkpqWUtnV0dC?=
 =?utf-8?B?anZWMG9USVk0ekxESE1nd0RTMEh2Y0s0dXkyWDc1T3IrYjloRXU2RHRLWlBo?=
 =?utf-8?B?azR3Ny80aGswQ01PalhPQ1VxOGx2ZzZZV0hFRzN0MVpQMXJWdDdyR3Q4SzNp?=
 =?utf-8?B?ZWJIb1hScUg5OVJyZ3J6RE93dnVMN3VNMFQ4NWlVNTVUYUNTU2lkeHpxWmJ6?=
 =?utf-8?B?WEs4SkZNeWlEUU1VRzBMZUpHYmU0RGRFMXdIRG9jdTRZSGx6dC9zUnZoRExj?=
 =?utf-8?B?NmhINzZNK1pDa3gvNW1UN2VxQ1g1b3RUZ2dtVm94QWY1Tld0MnJJZW03d1Bv?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Z1FDSFo3TXhwdkdkRUIyQmt1emtIdDA1N0dyRVV1WmtEb1F6WHErUnpMWVFt?=
 =?utf-8?B?ZVh4WkpIQmp5cFlyaDdvT1dEVWtQNGlUMUU0QVFWQnJJMm9EcDRIUTFWbnBG?=
 =?utf-8?B?QXZ4OUR3NVVTM3JKSGpqZll2dVE1VHc2REVuclppTVZLT2l0Y2x4VXNVTTA0?=
 =?utf-8?B?QnhBTFYzcGhFWUlVNW9nSVljSVh0Tlk0Mi9IdkxhR2ZvdzNkRnRvbkJKcjcr?=
 =?utf-8?B?VWhIWXA2d0xFdmZHRXd3bU9hWEVQUGg4RjVHbmFhYk9KRzlwWGtLQlc3VTNS?=
 =?utf-8?B?YTN5UU43ZWZJZ2NxVE5lUDZ0RXVhSW43ZU9wNi85TTZzZ1lWb1JXWFRqNkVK?=
 =?utf-8?B?eHhQc0ZJR1piKzEwejRoVGpMd2U3aTRiMm92ajROQjREeUt2TXFTYUErVisr?=
 =?utf-8?B?dFUzMk4wc2tuRHlVTng1ekttelNiT2kwKzdaUnlhaks4TUFrU28xdkR4a2xV?=
 =?utf-8?B?ak9yRFlSdXk2cWFjaEQrRlZvalU3SVpHVkNzUjVWQWY2OUVPUmtVeHBLRCtN?=
 =?utf-8?B?WGdVT0lHclNuT3UxZ0tDK3ZoaWRQLzZJUmNieVI3OTRqYUpqd25HMmtSOTFC?=
 =?utf-8?B?SFlEejdkYS92dnJSb0luZ1IvaEE0OGN1dHlNeXlUMDg0dUxxbkFxSnlNL1kw?=
 =?utf-8?B?ZGtTekNSY3lBV2dTRW1VK3V5dUgySlVUNGVIM2M1RXVJQVZMYzMvajhCTVhz?=
 =?utf-8?B?amZBWVRjdkpLcmZUbWNQeDY2U2syZTczdFRTb3RtTWR2QzlkZTcwZzg3UjVm?=
 =?utf-8?B?R1J5dHdkSFdjS20rOGJTcEpCT2Rrcm0vZ05iNkpTaUdRQVZhY3JWY0VNUUpv?=
 =?utf-8?B?ekFJNG5RN1BVR1Fjc2FxWk95bEZhVFRaOGVIQlp6UWFIMEMraldzZGttckVD?=
 =?utf-8?B?ZXU0M05ZdjVsWHBrbFlielF4aGpYcmhkVGI3QXdxTmhGbW45bmdsRmh3cW5j?=
 =?utf-8?B?MDZ2MWJCWFFWWCtXRzF3Ykl5ekhEWHNsWUU5dGd2emlZc1RJajdGOVhZdlJu?=
 =?utf-8?B?R21xanBLZW5zWWExMEIzYlQzQlpuWTZYYnkwaFNlblIrMWJiRnpHcDdSRmpj?=
 =?utf-8?B?UFVRdHlrMlFwOTg2MTB2YkZXeUN4Y0gzRWFMa3pkZFVzZXpjdDdPQVBYM2da?=
 =?utf-8?B?QzVQdnJWK1BPZGViOUgweXl5eUh4eDBPc25lS0JvUEhXUHowSVF2N3pVdG5H?=
 =?utf-8?B?SlRzQWNPL2pXcGs0b3V6VEt0aVpoZDk1VzBBczJNZUh5MHBsYkM3UVlmd2c2?=
 =?utf-8?B?ZXByQUdiWWVhTlFUd3lYYW5McDJ4cG40eE1GRC9yWVFjUVNYNWtFdGVnbitZ?=
 =?utf-8?B?VVdOYVNNOG50WVNpRWNpTXlDdXBjTWNUamxMdyt5NmxvNnd1a21zcEZUOVpr?=
 =?utf-8?B?V0RjczBWblpuQ0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9369991f-8a79-4ebe-9531-08db7cb188fe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 17:10:15.5007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWgZNCcnH0JHrUqhQb+rmHK+5GOrGaxlleZUqzjLXXkeR4Zt5g0cJIDsGPi+7jiH2EVI7cpu1B5Alp4Vwr1UiyXltfjP7MIg7VYLh8+3Imo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6393

On 04/07/2023 3:38 pm, Jan Beulich wrote:
> On 28.06.2023 16:54, Andrew Cooper wrote:
>> Xen uses the stdint types.  Rearrange the types headers to define the
>> compatibility __{u,s}$N types in terms of the stdint types, not the other way
>> around.
>>
>> All supported compilers on architectures other than x86 support the stdint
>> __*_TYPE__ macros.  Move these into a new xen/stdint.h to avoid them being
>> duplicated in each architecture.  For the very old x86 compilers, synthesize
>> suitable types using GCC internals.
>>
>> This cleanup has the side effect of removing all use of the undocumented
>> __signed__ GCC keyword.  This is a vestigial remnant of `gcc -traditional`
>> mode for dialetcs of C prior to the introduction of the signed keyword.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one further remark:
>
>> --- /dev/null
>> +++ b/xen/include/xen/stdint.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __XEN_STDINT_H__
>> +#define __XEN_STDINT_H__
>> +
>> +#ifndef __INT8_TYPE__ /* GCC <= 4.4 */
>> +
>> +/*
>> + * Define the types using GCC internal notation.  Clang understands this too.
>> + * https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
>> + */
>> +typedef   signed __attribute__((__mode__(QI)))     int8_t;
>> +typedef unsigned __attribute__((__mode__(QI)))    uint8_t;
>> +typedef   signed __attribute__((__mode__(HI)))    int16_t;
>> +typedef unsigned __attribute__((__mode__(HI)))   uint16_t;
>> +typedef   signed __attribute__((__mode__(SI)))    int32_t;
>> +typedef unsigned __attribute__((__mode__(SI)))   uint32_t;
>> +typedef   signed __attribute__((__mode__(DI)))    int64_t;
>> +typedef unsigned __attribute__((__mode__(DI)))   uint64_t;
> Much like you avoid "mode" potentially being the name of a visible macro,
> the mode identifiers themselves could in principle be, too. Being upper
> case names, perhaps there the risk is even slightly higher. Hence I'd
> prefer if you/we could use __QI__ and alike.

Fixed locally.  I won't resend for just this.

~Andrew

