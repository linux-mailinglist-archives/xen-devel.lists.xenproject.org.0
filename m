Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B05FAEB6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 10:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419449.664231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiAwO-0006Hv-Uu; Tue, 11 Oct 2022 08:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419449.664231; Tue, 11 Oct 2022 08:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiAwO-0006F9-RU; Tue, 11 Oct 2022 08:48:44 +0000
Received: by outflank-mailman (input) for mailman id 419449;
 Tue, 11 Oct 2022 08:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiAwN-0006F3-Rm
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 08:48:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130059.outbound.protection.outlook.com [40.107.13.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81ff52e5-4941-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 10:48:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6899.eurprd04.prod.outlook.com (2603:10a6:208:183::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 08:48:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 08:48:40 +0000
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
X-Inumbo-ID: 81ff52e5-4941-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRo/OcTnm/1E4fpZ4ajhb3J69oUa8h596+EWEjoQ/GjN28NxZ2kPXur7ieaaS5sjfD9XduUA0BqP4ul1qm78ZPObhr3rCb6nmPqP1aa5TcymDvhxP9+BAYuDGeNZ2j+cPFBPIzUbJxtjuKdvHF+C5kvTkqhfUgbYUv7xvYiCcRNw/y4JFncS9H9dqgctyRSwt+AJ8Wx6N6skRG8wnuDA9X++6r0lB320QdqhZB1d/r2nmdGanoVWXvxOo0AW8jNOXrvumTDnBzN9Vgpoh38uC/4nyh1pkxI4i/+WqfXAwvT8nq4s8nW0orJN88AqYrHpyBjgJlo723SIwWHej2iDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCFMIznkAEoGtILkRiPo+tByavozNVbWDchF5HojaPI=;
 b=kTHUpV7NNYGwWvXg2QqY9zHcwR3/XVILStR3ZQXRyfBgeGddX7zA6breUMcvQDVyYi/8i2sP4P0CbVkIISVogfFOTOwx8E+/B6dPOZsiDKm52Pm2+oFISgHKX/zj+R19amME3B2gQqQhwpJLZOckOqSL0qxrD2jHpOQFoimpJKrBtt5f4g/sPoWx/wcNRhJVHFOc5awkYHs6IKdNk36oG4+1K3Jl6vB3EQVIMv033KSmCyPxV9rd80dPctJLGwYz6WHzScLco8rx9SK0XbRbCcg+ufIDRIuXtdFRJrxAyHzLrKJUiQ0doBCNngoDXQjB5GgOYHHOuECZyxIeUytQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCFMIznkAEoGtILkRiPo+tByavozNVbWDchF5HojaPI=;
 b=JyCrVODnvXl7CHIZVEzUPFN6vaGGx8a+BClH5h0tNYw6xLox1yv4EhyXB3rIuELpciPQ5v+u0M3mJngUV4jinynnk3JEMz4rMbhRM22uS3aP3DeNUmyjU6MNkNVL3uO2xWz9C1DCgo270njLntcX6F/dtkWgqvlLlGFuyNkT+2zcZMQJPlBRW9Hls4VlZqFwVQmp2T5NaqWQO+wLQrLNdOu8WhyNzypuoM6+QH75tUqKkI5KVcRMMqSt+st9EfFC2eixy/sMO1I6W3G2QUslUlX0jO2manxmAmTl/pKjAql4jBSe5ce2vVrXfS4FBIMRTuT40OEQnem5cXew0d4t/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
Date: Tue, 11 Oct 2022 10:48:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] common: map_vcpu_info() wants to unshare the underlying page
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0587.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f3b257-01c3-42d3-4727-08daab656500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Qj0gJCC4qylo6/XifcuXgf7M9q8mM8dSPcYHuCRRqtJfK+zowmqXxW7rvGa+MbVl9T1zQx+1bSZasto8k3CRobkH9ZiwwBJlqzZH3WBW1puROMDlZXUDYMFfIx+hpbbwQp4veHe3w0CheFCqgu7ysZvLnjrhIGqSSYpnz1OLXG0KEASDCOVHGCEgBTgAf7Yu+zcIYzyuYNsTl11pfl2Y3U1TJ/gnN7Hzm5iZNPyZjOQ8l6Z/PjkutiK3ar84Mu0vgTNw0wGFXK83Gm9KWmCZn1XAG5PxIKQsO8M4bhcaBhHgPW83IH0opgCoxU6dc1YaMhJw3ONQaqn6qA/BHYyE6hUq+X2+IqZ7TybFksAQEhWBsT70cuQtdSb6xwE/Or6/s2FCrY0ah7w9P4K0U/dwqpESlrYXYQmGNoVHODCPA2VG8SjOfpXM+SuJbs61/8nq9SRIi6NZ/JofdnvfqFpGMYGjwXl08j7mK1aJXmfTXsoisx6Hf+t8q8gxmP/jsj9wIfPs1oK5IvhVOSppyiQ6pOQQ6rwLxL8pD+IQvqGPidKLjR68fPzX2oTDfOR7imSm9YiDX35CrM0viyTN+Zch7Ldb/6p0sm6TD3ZoCVyBDSPlndIPdRXW+xKtsvZQAM96Bg+9MoqwGMSYGEpcCn2qH6CDHdECLeu2KmQElGQ5VjstvF92ho7qOALAHj5VhL4vuHzNF1J/3e2otfMujZFxXb6NsYAFrd1GXal9uhFWxJ1OMxMa2M+D0KH0fEBjt+CwHbzsRSuJqxKw2B6JNH7zy0n/NmEtPBX5L4EW8YmR3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199015)(5660300002)(8936002)(31686004)(31696002)(66476007)(54906003)(6916009)(86362001)(66946007)(66556008)(8676002)(4326008)(316002)(478600001)(6486002)(36756003)(38100700002)(26005)(6506007)(41300700001)(2906002)(186003)(2616005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGdyb0U1Tk4vMzNoYU9xK3VWb3NQRjR5Q0VkQnJHYWlQM05YbTB1VWFHSlVV?=
 =?utf-8?B?djdDZVpSUTdVa2NEL1VTdStXUVpnYU9tN0pZNXNKbndBYVlVLzBkVXFjQ2hx?=
 =?utf-8?B?cHhXNnJSVnNleWM2SjQrS2lFSi8wZkpqcU1PeHlwZVBQb2h0OEJZZVNwWk1w?=
 =?utf-8?B?VHVqRzNTcXpFZm1NWmozTmVYVVEzajlIVTJLVEhBT1JOdE9MdzZiWXcrdGd1?=
 =?utf-8?B?aDhxc0lTRlNuUDlnbGs4WnNSM21JWTdFWW9scU9sd21RNUxlZmovVWlmTjJG?=
 =?utf-8?B?Y1dFSlozLy9VQmtCeGllb2I3UVBUWDJTWjdneUxBUHRMY1c2Ukc3VEZIMkJR?=
 =?utf-8?B?TVozT0VmeEJTUGlqQTlIbHFFSmdDeHZrSzZXN0hkejhyTnNiZjY4K21WTTh0?=
 =?utf-8?B?UXlPaEVQUzNKV3ZSZVB4MVlpU25BSlliSlFodjIrTU1WRUVTaThGbHpUL1J4?=
 =?utf-8?B?Z01NYTFNTldiZ21PSXg5QnBkS2pnYjRQTHJJY0poWHVzSHJZNldMSktjd0R2?=
 =?utf-8?B?M3JpRHF5QnZsaWRNQVNTUXlqaVc1M0pTVXdqT1dnVXlaMXhCWm1Hb1FtT0Ni?=
 =?utf-8?B?L2pBeVlicUF4Nm0zTThOdlpTN05oQmp6bWg4RlFodHRtUU8zdWR4N0ViQ2Zl?=
 =?utf-8?B?MVJmR0NncnFEbG83bXd5cEpJYlpqK0MxUUNMU09iZitISWs2bVNhUjdSRE5V?=
 =?utf-8?B?M3VGU21GSFc3Zkhab3phSEFKRGVLNTd0b2ovU0hua3JIZ3lEd2JheEhHNW5G?=
 =?utf-8?B?NFczWFM0ekxubzJGblVzK3BVdCtJMFhHQzNSNDRwL0FnR1hGUGVPZHFmbW93?=
 =?utf-8?B?TmpmNjlLOG51TFZ0T2NMUlNDRllWVEdYUmphM21GKzVEeVhmMDZZNS9FbGRF?=
 =?utf-8?B?UjNMMG1HenpiaGpzcWpmYW9WVHo2aGVNaUJ0Y3liT1hMOVpmTEIwSnNpb2Zm?=
 =?utf-8?B?MUFFd1RlWTl4c2pPUjNtdjIyNDFQZmFhaGtuN05VSFh1cjh2YjR1L2x0TDRN?=
 =?utf-8?B?VCtWRk0ybFYxZmhUcTNITWZ3TnVicTFRbzdNbTA3bVJrSThDRmRIWUx1Rmtn?=
 =?utf-8?B?WHcxd2haVUpNM2E2Y3BzeGsxK0k4VWlMQlIwV0FlMEpWdkRYa2RDV1ZJYWto?=
 =?utf-8?B?alNDM3dTcXZndWNvQ3JjekxKcHRVMXJZSkRMQ2VXZ25sSm9PbFhEelhnbXlM?=
 =?utf-8?B?M2haS2orMmJBaVBNYXNLK0VCRlgxMmo1RDA5elAzK3ErRzhVQjllVEpQcUhL?=
 =?utf-8?B?MzlTMHlvVWFRaXpqbXVQcUE2MVZaSTNXbWhsRVBubzU5bkRDM2lRc3FPU09X?=
 =?utf-8?B?NzBXYmRTMkoyUjY1NWUwek9vRjVmcVJLbmpib0lkQ0tXZDV4OEQ4SGtNY0s4?=
 =?utf-8?B?THBvSHNuSHA1V3hSTGlzalExTm9XOVJQQlkxRjlUM045ZjVCTmZmR01HdjFs?=
 =?utf-8?B?cXVzc3Y3cUlVRVJYcUlHV2xGNE9QM0dmVzM4R2F0OVg1TEh1b3ViQldPSkJ3?=
 =?utf-8?B?S3F3N1pzaW9GblhHcEtwQzFUWnpEdG8vM1VNdWhNb2ZOSXRxUEJZeHZpcG5x?=
 =?utf-8?B?QzBqL1JIOGYwdGVPWDFPbTdPV2M2OUpHakFtQjU0MTFOSnlPY1Vibi95Q1l2?=
 =?utf-8?B?Ymp0TmNhOEV1MjUyNkVHZnBmbWJxaGw5L0FGdjVXOFVzSC90Ym1uOVpINzJt?=
 =?utf-8?B?ZzYyT2VNQU8vdlR0U0hKMmhNcVoySkd2UHFCdHE4aEJFTlBFbGJ0Y0VKR1Ex?=
 =?utf-8?B?WkRjcUM3WFFBTS80bzFiM2Y0WERDdktPSTVCZWM2K1czWHA4SHZNemtPcmZ3?=
 =?utf-8?B?YVRtSlN2Ylp1QWlFNkZvOHc0WUNXb3dxb0E4UmR3QXByNGtJTldodE5TbHNn?=
 =?utf-8?B?VGRleFJBK1pqUWxpOG1lclVtbVp6cDRSelZJWHZPU0xTRGZKK3FYVE1wZFJa?=
 =?utf-8?B?VjIzazZkdlVuNndBSHNzdmFCTFRYb1hoVFJ3bHc2SXRYdk5vQWFnM0s4emFO?=
 =?utf-8?B?T0ViNUh2K2ZEQjhLNmw1ZkZ2NHloVVpGYjBvQnV3SVl5NnloYWR4dlBkTU1M?=
 =?utf-8?B?RFdBdTR2cG9jbmRqNng5d3pLNU5BUHVzU3dwV1pEUzR1cG4rd29SeGZ2QnpE?=
 =?utf-8?Q?2pfIe291XVaguwgSmYIV2TSS2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f3b257-01c3-42d3-4727-08daab656500
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 08:48:40.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hU4i2DCl5zcS8xoI4cuTMyKbRL6PePZChS6hkyQ1i+hCA9SBNci1krMq8mKe5SsdH9A3bdyVKq1Zw4D42vTSmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6899

Not passing P2M_UNSHARE to get_page_from_gfn() means there won't even be
an attempt to unshare the referenced page, without any indication to the
caller (e.g. -EAGAIN). Note that guests have no direct control over
which of their pages are shared (or paged out), and hence they have no
way to make sure all on their own that the subsequent obtaining of a
writable type reference can actually succeed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really I wonder whether the function wouldn't better use
check_get_page_from_gfn() _and_ permit p2m_ram_rw only. Otoh the P2M
type is stale by the time it is being looked at, so all depends on the
subsequent obtaining of a writable type reference anyway ...

A similar issue then apparently exists in guest_wrmsr_xen() when writing
the hypercall page. Interestingly there p2m_is_paging() is being checked
for (but shared pages aren't).

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1484,7 +1484,7 @@ int map_vcpu_info(struct vcpu *v, unsign
     if ( (v != current) && !(v->pause_flags & VPF_down) )
         return -EINVAL;
 
-    page = get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
+    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);
     if ( !page )
         return -EINVAL;
 

