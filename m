Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A05C39FC4D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 18:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138586.256483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqeVx-0002cA-Ka; Tue, 08 Jun 2021 16:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138586.256483; Tue, 08 Jun 2021 16:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqeVx-0002ZN-Gx; Tue, 08 Jun 2021 16:23:41 +0000
Received: by outflank-mailman (input) for mailman id 138586;
 Tue, 08 Jun 2021 16:23:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqeVv-0002ZH-Tn
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 16:23:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2085973b-47cb-4d3e-a11c-e9e642bfea34;
 Tue, 08 Jun 2021 16:23:38 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-cTD_VXCUNpm92xOPM_CiYw-1; Tue, 08 Jun 2021 18:23:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 16:23:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 16:23:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 16:23:33 +0000
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
X-Inumbo-ID: 2085973b-47cb-4d3e-a11c-e9e642bfea34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623169417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDazx47XW88ugO/Etgz7NGpwbC9VXwnbfyVEV3s33LQ=;
	b=IMBiA58ScnGpW6jg9EdzH2pZaoPBfraQP3wpoF+bX6ws8Q+sAEoPY36Bb1rg0rg87X0Hpf
	OmR1o3Xys1YED8aPMJRV4z+KLmoCb/HnBXe21pD6aZvcE6fBs1kYCiGOjGlwOKANdC6dQI
	1rLH7o6zFIHNp4I1mFeMtoknRN3fG1I=
X-MC-Unique: cTD_VXCUNpm92xOPM_CiYw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq3hz41+4SU+iXMHKSaYSOIMoVjjhGi7QRFBxEpqt9hGDfc5P1lZiFOC3gwVDA/g0Mgeethbe2A6ktmdCoMg2bRWzeFhY5A10Mx1mWog3BBMARa2XifGOwVsRAzsPXgVLQZSRQUTkq9kAD45DeVmc4NsQKpN6uAwV/28goZnoThZ2Zl+GCbRcPHnW1eE52coPT6bTkS3v8Uzh4L918ZqsxoesVDOOILvyetsvxvxi1xLFYvHoW0wCoHipfT2VOd97K7/baAk8IVvnqnGHmEusU5AFiKybv++D528UJjbTGEXIVtfCteo8pOHfo80j+Lcvm6X9BvQLHuw6cK6QGTeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDazx47XW88ugO/Etgz7NGpwbC9VXwnbfyVEV3s33LQ=;
 b=folCj1Ua3I0NeTdiYjWZD1+sAwoChqrOTFgrgkcgI1SfFKhCIADH6kFlOgSC+YPmqgCOvUN//JxjbA5GWuAyrI7jCS7YUNF7TDlKeZoO//FcJmtCxc1GaL2TwKuYO8qV8CDoSMolD+enAWPc344zc7mKL9+L9BpeFJXv3EoyzQmaTBEUbhrJpu8yrzYE0eAbXO72uLh6yTT9uzuVOQ3iA+YGiB5DQiPy8gNkUtaEOGerSVeovZcjXHEEpSLWtMLEtfftEICrwTK6X14iBBVwz9Hx0hp6nXkAh1oqVuSF90fr33QLc3HSXpfPWwR3+HXyUce+hjuhL+eCGkdnN9B0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/cpuid: Half revert "x86/cpuid: Drop
 special_features[]"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210608161901.1894-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <045ed5c7-b1e0-a081-18ac-22ced4753fe8@suse.com>
