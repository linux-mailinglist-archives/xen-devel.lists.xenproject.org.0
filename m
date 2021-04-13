Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258435E0C6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109772.209557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcc-00058r-4w; Tue, 13 Apr 2021 14:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109772.209557; Tue, 13 Apr 2021 14:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcc-000583-1I; Tue, 13 Apr 2021 14:02:30 +0000
Received: by outflank-mailman (input) for mailman id 109772;
 Tue, 13 Apr 2021 14:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJca-00055v-O3
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97c9e2fa-9949-4b1d-a14a-e3b47dc21392;
 Tue, 13 Apr 2021 14:02:27 +0000 (UTC)
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
X-Inumbo-ID: 97c9e2fa-9949-4b1d-a14a-e3b47dc21392
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=WGVjcZJbLqz1e0K2Qv90XwMs+SAdnWmxpckssWf3UQY=;
  b=KnJRdZif6IhAZ05E7o7r9vSRM7Qixa/ypY4+thfB7LirB1Jl5SXtXbGj
   HSpXIwioa1o2RhkhMAIsdU2DS427G32aM70LdboyBaVsOVvyUC6LC2kTo
   +WQql1KVUhYdo0YHuAM98zzoiBe1KFJi6LwtyKb94/vRudp8igQWHqi2G
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ny6wdbq1xxQnWPkZASog2YB8UKm3gHC6diJ52Ox5jdlkFtqBJ2O3/UIRIeELIKR3D6TqNGFlaW
 Uqp9Xb5S8xLrEIA6X1kfGoWDAFaltWtpW+5ojlm4auHn20dfQGqAc6F2ZGni5+FalMqZLA4MF5
 ePsuaVW2V+N1I+skYuIrMmId1UwYaDjQ6qf8+kJTmokH0YO8nYBP5Zk6pd83QLY9U+mDQgLjUh
 WcP3K+SC/fi+mHAjdpyn2nxrzjC8OxWZwAK7iwddoF0suc2Y5s3dRJlQVQtI0ASUojQTfHM8FC
 n+w=
