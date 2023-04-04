Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7116D59C9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 09:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517672.803373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjbEk-0003UQ-KE; Tue, 04 Apr 2023 07:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517672.803373; Tue, 04 Apr 2023 07:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjbEk-0003SZ-GT; Tue, 04 Apr 2023 07:37:50 +0000
Received: by outflank-mailman (input) for mailman id 517672;
 Tue, 04 Apr 2023 07:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjbEi-0003SQ-C5
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 07:37:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9828afdf-d2bb-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 09:37:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9099.eurprd04.prod.outlook.com (2603:10a6:10:2f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 07:37:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 07:37:44 +0000
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
X-Inumbo-ID: 9828afdf-d2bb-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyQ2v5VCAOBCG5+IGWoKhxOJ1219jOEz/0JvInID30pnHeWRk6DDpnJqTGSBY3pFcfmQK7K7GN9cnIp8liFKoQbYON1gq1xonS4pS3T7k/g3HotSPA+7lSj1vtMjafTDCDdXjTIDruMVy/K0CIMZI7w5E5pobGk269SP0Qr3ptoLYxS6JAKfP9O6QQBhkDBy6w8r3YPlJHEssPJA4kPrWVD6TNGK1NuyaJyB1qPPK3hp02+GV0P4L9bpgpWxjFSDF55uNcxm2zMbmVWlv6+4NCh19gHyIXWPj8FK3jwYoVZXRnF02ptq5CjOmuvvli6zcSTa9nye5cRWfmCZGDIB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9iXgmTsj+0Rxvl5Ewhk+C1qP1W68DSWKVggTNGwczk=;
 b=b2moBjgtdKWmeSf+pGQNi7a9hyOV/1n8s+Irq9Suj4upp2azGhTyG3i1AQsdPao4B6xP+U0G7qg37KnUDkZSDEep6w9/QTivXTwY2HHOYM7d+vMu6ZzgZP+5Fusm6kPFMXGoIG8wkTAQJSpzd2yc96VjYaiWe0SQ4HU72i/8O85vOKmne4ClRdGqmSP5pCSj0Uf57dyjBLXe9eUYqQUIRA2y/vAECrX+JWfM07ciXwjSqkNpSDJMctzg4sOKTbr43yPI0iJWxZjw9sEBlXLAcgdwblIUqtEr3aTOlk38dOvEjMXGLdwj/rft/T79YMD4uMKVN9JxYRTSBXBWK3VIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9iXgmTsj+0Rxvl5Ewhk+C1qP1W68DSWKVggTNGwczk=;
 b=2ZJCzns286owsxMv5qGWrWcrScvHmuVa8qEzbNc7bAAFyANOw6jyWLtROjFHo1JvrL5IgqaxOkeZ9k65Bzjjdgzj4hl1M0FjHNI0A8/UkHSnvBr7jdExkeM6xhppfLEj8KfEO9JyOtdJMUBPCepEZRM1HGsJLSprM+1KU6AKEY37h8BZrYsy6E+9nN7VkxFNVNEU3hGujdg4q1w1iyMwCmpFpkYPG+Azmin65Ca87+4IaOKa9ygv0G25qG+wog+G1E+3rb5R+okROP9LQ7fdlLLTR4XyXr8+XB5NGBTJryD4wajbUcmIq7CskVihZCYwzckoqpsEVUQQKuAm1BP0tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ab50964-bf29-b580-7ef6-78aa0e6a7a7f@suse.com>
Date: Tue, 4 Apr 2023 09:37:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] cmdline: document "extra_guest_irqs" upper bound
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d4fc10a3-abe7-1298-daac-00c96147c7a5@suse.com>
 <0e165632-938d-596b-3087-75da66641d85@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0e165632-938d-596b-3087-75da66641d85@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3bb805-3ab5-4dbb-82b3-08db34df7a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nBRF3TZYN6rv0oEUEaEKC7i7sRmzECA3RfX76xp6QWSSR7TszHtdXwgbHV23zcStLqhYFiSPiuH2cHHmR6MDQa4gIXi1YoRcG4iaGsJVhQ8zi6hRnu9wP5QkUhHn/9zEj7/LeyQLsN9cpmlEMlg1xakp/5TQRu0saUIzcmrjJGcfs3K0IDGlt7L2cfXMPFYdZmoetfO+8Ir/LlkRd0npQdswmhNCGFJJ87Ct4ecQT65zlV+dteLCp/w0m9oTUl3ajsmjK9pb2AjACt3Xj4qwaJRFebix2qKtT2odYvQUc/K8skG2rw1rGHVUs8TtwBWR/DURr46MQIph3qN/msiYYnMU1T1J0dNzA4/xIzgqaltVM6au4Te9Q8CNa7xatx80bUXYfHITmLk6Gjtmf3ooNeUI/bhIdXuRWBPoaoN6W4P18L4ow66vAmsP163smxvG6ugnzmFgEHxKftzLuaalPXVQy1kuNDaPHM7CgBKhyqQA+mZ0Ndi/YZajAqCsgJg2h6HE9B/Vsz5+ABWxtjXG8lyoym65ET/qO+0EnZ9BYHA4VWDdjBt+ZkSHrtiI7T6pjSkHkIE4JfIFLBpKwIWhK7pLByWiaPOkTiGrci/tCGYMxb6q5woD7LLyoyawxzStw/IWVkUu/R+MhAqxXH+LKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199021)(5660300002)(31686004)(316002)(2906002)(54906003)(41300700001)(8936002)(186003)(478600001)(6916009)(8676002)(4326008)(66946007)(66476007)(66556008)(4744005)(6486002)(53546011)(6512007)(26005)(6506007)(2616005)(83380400001)(36756003)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0hET3BCZEFWaGhFL21XYkxTcU1EUXBYUGlTNmkxY3dFYmdFRWE2d2ZnTmR4?=
 =?utf-8?B?MTFQU0ZJKzZxVG5jK2hZNGQ3ampvcmFxcFVlTkdPaTVNeVNKaGlsS1hjRmRI?=
 =?utf-8?B?U2tkZHNPT1Z6N3VDVkhhY3UxZ2xyN2VhNnRSY1hqNGZyL1M0MXAzTVpwL2NC?=
 =?utf-8?B?UWhLOWZTc2UvTXpDbjN0YmsrcDVsQVdmSWpyNmJyMVB2MjlPdktoTXNwY2o3?=
 =?utf-8?B?YWcyWThtSzlVdE1NY2lxaDBkSFQ1TnltU0kzUHBUaytNc2JEdTIvSXpkczR6?=
 =?utf-8?B?a3BDemYvVit1dzNkYVRWWkJFZ0NBQzE2a3ZGT2lBMVJINHNxT1JoRzVqbTBY?=
 =?utf-8?B?TktIRWJ6K2JYNkFRR1RIRDVDNkZIVjY5aC9pNG84R2ttUnlaRldYYUFqZklO?=
 =?utf-8?B?Q3pocDF2NFhGbitTME5Ga0RESEI1YWJqSlBkY29abjdkS0tSV2RFUm1oQjdl?=
 =?utf-8?B?Rzd3N055eCtvYjY4RXZTR0JPeTZsWGNQTnhXK0locmZmQlErclgxRjBHblJL?=
 =?utf-8?B?OHc0RnFhQzVLLzVkTTlDQnZpL3N5Wk9RZVhnZEpvK01jeVYyTFFlRnRjMGJK?=
 =?utf-8?B?UGNCaUIrV0x6WXp3SVF4ZTUreGlvVUhnM2luaVhFRFdtT2MxWmQ3RTJUdUM2?=
 =?utf-8?B?dHFiM3BHY3ZObzlwYTFPZUtaVEt1dy9WUzRvclhsWlZYUkVaeDV6UzZvdmRE?=
 =?utf-8?B?RUtYRlRKUWdxYTVRdkJGRU1SK2xGNjZSdlZucmtXMXRXTkNyMk1NcUFmMmc0?=
 =?utf-8?B?anp6Ui9SNUZSV0FOSUQvc054djlqOGFlMVpYUEdMZy9uL2cyUDJaR2xURGVF?=
 =?utf-8?B?SWpMczlnMW53OVZoY3RFOGtDTFhCSDRUcVhGeUxReUV0SVRGNnNhWFErVHZX?=
 =?utf-8?B?VGxheTRvTjdIMkRlSTIrMEFZMWhGa045UWNHcDhCU0tnMTVONGpmckwzejdU?=
 =?utf-8?B?Zys4VXRCS2FrL3h0a0dENVprQnRwOUtyRnJGaktEK3lJVTk1RzFrZjJGd3h1?=
 =?utf-8?B?bjhxZ2tOeTJDVVlJZWNnUHoveWlQK0Z1dHpTeXhhQkxQTnVnVGdEN2lBWVk0?=
 =?utf-8?B?OTJGaUJDcVRaY2dsK3NFdkM1YXF6cDExUkt0K0dBYXNNTDduL3RYV3ZqYjM3?=
 =?utf-8?B?dGxOYXdaZGVRM0VpdDBaVEM1N1QwOTdESTczKzhZRHoycFBoWmEza1RxVUpU?=
 =?utf-8?B?enA2Tm5oTU5yMkgzS0VncDZYcWl2TjF6OG9kN01XNmlHMFpnNncxcG9RYVBB?=
 =?utf-8?B?UXp4UHhadGk2bkFSNGpwcUVBV3FZamxqWEhCS2tJZVpPK0RyL29WOG9jYzhP?=
 =?utf-8?B?dWFHYWl1Z2FWTHYrdkxuRjhBUVpPVWp5OGU4ODFNTjcxVDhXY3FaSnZ5YTcr?=
 =?utf-8?B?QUdoV0dyMmpXNFkyNmRya282VlhQTDdDQ1NTbGJRVk9VekdiNE1WQXUrNU0r?=
 =?utf-8?B?Y3VEVWlTaWFTVVEwRkpFK1Y3cTJaclRLdzdDa2ZzdGNEZ1pTeTBqaGxSSldB?=
 =?utf-8?B?QjdzU0VlZFNzbW05d3lXNXgxUk9QN3VqL2JhTEVjUkM2VkE4dnpyMGc1UEV6?=
 =?utf-8?B?SHBydXh6Yld4RExMckVnQlRLUCtxUC9oalBiR3RDKzMvTXdCTGlpenFYeDN0?=
 =?utf-8?B?eGMxT0o2VDVTVjhDM1U4WWtqU0oxczZPY1pRNmpVQmxuR240QnpLQnZnbGRs?=
 =?utf-8?B?YTBPVUZPeXYvZ3VESXAyaC9IMElBRCt2V3czV0hqWHRHdkg4SlRKVGsyMjRm?=
 =?utf-8?B?QU5YM0xZNEROWmY3Z1A5cGx4UklWcjlSL016VmRIQ0hVR1h1N0QzT3VwSkNm?=
 =?utf-8?B?RHJzZDYwVHNzOCtTeGJNSExlM3R5ajYwellodW5Db3hNeUxiWHBnU2ZPYk9E?=
 =?utf-8?B?bzBHUUIzb01XelY5YXozN3VnYlVqS0JvR1lZZ2EwNzBjMU5LcENId3RXaGgr?=
 =?utf-8?B?UTlsbS93bjNRNlRtdTdkeWpvaGw5SWdaSzJzSnh1RFovTmg1K2EvYUE3bGh0?=
 =?utf-8?B?a0JHT0t2L0hsOG9zVGVYSDVQMHhZMzQ4YTRVWUIvSWJXMGZJdzRKUjJKL25V?=
 =?utf-8?B?RTdyU3gvUlE1OU9GVnZDamhldDlUdnBoMVRsaG94aHpZTGFEOVA4WCtJeVNk?=
 =?utf-8?Q?Kr3fSIh6sOoQtRcHHbTVVZ571?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3bb805-3ab5-4dbb-82b3-08db34df7a97
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 07:37:44.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWpUQGb+Gs1qMsDd5LTCGitg9nqJSA2jARTRPKXonESYUPLkQDDomKgMQTAl7JtvrJD1st4FCdfVoht0FGky3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9099

On 04.04.2023 09:09, Andrew Cooper wrote:
> On 04/04/2023 7:46 am, Jan Beulich wrote:
>> PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
>> more than 32k pIRQ-s can be used by a domain. Document this upper bound.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, but because of the below I guess I'll make a v2.

>> ---
>> I was uncertain about also introducing a bounds check in code: We don't
>> check for bogus / abusive values elsewhere either.
> 
> Normally not, but in this case I suspect it's worth it.  Without a
> bounds check, don't we risk wandering off the page?

Indeed we do; in debug builds we hit assertions.

Jan

