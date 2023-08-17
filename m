Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B41B77F5C7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 13:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585322.916414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbbU-00017w-Bx; Thu, 17 Aug 2023 11:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585322.916414; Thu, 17 Aug 2023 11:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbbU-00015B-5P; Thu, 17 Aug 2023 11:55:52 +0000
Received: by outflank-mailman (input) for mailman id 585322;
 Thu, 17 Aug 2023 11:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWbbS-000150-RV
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 11:55:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7d00::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00405b43-3cf5-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 13:55:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 11:55:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 11:55:44 +0000
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
X-Inumbo-ID: 00405b43-3cf5-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn0MQrdBEQMOlC67wPpIC1subj1xXuHDNsp5AoYiU7zeO+95QOwU0NSP2sS4CP66ZqfbwMe9tAjwwThAOi2lREvPITlhUMLUQTu+hQ68JcksfFt7U05uXa+dwznLkvplA98Y/5TkOhWtfXBi9+Bd9lMVXVP4E7DPX2Kt/obZejndy7qL94hlr1TiEgwZ+1+EiaDKYC+pZOtRHS+rWemK4Ri9fPtiqT2uC0AvuUFPmtLSagvf5HYrxYkOaAYOYRfEQ6rCqmMqIkXHnUAKZ3jPkZu3EX1RsdEOI78sCubOrBCx00ikuIczOsKkuElpxvksml6ZkGGsLG45sCQlV0nh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZSHvH2MBApMn2n777J7QIqKu5B/kLGerqO14PS7VTU=;
 b=ZklvL1PjEp9d7fNyiiYT5FVlfZzncv1J1t93+FKeQXPoTET+XGNaGV3yXgpHMRamlls7SP0XD47eBlTpAmEactz0xdwxmSzSXKGfE3eNgp5l9jAPZRK0YTRGU60Q6xNHKLJ+EhUpCBaI+wKzhxvXjgdsQuQhLnrIuzXRw4Od8LvFrZxpCM4Axkh9ft7NONNDhzgrLE8t7A6NkAf62+Fn39ouKMlbj2fWpyiIry/N0MldliN9sDKsM2umllSMC+yVcrIHXOZ1mmdCsJVdx5+hpEU1jMHWvCyMRbZKNVu5U9IJ9Q0TLWPbRK7P6dXqEQV1L23bYzXGc3K5R6n1FjU9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZSHvH2MBApMn2n777J7QIqKu5B/kLGerqO14PS7VTU=;
 b=OP3Ain2sI4RLqJxUPxh5n8q9A536mElJ/byqXw4AKghdauUCix6VPiANxlSwxYgk0Q5AiSbzL1X/GTKS9Y9lklXHtspbn8nMIxgtzeVY06Lee5fqNu6M4JriENL53ITtglSakTk3B5zO0lkI5aW18vmNJRuG2RzZt8I6V2/bxy57xEkiEE/kIEhphRvoYEXLV0pa141+gJnN9hXmCvJMQ99h+Zn/PMlAtL2kDrbQkCJ++DVkxaEuB49nN+B6Iqz7fY11L7cfqpjaVFRxHKm1FBLfPArwyp4S8nUxDG+2xWLRSi3ilMK+R+lohIscHMEGHKaZwizbSeH20Z2aiZvzUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f1b721d-8784-34fa-5d72-f115a38cc877@suse.com>