X-SBRS: 5.2
X-MesageID: 41613815
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:25MGkK1424yXglONOf1kOwqjBTd3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrdnFebg9AGJY/Cd
 6g/cJBvTWtYjA6ac68C3kDUYH41qH2vbjhZgMLAANi1RmWgVqTmcPHOjW7/jNbaTNAxr8+7X
 PI+jaW2oyPu+y2oyWssVP7wI9RnLLau7l+LeyKzvMYMzD9zjuvDb4RIIGqmBAQjKWR5E0xkN
 /Kyi1QT/hbz3/KZGm6rV/M9mDboU8TwkTvw1OZnnfvyPaRLFlRa7sj9PBkWyDU5EY6sNZ33L
 gj5RPii7NtAQ7dhyO43tDUVnhR5zuJiEA/mu0ehWE3a/p4VJZtq+UkjSZoOaZFNif75Ic7Kf
 JpHcHR6d1HGGnqEUzxjy1BxsehUW80GQrDak8eutaN2zwTp3xhyVAErfZv0ksoxdYYcd1p9u
 7EOqNnmPVnSdIXV7t0AKMkTdGsAmLAbBrQOAupUBvaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuemr1YPf+nKFjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agmfMCGcfWMs
 zDea5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49RhagucTOBor2tvHKUfraKbb3eAxUGF/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZRHcHhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66itqu6oGKx7FvZ9mkBAGsYMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjhyUt3RCw
 wag1hs46q4I9ixyEkZepyaG1Pfq0FWiGOBTp8alKHGz9ziYIkEApEvX7E0Mx7KGRxzkQNDs3
 xCdwcAe0/aGlrV+OaYpa1RINuaW8h3gQ+tL8IRg2nYr1+gqcYmQWZeYySjSveNgQElRyNdg3
 p496N3usvGpR+fbU8ExMgoOlxFb2qaRJZLFh6Maolvlrf3Qw1oVmuRiTuGixY8R3ry+ywp9x
 /cBBzRXcuOLktWu3he3Kqvyl9ye2mHV29ba3xxs+RGZC/7k0c29dXOSru40mOXZFdH//oUNy
 vdZyAOZil0wcqs6RKTkDGeNHkvy5k0JNbBBLA7f7y74ALqFKS40YU9W9NE9pdsM97j9tIRWe
 WEYgmPMXfWDfgq1wH9nAdSBABE7F0f1dXm1x3u4DLmgDoRAf/OLE9nQL9eCdeG9GTgT+uJ1p
 I8rd9dh5rFDkzBLvq9jYfQZHp/DzmWh0icZeQhs4pVsqI/r6EbJeiSbRL4kFV8mCwjJ8L1nn
 4ESKt14Lr9KpZiFvZiDh5xzx4MrpCzN0MlvQz9P/8mcXwsh3HdOcmV47Cgk8tZPmSx4C/5OV
 yS6ERmjo/4dhrG8b4REKQrJ2tKLGA69XR55euHHregQjmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 I/x92TheeYe27Z3w/X1AELb55mwiKCQcmoBhiLFvMN29umOU6Uiq/v2fWNtl7MOHKGQnVdo5
 ZEe0wWZtlCjTdnrLRf6FnMdoXH5mQ/k1Vf5jl7kEXKwYbO2haDIX17
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41613815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0UH35FCVfoJidA/NbGvIfQ3vUqiiuwkHizfhN7kk1PCBbY0ak1uc1hLgMNyCJQu1DcjqoSkOiVG929DUEtMzbyRKqR/npSRt5G2heuKv1vja9DpwDrRoKLP1cCM9uOK57O2fPhd1rGH7APqXW6uXREv/Chn1mF6EP2wGgJmZ4o90YfV4A9BRUjfxeVtxejr8aP4iS239Pa4Oe3HtZe09CvsIl3QdmPwXERqGItmSQboqPbFa85C4H+y76FGHRs6rG9UJujTJcqRbjrbTf+TeR1VpquUN5lZvRSIVPyHkxhT28XPkve2SBKONb6UFbX2APJHtrMQvVzzLyAPlTKR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iRy9GuGFLyRtl5I3ssxtVqxdTgRXM3rmBhXql49R5s=;
 b=MoMjLFeu0eSqLBEE5jsaJGwqw91VgXzhDyNKaJCkxDk/dzuuoIxd2v2QsB+stqx+XE36pk9vYnBAIHm2PB7f2zfLWwemRZnTuv/J67xWMAyHOmLMGwwM3vJc+Ud0b71hjleeZzC2IiN3qTiwbuepmHARZ2RLp/0hrEKiseTLJFrh/JV2NnFrcG9+bYJDyXQ5MORivKUbs7vyD4NwsgU8P36kNp2NCQg4K1U5KL3Hr2ndm3M+0SjSpYfko/wt9qSWQpgt4SZKf0ftH5Iuj5/oiiGzlK2IjO8V/UWBOxDLSBDE/rBlxn5MzrWlVzcjGL8EChGyETiIOro/cy6CTcCMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iRy9GuGFLyRtl5I3ssxtVqxdTgRXM3rmBhXql49R5s=;
 b=TdtqAeIsDqDormoIW/dyYdtKqYId6j57wKMHCf4NxDyE2qIAJD3SWWP6CMUmEt/AuBNL/wCwpPhiSIHHfOi9nhJkw77tpNWAgyom23YV+3fG/2RxFI1BrI9DjYxLCPNYfqxRMpBeMeO2IFSAqsir3A8XsKIsFpsHS/PUbJOzfac=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 05/21] libs/guest: introduce helper to fetch a domain cpu policy
