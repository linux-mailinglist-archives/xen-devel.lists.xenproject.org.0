Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF49652F23
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 11:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467714.726751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7w0K-0000Zl-OB; Wed, 21 Dec 2022 10:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467714.726751; Wed, 21 Dec 2022 10:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7w0K-0000WH-Ju; Wed, 21 Dec 2022 10:07:16 +0000
Received: by outflank-mailman (input) for mailman id 467714;
 Wed, 21 Dec 2022 10:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7w0J-0000W9-C9
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 10:07:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dee0194-8117-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 11:07:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 10:07:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 10:07:12 +0000
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
X-Inumbo-ID: 3dee0194-8117-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjlMFagd1ROzJDsDCF9OMSisqYf8H3LIh2UfWsODBmSoUymSSOaEzZx0IB2Rtqq6vk4CLYnsPlQVDVVeXyyagMD/C67jT2uViTOPmp5xBH5jfbvmROxPDEoKDsLYzD/FqwiMpUOHdUXbHFGsxDsvhMmxXPXK672yapzljRO/HP24HXr0Auw5V/PtVgOsxA8bP3ptpKJIGhPUf59f0/147WKwN3N+8gvuFA4RwioWdZ0DnccuvqaZOVj+MD3gQwl/BPCtkCfh88Vg04vnFPnuWwEhE3nnvtu0zo2bF9SwC335K6W6bStp3xMAOkZ7xfDrBoV4RiIC7GDlv/doPwJgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hExBrsUCnDw8aWVDK/TAd380zaLaiYIrQtzjXcnytYs=;
 b=BHunngRvmGDWDDPGUo3TYPqoegoAb6lkaPCdjAF08nPY1ipD0mFxPZWq8ExrGiqYbsWCcP8k9YBheluIyTW2bktAw+5ZwuVMGUHq/y8aLT1whgbhuH+zNhcF5l49jV72WJ8T51vz+H4hMPQ0A3lcwkhHuwAfjybbeoxKdbAgDBK/OH6v0lxPJJEqGiBCz1nOaEvu7J/x8wQPVpiPtlp1XyG0PX32KLsLvHeG2Oh27dqeeJOVbQaKY1Q6KaZ8Hpa9ia4chl5+wEF/u/0nKLgt507Pi4T6PPyHqK85qT5zPE+ac5FD2TaRRayK8PKqEjF7DW8FVtmNs335sFrOSo0AJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hExBrsUCnDw8aWVDK/TAd380zaLaiYIrQtzjXcnytYs=;
 b=dmOvQyxJ4uLkmSzbeVgIISCkqgRkHAbDLEPN/q62kDcJVEc93kA98nTKkDpAYLZEo8Sd1w7jLlW3D1MT77q7rZMu0WtafSHogxDt3MQWryhTEx6uz+4krqW7iSze8wUL//EFlVf8HDtVqLHzqAaD6ekLqSn1EO8jWOg0v58xabLH7axqMS2jcY4kfUUCCJuMh9vYagZs3Fqm51HymtlMeqvG5W6MNEstxm72+khoPwtrGmIt6Rb2EtzWXGsytK4F0+seJEhG9jlV0oi9xS0dHh9NW1ukp75ohO/qK/n/Oa+F9B/HzHY1oyDb/AmOtVefZ/ciXfUkWJW2WAeXWaAKbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c20633b-3f04-ad94-282c-3b0987f03281@suse.com>