Date: Thu, 17 Aug 2023 13:55:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.17.2, 4.16.5, 4.15.5, and 4.14.6 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 31030da6-3563-46fa-4f1a-08db9f18e376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N1xxYR5KhWbwxbBfUZaxSe9gLRuDuBA68pKesAY520+CiYaGx4APN407Af7gI8HbNtFnF/EWEGl3Kdm67Eja1LX8XVmRbK/pLfGxql0lFeM1bnoJEkt3wBm0J9D+hmKVKym+PZwLPgaKqfq5r8iVV/mYgG2aR3Y9gSv+IlQdO3JlFkalPx2eIf1i9UyE7YT56VeUQemVocjf1dHGnsmO/gF6RjN2VnWVD8v1wk2dPtXYClMZYEc7Ue52ElnWegwsWyVb9yXERL7SGIXORjXS06BRCfyZCUkaxPcnB+Y5DWxEXDVOlsKvynBfQsKKfUYJ53GMVOOI4TQ2XiSnp546Tpg+Y9ZTcDsNP9fZESPWmB/076A/SpSGbt+/McnyYnB3Jvmk1C8mxjSpj7uDeXAsl+mybEswXj0ZCj44CJM5TDFDP3oc773tXfioo3duU8IBS83wckde+FpiKljoO+HwAjhYHnYv3ype8J7XKr1e0OLbsvHDkUuTFSkXtUcGGl0tEcchCsbhOkPuoJNVkBGFqcK7weifbP0IDZprechU6Z6WhMUykwWoInvfqXLsfHNNGxDU39+93cVHNRSHGE4LnbRci2y/wtdOJjBzpTf4qyHx6h7xNCD783Pq9VsazDCDsVcXrrB+INxJJxECNRlw4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(1800799009)(451199024)(186009)(316002)(66946007)(66476007)(66556008)(6916009)(31686004)(966005)(5660300002)(41300700001)(38100700002)(4326008)(450100002)(8936002)(8676002)(26005)(2906002)(31696002)(83380400001)(478600001)(86362001)(6512007)(6486002)(6506007)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUhYZUtZODRrUEE3QkJtNnJHUVNIOHJIUE1KU1k0MTRmRjl5TGd6cExxdmNJ?=
 =?utf-8?B?RHVldklhcnVGRUI2YU1ySzJPcndoektrT1U3b0pJWGVYR1BjUHozRUF3OTdz?=
 =?utf-8?B?dUN2eU53ZFpFUWNIenlCdVNwZjR1aWlQUkVPSHFtSzFKR2V3VGMzVi9DTU83?=
 =?utf-8?B?bHNRMTdIOWEvbGYyaDA5M3BwZldYeStVeWRncXhCNndTY1I1ZlpBY1NLckpo?=
 =?utf-8?B?MEtBWVQrcHdMNlJ5OVE4WFh6ZVRIK1RlZCsvbVZJdUhnWjZjK2hmQWNiazJU?=
 =?utf-8?B?Y1dXeVUxbFRhRzBiNkNaMFBvSjZZMVFFcEc2NG9OUTlmeC9VVEhNOUhHRXBD?=
 =?utf-8?B?R2taRFByZGl4VFIvRHpXTlp6OVdkRXN1eE5UcmZ1bGNNSEJwdlVUakhteGt3?=
 =?utf-8?B?UTFSa2NqWXdsU2VjRjNwRzU3ZU9BRG0wRjFMTW1mQU5LREJRV0NPU3VJMFBr?=
 =?utf-8?B?dDlxTzg1RytlZHpvMVlqT3JheVJLK0pXMlBLQ1VNcklpTWhSOHF3SUx5OVBQ?=
 =?utf-8?B?RitBZ1pCQW85NVluVm1rQSsxT1dRdHVLRXNXY2xuU0hiUHdGOVRDaVFXdlEw?=
 =?utf-8?B?MUY5R1JWVis0cWk2L292U3BXZGo0QWlFazlpbG5sWHluKytuM0NXd3pBK3Rs?=
 =?utf-8?B?MEd5NFBReThQREJCSkRoazdvK0JVWXliVlpoRlNGdER0dXNhMXFZNFpQSVZM?=
 =?utf-8?B?S3NtU3hzZ2NZQlNDdVVmZ2M1eE1rbWprZTNBUU9EVUhEV1VCTGtTMUJNOFVM?=
 =?utf-8?B?eG5VcHdSL1NsUUN1R204VDlWejMyNUlqK0xEMVoyUHZUc2RJUlduNDZWdGgx?=
 =?utf-8?B?QWhyck5rejluODB4aytqbDZNNlU2Q291LzE4R25GUXlSMnpzSEJrUDgzL1Q3?=
 =?utf-8?B?RmUxQ1BpN0FRdEJOc1hVTXhMSlUxbTliclFPYVZPc05QWjlUOHc5bjNDT01K?=
 =?utf-8?B?eDZGRWkxeWlMMHprZTREODJZR05GZXlHMzBBbTdOQjRVMWk1ZEsyczl1RzJM?=
 =?utf-8?B?TU5VUGJlZmpNTDZmZGxHSEQxWXJrelIyRW4zMTVVd21vWTJCYTcrYlhiSG1J?=
 =?utf-8?B?a25JU2E2R3JzTEZwdkRacFZqMG8xYjFFdEptNW9IOEFUbWVnNlpZSXUrbWpr?=
 =?utf-8?B?R21vcUFldlRZZ0l3ZmxtTmEyb1A1ZFBVT0E2elNKc09JelFCaXpDS0x6SERa?=
 =?utf-8?B?Y2V0eVpTTGZ0UjNlNWlRYjEyaHZiK1BCSGZWUFVDMG1MNEd3T24wNWdBNU5H?=
 =?utf-8?B?VWUyUkl0V3RKTVcvNFlXT0hEUWFVQmxzY3JPK0lNcXZsKzNMS0UyMHhmSlNV?=
 =?utf-8?B?WVpPK2hVQ2pETWhobkdlMmNiMEl1T2tPWFk0TTJud2pYTDdmUVM2SkdWeVFP?=
 =?utf-8?B?WHZZM2NvUkpEc1hoWXVtTHhjQTVvalNJRldvbW9oL2tmOFQvUW5Cb2JyaFJl?=
 =?utf-8?B?UjI3bW5waEFZVHlaU1NXM0pMdiswZEFvWTM1WFhTajNNSkt6MXNPL09NbkVX?=
 =?utf-8?B?VHk2bkF6eGRER00rdmRlbXNOTVdEZEtzcjB6S3JTR2piQ2llaWhaQmM0bVg0?=
 =?utf-8?B?OXRkYzlaWnhYTW8yYUNyQ2pQdklEQ1NzVDNmTTBpb0I4ckhLSVBTeVdyL0Vp?=
 =?utf-8?B?QVN6azJCSGl4bkdXamp2Ymg5MUk0Rkw5VWhlZU40ZEpsZXAyaWVFSC9CSXg4?=
 =?utf-8?B?eWVKNWJTZDVlN2U0VnN1cnh4N0QrcWNQZTh2WnE0OWdORGdIV0RMSitzOTE0?=
 =?utf-8?B?YUJWVEEvVmx1TytNdkxzaHNqVmpDY1IvdU1MVWh1Z1JobE1BL2k0a1lBeEx6?=
 =?utf-8?B?TjgvRXpRUUVIYVpqSmtrVTh5MlVHL3RFamVnT3M2L1F4am9VdnhCVldYK2k2?=
 =?utf-8?B?R1R0dlNZZ2xUUENDTHFMS3M2N1oyUXdMODlQL0syQjc2UVJzK0VGNDRzZUYx?=
 =?utf-8?B?TUx3ak5pSCtvQ09yS1BmN1JVbEJaMGQ5N3BxL0h5T2JtNzJzcjBaaVNXWnor?=
 =?utf-8?B?cHFZZWo5dnh2aWxDNWJtYTg2bzZSaGFBeG9oTUFCTTJEaTdvTHFjOFNtVXdr?=
 =?utf-8?B?TTI5R056RXVGeHh6ZXVBWjlNUG1tekFpT3V0b3BZSEozNHphWmtlUnNlZDZS?=
 =?utf-8?Q?K01PF/P97N4/NYzBCrRazllV1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31030da6-3563-46fa-4f1a-08db9f18e376
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 11:55:44.8487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhiigKm0rfvlgxeFgRuOoCvmkGquba9BOuOeVWVaYBvh9mqfM5lDQe3DIyjwJuidxzG4slzhmucYI93O5EGroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179

All,

we're pleased to announce the release of four bug fixing Xen versions.

Xen 4.17.2 has been available for a little while from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.17
(tag RELEASE-4.17.2) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-17-series/xen-project-4-17-2/
(where a list of changes can also be found).

We recommend all users of the 4.17 stable series to update to this
latest point release.

Xen 4.16.5 has been available for a little while from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.16
(tag RELEASE-4.16.5) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-16-series/xen-project-4-16-5/
(where a list of changes can also be found).

We recommend all users of the 4.16 stable series to update to this
last general maintenance point release.

Xen 4.15.5 has been available for a little while from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.15
(tag RELEASE-4.15.5) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-15-series/xen-project-4-15-5/
(where a list of changes can also be found).

We recommend all users of the 4.15 stable series to update to this
out of band point release.

Xen 4.14.6 has been available for a little while from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.14
(tag RELEASE-4.14.6) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-6/
(where a list of changes can also be found).

We recommend all users of the 4.14 stable series to update to this
last point release. Its branch is now closed.

I apologize for the delayed announcement.

Regards, Jan