Date: Tue, 8 Jun 2021 18:23:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608161901.1894-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bbbde03-3e55-4758-4ef5-08d92a99c2e6
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6175EAA9CF230086F5482F07B3379@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3mHEsF+jhnUmJ+MgQV621fHTx8IENaEPOq4oZAmWNUblDxVFybFI6b9McCNdwwh/ayd5AAo/DjcPrvGc5+ykMnlIVtSTpCDeOuCtrDLITjE4FU8ENf355Q1EA/yffaEEItOEwKCWN0RBwnPVgCSSrtXM2MGXOP44H0EpyWpmkD0c3dtP3Bvr11bqwZCrmnps4anPiEBR/3D5LkkxfTuR/HBM0KkfzEazNL91mMB25FWakERel3rjPnm/ytAidzfVqnsGQYdkzHrDyh9gNGqBxQScSeDZjLaDK1d7nJMPJB48UFtTUKPAGzDZya0eqXYwnsPWC2bi+I1yZYlJ8xaaUNvLhuWglATYPj81WBestVwDK/scGhsmDxW+4BOcqfkq+QsXrQmnukd8Az01EKN9EdlJcWlP0nN54A5MvunxLaf9dt5rVKL+nvlFRkjeN2vllQubz1SL5vK6rJ7wOdH5wsN3YJ1+l5EyTQISGGAAFYP/h/vdv1gEB9KotqQCpE2NihvG5sViORi9aUPsCYx3YUD3EKy+4H2hB+pFmWTY0yMtVX/4GxMKN/OF0tc5mnQkRN7pEvyAzOqiKSRd0N7xfJAujUJbG/AnsTSghU6JXsBO5BG5Kl+NTouGQRW1tTV5ZYOv2Ww+Ar1LXoBpYk1lZvBkstbTFV93QMIHE/raQavDX5sjEzkCTUYFZheI5Bh8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(136003)(346002)(39850400004)(396003)(5660300002)(4744005)(478600001)(38100700002)(2906002)(53546011)(6486002)(956004)(31686004)(86362001)(66946007)(66476007)(66556008)(31696002)(2616005)(16526019)(186003)(26005)(8676002)(54906003)(36756003)(8936002)(6916009)(316002)(16576012)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?dUVZZ0tOMDRTUXRNbzRKY0s1VktJRkxLamZtekt2VjMwZFk3UjhIUkhKYnFj?=
 =?utf-8?B?SEs2NkdqdkVQcGFheGdYaDVVdFZUbWVpVDFnNHYxQllnQ3JpS1RUampzbERo?=
 =?utf-8?B?c2tnV0ZuUWZrNzR3MUtkYUpnRVlXaHlTWTVIQzk3dHhRZktlTjk4TmZmekFs?=
 =?utf-8?B?NUQvL1ZyaXUxTGxQTFErbWltSkRYdVA4ZUpzSUh6WE5BVUkrcU9PWlBudzVh?=
 =?utf-8?B?Y2lqOFJPdGI4SSt5NmEzblFieUFaQ0RPZ3R6aWlwMzBCZHpDN1VqOHBIMVlK?=
 =?utf-8?B?RkN0b3Y3ZWlndlUrUkpkT0gxakk3VXdDaSt4ZUhpWTV4RVlncmsrOVBaVyt5?=
 =?utf-8?B?aGdUOUc2WWFWNDdJSFl1MVorNXZOK0NoZk1iU0MzMFdSbERER2UwWEtlaHRE?=
 =?utf-8?B?NDN5WVh3YWh1ZXFhV1VLT25yZ2dkWDlDY1NycHBsNGFBNTYydXZrOFI3ekhM?=
 =?utf-8?B?clQ4Y09zWW1DOTNyU0M0M0N5QjJUR01KNTE2Z01pbkg1MmpWVlltajBacElw?=
 =?utf-8?B?Q20vVXpCVmg5NTJpRGxJS3VWcklCSHV4NWtpQXBhbUM3SDNvRGJqNDlmSmNv?=
 =?utf-8?B?cEpFMkczRHR4M3p2WHRwb21SaDN3R21wQ3RWVTBJOHdpSmlERk80QTlERXc0?=
 =?utf-8?B?Qk52cnRlVWNHMWRDQ0N5SFcrcktOZTRYNWxwMzkwMnFncFFjKzVnWVZscWF0?=
 =?utf-8?B?amd2T2tSemcvY0lzVDVjYjJRUkxqeWdNVGlkTHUvWE45Z0FscHN2ZTJjeUZU?=
 =?utf-8?B?NElLaGVRSnNZc3pjYzIwTU5FZnJBc2dKdzJJYzF2ODR6RURkWkhKSVpuanZH?=
 =?utf-8?B?L09LK05NalZUYXBsSnBSUDZ1MDFxRXZRTlNlUmp4eEJxUFdnVyt5Y2x4YmNo?=
 =?utf-8?B?TnNxZHZNeEpDVWRCVjVsUmI3MEVhWi9NTWhsdTNyS1RodWJZNUpBTCt6clM3?=
 =?utf-8?B?dUpCdFk0ajBQU3FXZ0czU3lDRzFwYXhNMGZkQTJjYitBWnNzMUR1WVVTL3FU?=
 =?utf-8?B?bDFxZnNXTTRNa1lVVjhMaHdjYWcyRTVpUGlmS0NGejNFNFdpOUNGR3BCNW9n?=
 =?utf-8?B?Uzd3RW1TUEEvQ3JiU0VYWWlLYzB3V055SlJaMUhXNGtya0FNNXArZzd3NnFw?=
 =?utf-8?B?WTRaSUFQVTA0dlBBMUZnV3dPZXMvbm5sdUVlUmxoaTRIcWZEMk9Ra201WWZC?=
 =?utf-8?B?cDJwN0QyQk8xSGJJcXBVNWYxUzBFS3o1ZERpakVSWmxQS3EvYkp3QTIvY2Qz?=
 =?utf-8?B?UVRXeGVPQmJUdXpaWWRDSEhNamNHNHJVakhhTHB5MGF6ZXM1RTNhalYyTWFD?=
 =?utf-8?B?bjF2SFRpdDdZbmRKRUN2R2tadEg2TEZMdi81T3BzWk5kTW1CRWpMVUp6cjVs?=
 =?utf-8?B?Q2tsTVIyMDJsUm82Tlovc0podDFQR1VqUWhSTHFZakl6a0xXK3Rnb3JDZThn?=
 =?utf-8?B?THlqNy9NcG1TSUNDQU4yUGcrUWp4bTh1UmU2aU51SnRqYUxrZjhiUkZZZ0ha?=
 =?utf-8?B?d1ptUmlOZHRHV2JlNFlQZSt4dm10R0JwdVZ5Q1Z5TUZyOXdkVmxIUVhvLzNn?=
 =?utf-8?B?cytsWlltbXBrMkFUSWEvVXlTYVFUSEpkMFpVRnlrUlBzRnh1TkZzMTZDS24y?=
 =?utf-8?B?YWs2SkRpd0Ixb2xwb3JqZ3pPdUM0MGJCZHFnd1orVlFOSjd3NUdCV3ZsZUY1?=
 =?utf-8?B?blhrTE1FTWR5ZHNQVktVQXRHdVRidVVpc1pHSEJaN3VhVjF3Ly9mbEpqZGE5?=
 =?utf-8?Q?CdO9CcHAGhoHpFYK055MDsLRali00CmSefJQuVh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbbde03-3e55-4758-4ef5-08d92a99c2e6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 16:23:33.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlTCTx7yNDcJJgbf836gwaGHOtghZNHTm6pOldQTYQ3b9eKAQ8lj6bTmVQ21SK/bdcC4NA159cxzyE8hxnhF8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 08.06.2021 18:19, Andrew Cooper wrote:
> xen-cpuid does print out the list of special features, and this is helpful to
> keep.
> 
> Fixes: ba6950fb070 ("x86/cpuid: Drop special_features[]")
> Reported-by: Jan Beulich <JBeulich@suse.com>
> Reported-by: Sander Eikelenboom <linux@eikelenboom.it>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