Date: Tue, 13 Apr 2021 16:01:23 +0200
Message-ID: <20210413140140.73690-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b192e6b-f1bf-4f4a-8614-08d8fe84c39b
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5542C875554BAFF458C4DE428F4F9@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwGd5gfYa7rwXBI15R6ZI7yv2qgTgGP5EgzHyQKonLf0/2PSmXFKh13n+JrjHhrjR+LwOE8mSlVR3DfdEGe7yj1nw9GXGD0M+odwFa0sKvJu0XTf4fc3u6dl7lKYhj+kiY/MFMBewLv9bquhk3gOwZBOvkELzSV2nJILiLh7IIYhDyMGKpF44P1WvCX7AO/VwnORwpfEoX9ET93GWiy5iTshH3tvoutdCwckoEc4ZlgX3GFHoPK2to8XBtm+d52/JcxC0s0u/wghy8A1bAm+g4JsZIYfrX4u9ggyNAoxow9a0FzDo+BVFvOt+8MG1YJpcMJQQW3tghomPWmvrM3myonIQiCNytuzCS9nNOFuQiNyYXieqQMQIajD5xPojLwOpEsVmb8dxXG5Aj9Oq41nddF11Ue0+TTYcaKmE0wZ0DggyGOnldx02hDfT4qKP0OW7fXe0Hj1WmjFluldwREtEMWJwPh22fXkLEmRl25Gec1NXMexXLeTvp0uoMtki0uVn3+JXYiXAQqmSeSNRb1RFtgnAMGjZh/MG+CsJM8zBCFnY+DpbgO9F8gSPBe1hZv7JV0EHRCE4n6GkNSgZZXfFRB4b+KX4MOfKAEFEB8DL4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(346002)(376002)(2906002)(6916009)(6486002)(36756003)(66946007)(54906003)(1076003)(5660300002)(66476007)(316002)(66556008)(8936002)(478600001)(186003)(2616005)(16526019)(86362001)(6496006)(26005)(38100700002)(8676002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3ZDSUhqQ28yalZtMm1DOGxHV1lZK3hOZjRPN3V4WFl5M3ZpclFXTldDcThh?=
 =?utf-8?B?UFVDSElCUnR6QVYyVVBGMmZCOG9BYUxCN2tDaGNCUHlGRFEzWG1yVTA3V3N6?=
 =?utf-8?B?UFhSdHQxRlptaHpMOEI2M2hRdzZ6YUdGYWdHaHFFT0RqSmRWOHN0SEdhYUdE?=
 =?utf-8?B?aTlGV1FHWVE1eEFPR0w1NmRaYUVzN1hBbWpycUhuOENhSXZsRjVuT3dpVEV5?=
 =?utf-8?B?Z080TTk0a0FiSmlndzZtenBxVk05eTlWaGx2RzdmRm1JelRzM09DTXF4aTls?=
 =?utf-8?B?RG5jOC9RNmd3cnF1cUdualRpWUFiQWd5cE96bGdoeW9qbFJFL3oxbUx1b1ZC?=
 =?utf-8?B?akNtbmxCOWFIL2h0UC8vby9WZHZPYmwvRGJCSXZ3Q3pZUnd6VlFrU2lWODN5?=
 =?utf-8?B?UHZDazdoS3FnZFR6VVl5eXRWZnc0L2E3N3FJMDJTOTRkSnpxZkc0VFFKZGcv?=
 =?utf-8?B?YXh6N3ZMTW51TXhXU3p6UTlkckJFUTF3aGduNkpsL2xNc3RONXlNQjRtY1V6?=
 =?utf-8?B?TjkwU3puWklaT05QUDVPdTZwNmMwdFJzaXVGY21UMHl1cTh6WHl5OTVIekN4?=
 =?utf-8?B?bWNrU2xaeEpTVG92RDk0eExUdDlDcmpzZGtNZXRZZjR4bXFCWTVLWXZNNnlY?=
 =?utf-8?B?TS9kdkNBSkNDMjZlZ1ROU0FadFhoSmRXTkhPdmNXYUlFTm5SSjhXUmRNUEdx?=
 =?utf-8?B?SGlGSVMxa2VFd2l6VVRmclF1TGJPNFVsYWNFTXJiMjViaWVPR2phL2hIejlj?=
 =?utf-8?B?Q29EZG5PSFV2bENTa2dOWDNJeGpueDR6bmx1aERQWjBVcnYrSzhjdHIxU0Ni?=
 =?utf-8?B?TDNCaGdCZ3lHa3htRzlEZGZUY2p1VFlhY1JEWU9CK2NJNWk5VDRlQmtrWXRU?=
 =?utf-8?B?KzhLcFBVUjBvakJnSG9WQU9JamZuNENEMzBJck56VTNXSTllM3B2dXpEekR3?=
 =?utf-8?B?L1N3aFg0alFZbmkwdFp3WEpZQ0VmUW1IYVpIemtXQ2l3R1BzK2V1cE53WXla?=
 =?utf-8?B?SmdVenR4eGtTRm54YlNYMkdTOWloVjhabmpwaXMwOXFxVjlrYzhpc04rMTlS?=
 =?utf-8?B?dGcrRUtJSlVrdUt6eTFXOXNWdEFUTTMxc2crYVNadldJa0Fjb2NtRUlOMEpC?=
 =?utf-8?B?R3N1SjgyYW9rS2J0bm95eEV0UmlOVVNiejd3Uko5TEY1REl3S3NIb2F5T0RJ?=
 =?utf-8?B?MHRrRjBEanh5ODlsYWV0RElaTGlKM1RwSldlNzNyc0d4Nm5nYW5qY0hHT1pO?=
 =?utf-8?B?R2VYVjkyR3gxbEUvSkp6eVh5SjVUSFRGVE56SFZQOGpJTDdCci9lc2RxeDlN?=
 =?utf-8?B?NXdSdVgzMFlRcVRpYlVQN3JqankvTWhtdVYwSHVsUXRJbUlLSzV3bXNMT0pP?=
 =?utf-8?B?NzFnR0FKWXN3Y1JnTHlzY3dzR0FhNHVGcFFTc0RZbVBoekxhblNtVWJMWkNi?=
 =?utf-8?B?NXBMaFZtR0N4d2NadE5tV2VzZWNnbVhKQ2QyOWhqc0hMTFZFNGdCZWQ4UlZh?=
 =?utf-8?B?T1Qva1lmZ0Eybi9mV3VJTEtFWHRRSjhzRkRjSkdhek5Wakp2UnhMSENVREZG?=
 =?utf-8?B?Mm5kRU90VGR6ajIrdWIzSjVDQmd6bDJkWXlQYU1XK0czSTNZNGlocEM4dExM?=
 =?utf-8?B?bVhDbUUzYXI3b29xVHBGenNDVmFpUW44eXZubGRZaGY5Z0ZYWENmbFdyU0cr?=
 =?utf-8?B?YXpsUTdjMUFrSlR0REsyNUpxano3RUtPOGhEYTIyS1orU3V0blRGckZpY1FK?=
 =?utf-8?Q?T7HdEA7WY9haC7uC5Y7j5ms9mLSWWUVLR+O3Iuq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b192e6b-f1bf-4f4a-8614-08d8fe84c39b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:24.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBztJWLHqpR0WkZC30vqVhX+ZwEm99zFiE9cQZnhjmnxrLjEFXVDICUyOYhbmssHyuI/WFc63KNucr4pAp9O1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

Such helper is based on the existing functions to fetch a CPUID and
MSR policies, but uses the xc_cpu_policy_t type to return the data to
the caller.

No user of the interface introduced on the patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Uniformly return -1 on error from xc_cpu_policy_get_domain.
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 187df5c5d2d..34d979d11da 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2599,6 +2599,8 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
 /* Retrieve a system policy, or get/set a domains policy. */
 int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
                              xc_cpu_policy_t policy);
+int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t policy);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 78fbc7db9d3..1394e503f3d 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -732,3 +732,28 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
 
     return rc;
 }
+
+int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t policy)
+{
+    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
+    unsigned int nr_entries = ARRAY_SIZE(policy->entries);
+    int rc;
+
+    rc = xc_get_domain_cpu_policy(xch, domid, &nr_leaves, policy->leaves,
+                                  &nr_entries, policy->entries);
+    if ( rc )
+    {
+        PERROR("Failed to obtain domain %u policy", domid);
+        return rc;
+    }
+
+    rc = deserialize_policy(xch, policy, nr_leaves, nr_entries);
+    if ( rc )
+    {
+        errno = -rc;
+        rc = -1;
+    }
+
+    return rc;
+}
-- 
2.30.1


