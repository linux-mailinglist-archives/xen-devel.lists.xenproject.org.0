Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE854EB106
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 17:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295880.503662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZE7v-000581-68; Tue, 29 Mar 2022 15:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295880.503662; Tue, 29 Mar 2022 15:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZE7v-00054k-2D; Tue, 29 Mar 2022 15:51:23 +0000
Received: by outflank-mailman (input) for mailman id 295880;
 Tue, 29 Mar 2022 15:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZE7u-00054e-5g
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 15:51:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 140f8bdf-af78-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 17:51:21 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-NsxonC3WPmm3fRF5nwcQSg-1; Tue, 29 Mar 2022 17:51:16 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5799.eurprd04.prod.outlook.com (2603:10a6:20b:a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 15:51:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 15:51:13 +0000
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
X-Inumbo-ID: 140f8bdf-af78-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648569080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sBQaXdCYhxMGlQ5Vx5JXxTY83nb5VS+KV/1Sq9nHI90=;
	b=FxgqukHSLr0J/YcCykkmzRBdxuVNec0PPRkqKeUGJD1T44MG1Qi1InRGALlAhSfXIAuQPs
	QPJZa8hGOTyqw1tbp1yCPx2JWKkAo3D2HZsHtsEYM0ljAZZ1TjRHGt9BxzAKr/oVbYAeKX
	s1BepGNefpCf5/JjWFVnWRDrAjRsat4=
X-MC-Unique: NsxonC3WPmm3fRF5nwcQSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBxdrcD3DJ2CCbXzbKEfWZT/XA1MobX9fKdqeOlMPZSmONabwXKeavW/gG+LiACR6Wm2D1OWxbkNTJWv2c2WaUp5ezmhXmVvp+LHVtcbNW6E07Ezce/NDOm2yz4G6SyCRgJAXfKp/6GchnYXt8Qnci2Fqs5Ccn4Qajzy2fqMfxKp2cwPXtK8zaSu1022LvRolYhbtH+Z6oR4l/Tu97QMsbvkjNeUKHdXgDVDyagO2URU105ADRDjwkxhcctlAGLBTtVDihF3uT24yMliXcMBGME3efNsdWfUKFn+DybfVSzXzc9NlibofM9V7/b9pn5J2G+DO833VPBBYRMe4M1hFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBQaXdCYhxMGlQ5Vx5JXxTY83nb5VS+KV/1Sq9nHI90=;
 b=XUTKSTh5apdT/soeg+CkqoO9zVIX7ATXkjjrSijSzWPMdR4HTxnwObrzYsnbU6VQVUImye1iOYu1Io/IUrws84Qm1chqaz09H9Ntp1LskDcQ/PVkxpfUNZeMV7dji0SD4kSIC/elUYIukjz2KkXM4h2wAR073BntyEDgQwy8SfWNBPXG9tlzVb8l49mX6SQcz12ytvC2hf7p3gHPuT4c7xUy9Gi3BiDUUkL8MpTC0xCRtnC1o//1/XLmLNyQDjArXAHzZZJ8PuiqoMOtf/SWBCh/yooBFWqBy0YOdyTbgvjAtuGIlvKF0vEgsFtv99RsANYdYXnPigi1cdP/20Mj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <259a550c-9657-d0d2-d58b-c7c7914fa25a@suse.com>
Date: Tue, 29 Mar 2022 17:51:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/3] x86/mem_sharing: add fork_complete field to
 mem_sharing_domain
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <10b1b71d918b7d7315b49b5932497d094f767a1e.1648561546.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <10b1b71d918b7d7315b49b5932497d094f767a1e.1648561546.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e48f4b5-dfdd-4959-f409-08da119bf403
X-MS-TrafficTypeDiagnostic: AM6PR04MB5799:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB579994789617CE83A7ED819BB31E9@AM6PR04MB5799.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GnGOYLnUjpVoUp+3o0mX1+9cxoxK2c6J43IpPL3XEsFkTw6JxzxlbQdE+Jc8mHMNMu2KaVLRJapC01oVbxPtq8bjTqOS/sPRb+mSmi/JqCBxEx7j+NIc6e6yu20m1zo4hhdz0XvzU2pxbyFXl0JtNQQODzRZmZBZMUw3oEWYMCepzhFWZTYOnjFYZ6xbt5n8sdYcfxX6Vmhk+eX7rtBELNKGXYzOy1/7sph6QQ8WWUQ8fn2UyKa74Q8hw5G6saJEh09Nwitf5ww7VKk4x4QZoj4e+rDr7nhMcy0wjFw9dL56/JRhMz3/yJgzV/K4/cfiuciCDaF6+VvxxliFDZyaiasoOh6rC/hOmSmbnsfZindvlopxcpI944XRf5CkHETSEx7INNQ3v7eXDv49ogS8r4Q0x9lUdyaqzd7IRd9XQ63EqB5MbaQy5TeOziBj9pv9JhrZoDeChrdrz8ywmIeBSnR43eq4xZG/+p1KU401jw44/Q+J/7U8DnHgjAPgjAM6dtlhr7vor7DKx9OkAkSEke7Vt1/xiZRPt4lfCSvK/++bSp91QkMudqOyw0Uy4y1pFg9Enngn8csNrnbsUWv4tujMqe5Yx6Q/C6TOgi8VtLg9OVwm3y8XrYZiKC2IrmHy55lyq8+t0yEuEXn5/sQ7CiAkWltyyGl61SBmhbLbXCQ8aDFtWU0+r2FIlCMTTxEj7Z4LeqWsHtQGjSZZJNCJc4xJVVPNU2KgaRtPN3dNbXKwy2BsTrIA9cMscwHAGfKk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6916009)(6512007)(316002)(186003)(6486002)(36756003)(8676002)(508600001)(54906003)(31686004)(4744005)(2906002)(66946007)(8936002)(31696002)(86362001)(66556008)(6506007)(4326008)(2616005)(5660300002)(26005)(66476007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG93aGVEc0N0K3hBUlhrN0hTT01uaHM0V09DMTloNmg0RnNVTDhNK0FhTzBu?=
 =?utf-8?B?aWJlZjZpWmRxTEh2MG05SzRnRmtNN0JZQ3ZVR2NMK1dwdS80cEtXNzdQWFFS?=
 =?utf-8?B?NTdEZFBUOVpHZHNhWkwrTWJmRGtyRytOYWRza202TVFPb0JjaW5mTzJxcTJG?=
 =?utf-8?B?dlNpTlRjelIyTUhGd0NaWlJOcmJqKzV5eDhWQSsxUzU3b2dpRk1NbTlYczVY?=
 =?utf-8?B?cVphWGloUmlMZW9BeW1KcmRaRVIyVmJvSlViWkpUL1dzRUJJcGV2WjZ2N2Vn?=
 =?utf-8?B?TnFENEhBMlBuS2o2WVQxSWFTRUExZkhOelZraU5pMDdKY2Qrc3l4dkRqVkpj?=
 =?utf-8?B?L1lDQ3pvSEF2Z2FYNTJ2Z3MwOHNxWVEzdzBMTmt6ZmZUclZnVzF5a3k4d1BM?=
 =?utf-8?B?ci9oa29OVGkwUnF5dTZKb0dMVGJ6aHNiMnYwenRuWDdQanBwckNyMG1YNUpv?=
 =?utf-8?B?MGpnN2hjbEl4bXE1ejJWV1NxZktWMVEvcllKRFVsVWkzR3BMeGIvWEpsZFJX?=
 =?utf-8?B?YzlXVTY4cXFMMUJHQkJva1BRL2dlU1VnODBoSFRJK0pwWTQ4YmxFWUZNb1pm?=
 =?utf-8?B?c0ZOd3JDME5VSXMyZ1QwWmhrdEtUYTJtd2ZjdTl4OXA2b2ZRdWtJV3hEQ3Ix?=
 =?utf-8?B?Z25ZYW85Vk5VQlhqTUVhaWtOOTRNNmVMWW1lMVl1aHBSNDNqVEdHdFByWUJq?=
 =?utf-8?B?VG1seTNIWlovOTkvd0ZxN0ZJSHA0djJBZ3RJNlZpbEswVUl1Y0lORm5ZNFdN?=
 =?utf-8?B?U1BHUGpVdVp0UWYzMHVkYXo4RGZETkVLb0RoTldTZGhMMVF0aGEvRXMzeEVH?=
 =?utf-8?B?YVJrSndCN2ZaZ1VWVlF0YmNCMWdyTzludVRjOXRLN0NobEg5VkphTkl5c0Vy?=
 =?utf-8?B?c3QzOHZXTXhla09iZ21CU2JCQzM3dE5HT2hQRzlZRmM1Z1VTTmMzTHVpcUVt?=
 =?utf-8?B?WmhrMTRkNzhTaTJ0RCtzQ1h1ZkpTRlZ2VjhFWHlKNm1ua29rUExEQlRWRndk?=
 =?utf-8?B?T2ZSSkdmV05Uc3B3SDhjbGxjTE1Vek5zbWlDb29xcHNENFZyS2hsZWpVRGxO?=
 =?utf-8?B?MCtnUSszaGIxN01YRmtiNzJiclBNUktsNEFqblZoVHRtUnVVaDBtTzJMT0dJ?=
 =?utf-8?B?VER4dThvTWNCQ3NaN1RieG9IU1ZsR25mQnB4WjhIRktQNFk0bi9wUGpYa3lK?=
 =?utf-8?B?N1RYRERiai8wVE9MUCtZdDdUVlA5MThGVzBXaDVoaHhVT3k4Zm9NRUJXM3ZL?=
 =?utf-8?B?d1FOYitQMHVUeGNQTWdiZFVCNUVkZm9zQnVpRnd5M0lTNUNsT3pBZTM1a0RO?=
 =?utf-8?B?Q0pCdHQ3a0ZHR1F3WmNiZTlHQzAzVzJMb09YSEhwNFQ2UDFtTndYcjVUbFRM?=
 =?utf-8?B?OXN6T0tqRElKSzd3WjgzRVhoRkRxNzc4VEFCVTRBay9xaTZOV2JXc0FSVDc1?=
 =?utf-8?B?YTMxZEVZREJEZ3VpcUZUaFAxdFJvR2ZNSW1HeVM0by9BdWw5VWZwdXhQNWM1?=
 =?utf-8?B?eUk2QzE4NDJiQ2hvRmlDRmhFVithbDRvSkpLcEl0NW44dFRqTnZUbnN0NXpi?=
 =?utf-8?B?Q0RtcDZiVXNQM0E3TDRnNG05UU9MNXU5OHJqQkt6YXE4cU0vVVUvMDZOdHB2?=
 =?utf-8?B?MUlMUkRxQ0IvWWFPVS9hcWlJWm5jcXJJNFIxcDRxdlhTUkgwTzNxczdHdmRM?=
 =?utf-8?B?SlJLYmtxajE4TmV5S09KQjZaSU05RnFqdzVDd0dvbEVBeldId0FSK0plTWdU?=
 =?utf-8?B?a0srZ09uejR3TzBLWmJnT2VjN3dNOWJibHJycHBNT04yNEJUMnFxM1RMUDlk?=
 =?utf-8?B?YU5aSkZwWWtXcHJTbFZDVHFZQ2xGL3hpNWZvZUZkTndmMjJtN1cwRXZIbFpv?=
 =?utf-8?B?dHJNMUZqd1lsL0NkdllNaGdiWTQ1cXEraHBjNThrVW8vNFBoNlc5TGN1QStS?=
 =?utf-8?B?bStCNUVrSThvbGd0OEVhQnRGN2k5aFU0b3p2VGk2N01KeHFXV21Jcy8xQVRZ?=
 =?utf-8?B?U3g4NWNNS0hPQ3VVMFZuZFViOXZ3blFuNk9sRUd5Wlp0Y0V3bHQ1M3ZNNUps?=
 =?utf-8?B?RElQWmRWeHprWG95WTh2ZWZicEt2ZGFGRkdjM0hDTWNNMnpBY0ZEamxoNS9y?=
 =?utf-8?B?cFUzelJKV1BCVCtCZ2Z4T0JWWEIxaDlLSWs3czZ4WitDRGwyalZXaVB5TUor?=
 =?utf-8?B?c3A5SWhqdVAwREFSZTJPREpmenhWNEhzUlR1V2pRNU1HRUVNRE5rOUJMTVNQ?=
 =?utf-8?B?SEpxblF1YkI2aWJ5R09ickZkd25EOER1QzRYQnNKN2RvM1NlczNrNlVpTERm?=
 =?utf-8?B?VURkYnBtTUVuSWxnUlUyK3hCZjM1SklLdHJtWmFZYkd2UXg1dVdXZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e48f4b5-dfdd-4959-f409-08da119bf403
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 15:51:13.8942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qH3kLWYHHeGCkoLVxuGtuOuOHIqgsqsui/a3tyR6p3mDDDdM+J/xNqafzpfKoTvGAPF0ybH6ecWz0/LF2+dVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5799

On 29.03.2022 16:03, Tamas K Lengyel wrote:
> The fork's physmap should only be populated with select special pages during
> the setup of the fork. The rest of the fork's physmap should only be populated
> as needed after the fork is complete. Add a field to specify when the fork is
> complete so fork_page() can determine whether it's time to start adding entries
> to the physmap.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