Date: Wed, 21 Dec 2022 11:07:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 4/7] x86/acpi: separate AMD-Vi and VT-d specific functions
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-5-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219063456.2017996-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5c0978-3cab-498e-55b5-08dae33b20d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DNMkky/XnBDWKQxrXfPmijpaF5P5dDdTh0S+HWJDWh5BUeOnLaJYzzLRR28dFeJDC9Ye1K8OWIhG7UaVNewb7L2L6Fq27SR+HcRitLH7Qndcx9cMhT2oxLJP90pX0Qmqe2iYEdX8l6NU/+txd32iANjLAl7X55GFm5zJShV9Y3Y3J4yXqIjBK+NfnwbM713zJdrqu7cR0/QQM4gOGS5Nfb2G3C3NDiUAz4s6Sg/D1spnkumwgjvy7+stLNCh1U6RoGmeYdSoY/i6MEA/m0V2m7RXjHPtTYoY1W1yjljh7GYj7JrlNxw3edn/Rh3h4+Vc0NtmL+O6Yn1AZq8IZAEWlbTP/vge5Y5bjxYmDCTkrjlxbhBGF6F5Q1Q9JRC2xa8WzWnJqsRGO+q+UYkd0LHH1f9GmSX7oOWF8RPO72tiHFjj4PtYKbmVdcPPjLqKgvb/IUBxx21CFUhRA81fdDW3uEgChE8IgOSUr9jjg/7G3L4d8yBP41HKMUL7xhcL5yZVFkigoyEhFaaa8RwpWvvlZ/iqjiH1D9sEsMp+odNA8ytu7dRTbcSZJ7huvlZZdsfUZO+V0WtrZk+v4cu4qLq4Y+GkDn4/5W0QOyRv/F1vp0mEh2tRa6ZzkXLSoV2nvXwMStu/63sOdG2/13oNOwXil61DLGbMqIUqfh5kQsutk7aUCQOAQ5u38TXwFnqeKEUSnTo9lSUDI9emI3XPHVzOUzYomQ+SQmZ8GkfuDKr8vRE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199015)(2616005)(38100700002)(2906002)(86362001)(54906003)(478600001)(36756003)(6486002)(316002)(31696002)(26005)(186003)(5660300002)(31686004)(8936002)(6512007)(4326008)(8676002)(66946007)(41300700001)(66556008)(66476007)(53546011)(83380400001)(6916009)(4744005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1RvcGNWbXZ3NllJZnRZRWJIQkVNK2VEdXZCcWlNU2Q1V3lqVWRwbG92U09Q?=
 =?utf-8?B?RUlLeXREUTZ5TGdwMmtxRThpcE01TkNPVzVsTVZGRjZ6TGVzRHRocHRsVGla?=
 =?utf-8?B?NlhWYlBwcVJQdDd6SUVKWHdTTEdxR2xhTlkrTEZtNUp4V2laeHlodUwwdXdG?=
 =?utf-8?B?dElFanl5YlkyNG1OTFRlN3FGc2FRTDQwVXBNa3RTTVNFai9HN296SUpyNDI4?=
 =?utf-8?B?MW9OV2gzVnBLQmJCcVk5VWhTNk9NZUR2bkp5ODJwdC9rcmRldTBOSit0Sit5?=
 =?utf-8?B?Z2xXRHk0bVovMk9KVkNWbHc1T3BaWk1XeHF4WVRsbUtGckxOSk1ZMDhVSU43?=
 =?utf-8?B?bzdqeWZYSFhrMUlyUlRSUEh3SUdZVVdXb1ZFcDl0U216dktNMHdMek9HdnM4?=
 =?utf-8?B?QlJ4a29pK2pHaWxXNFI3QThzV0hoeVI4dWRKekw4ZlY0ZUIwd2YyL2plRHYz?=
 =?utf-8?B?MWNxcHN6WXdYVFN3YWNVc1kyMjhEYml1VWJHSFJTam9RbHZkWEdnbnRkNkFP?=
 =?utf-8?B?ZjhhOXUxcGpMTG5yVWttVXZKZ0NQbWRXd0loWm9WNkdSaW82dzNVZGdjZWtK?=
 =?utf-8?B?ZnBCM2Z4NVlzN0pyZWkrTzhMRWlLRnAwbGhEcmJuMkw4RFNuV3p0Q2o3QW9U?=
 =?utf-8?B?Q3ZFWEJYWGUwN1hwb2hyZkhSMExUbE9HTnY2OVp6ek0vZG53OHRqaXhUUmJh?=
 =?utf-8?B?b1gwWG5sUllNempzenlHL2E0RFArZ0FNeGVzRkduV2dQWC8yeXFHNy8yZWRr?=
 =?utf-8?B?STkrcjByb3RYUitxZ3FvOFhOdlZVUi83eGZ2RjNkM2htblczZWRBMTVtR0JM?=
 =?utf-8?B?bFFwNEtvOVdkMXhFbVRpTDNURTQrQ1RXQmxrUTdwT3FzbFpZSEV3L1NtaGFv?=
 =?utf-8?B?WmdUTlpYTG1aNTA4bFN1cm5WejJ6QWJHQlhlK1lhbXFYUzhhOTZkc0tWdHBR?=
 =?utf-8?B?SFdVWWNNN2lIM0dCWWc2N0VhNENOSmQrVlNnZ0FxcUorUko4alZwNUE0TTNV?=
 =?utf-8?B?RjUralVKUzZDQVhqckVxOFRJYmVOR0pHU0RCUzhrdEFFc3dURXZPb0JvMjFK?=
 =?utf-8?B?eDI2TU9kRnVlS0FaQ043c2pIZksyQmxjYnhVYTdGQ1F0ZlVFQ0UwaXRIYWxW?=
 =?utf-8?B?N3VIb3UzNHJTZEs5Y3hlRmZ4TzI0OU9VVVZyU2FDUE9NazNMd1g1bmdySStk?=
 =?utf-8?B?K3BKN3hVdW41bG1DaXREbWtoZTdmdFB0MGVCZW81VkNxWUpxeUZ3TU51azN6?=
 =?utf-8?B?UUVkaU5Iblo4M1dnYlpSMFhXZjB1cUlnVWlxekZiSDd2MGJRMGZPRHBmTUJV?=
 =?utf-8?B?WnVWaWxGRzhuckhBS3d4Nm81d0w1VHk2allVRWJMMDBmeDJTRTAvQ0RjdURN?=
 =?utf-8?B?OE5mLzE5T3NnNFVDdkJWbHlyVmJ4TzU2bE5va3EyOGI2N3doOXJJeHZhZXFB?=
 =?utf-8?B?V3dibEtMRWxXNFVUS09oeW1lbWIwZlU5YmVZZ2p1bHFoQnJhSXA2eFFBeTh4?=
 =?utf-8?B?ZjdhK1krajJNcDBmSmg3RGY2THc5cWwrY0ViK0lqQVEzQm5CMkJyemlpenRG?=
 =?utf-8?B?Q2dDR3NkbzFEZkVyWkdnMVdlc3VOSjNibVZvclV0R3lLenB0TXB2ZWFuVGZm?=
 =?utf-8?B?azhqN0dYRThxS2hZYTBzUG10Q3FlQ0hRQjJhNUQ5OHZzRkFVbmZrN2plNWRx?=
 =?utf-8?B?Smh4ZFM4TkhYMVZLOWVUbmM0WWxoS2lOa2dlQzBuNU0ybURBcnpaWWlxWjUz?=
 =?utf-8?B?WWg0MzEvRmVMMVpCd01aTkY5c2xZbHdlaWZrNmNmUEc1ekJiaHBmQThKa0c1?=
 =?utf-8?B?WVFFTWNiYWdsd1hlcGlYblE1bTB1N0JDbXF0cmd0eE1SUUl6TndtQlZxWjUw?=
 =?utf-8?B?T05DVGRmUEFqOUE0RVBTMkJyRVV0U1didyt4WEF6bERrZUM0MVk5TjlDNStt?=
 =?utf-8?B?bjJzclJGNHZQMUZsRnh6SytabkVSemVRaW43bDlXVnYra2RYNkg1L2tiaXlz?=
 =?utf-8?B?NC9SeXg0RHRXeXJFYWtBZ1dxREsxSWpkMUNnNVdKbDhNWHQxWEczeWNHbDhE?=
 =?utf-8?B?bDdqZkx5cWpmcnREa3U2UnpqS2hFOVdXVUgvQzRhMjVoNlV1anFhcGtKbVBK?=
 =?utf-8?Q?RVJBxGiKWFszpUCtoWZddncK7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5c0978-3cab-498e-55b5-08dae33b20d8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 10:07:12.3564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZNJ+WSQkufb8ijUKe/Qjzs2kaNswx4vbDemN83DOsdPdqVMT1JjtY7FU12LrjJ3HsUG0Z7fN9yT9SD4WsqPMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173

On 19.12.2022 07:34, Xenia Ragiadakou wrote:
> The functions acpi_dmar_init() and acpi_dmar_zap/reinstate() are
> VT-d specific while the function acpi_ivrs_init() is AMD-Vi specific.
> To eliminate dead code, they need to be guarded under CONFIG_INTEL_VTD
> and CONFIG_AMD_IOMMU, respectively.
> 
> Instead of adding #ifdef guards around the function calls, implement them
> as empty static inline functions.
> 
> Take the opportunity to move the declarations of acpi_dmar_zap/reinstate() to
> the arch specific header.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



