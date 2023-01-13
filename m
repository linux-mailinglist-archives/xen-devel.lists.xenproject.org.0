Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7012669281
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476904.739334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGG5G-00032G-Vn; Fri, 13 Jan 2023 09:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476904.739334; Fri, 13 Jan 2023 09:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGG5G-00030i-Sz; Fri, 13 Jan 2023 09:10:46 +0000
Received: by outflank-mailman (input) for mailman id 476904;
 Fri, 13 Jan 2023 09:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGG5F-00030a-G0
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:10:45 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2086.outbound.protection.outlook.com [40.107.241.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28b545e1-9322-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:10:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 09:10:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:10:41 +0000
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
X-Inumbo-ID: 28b545e1-9322-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKLQI6nQJU9ELfeMLlKuGkgHq0aOumlQKZ/SVt+oVi+Jg6iGTrk5xjHpmeyX0kMkqVR0S9cl1TRqhWhoTAY3SHI3wofe4k+wr+7wkso1qBdIKkju5Q9d2Cm88OqU31AipNSvqvbnmwuz5/tSzHD70onqEg/g2/QVm7WKo266pzYLMua0Hx286SSq6EiUe028jYX3W4y0swlzQsMRLy/LzYHa86+OBZ/HSBD3pC3l4hwDn0DcWQ2G0ZZIVC+RAtgWDl0rqF9LLEinqrEbvjFjPeBbTsqJ9ZqIgTgaPhIL/nNki8O8cAff+4nzu6BhtAvHyH6wzT2et8BJSA2X5gemzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEpZ5SzWvp8KWJ5Cil7cQwtmvjg2LQtZa/sb2AiU7zQ=;
 b=NhD8RoYuxXj7DsFGRgqC+AVuLkEQxYfHxbDWY4uJFuNLsEHSTWjbaPx9RBpK4cgej7HMwFFVqOvkHBPDY7kBRGxtZXKD9A0njaj3tdJSiKZX05ubTdGtv4Yn5H4DHzb/nbzl00Aq8nl67kD0SR0uI3oSrSLukTQ1pgoyAv1PWur0WD3Rh0SM4byLosCPHQ5M47N5m5BRSSC+q65ZJoNamcLAkJRwrgXtPrz2vqQMZOHk9yNqFupxSP0nvZ9J9LZq0EzliE8N0igdmIE0epNpX9UQhVINTAuj+j1gLYcFLR1B6ZMbWWzgB6f32tMONCWHgrZq6p92E/s2V105y1I1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEpZ5SzWvp8KWJ5Cil7cQwtmvjg2LQtZa/sb2AiU7zQ=;
 b=Wy5liNjL5lg9ONxR46u6ajEaXY8UsR1z7nEiFEobovRznBMx8jZp45NFAr3TjnZ0jGu8tZr2R9nlVOBfcSniayW+05VgyuH6BgSJXiMUQtFf5unYtqq7sc8SkOawMy6/rziACO3CkEWcPNJn1HM49SgG70ANso/PgUJWV9HUh1qbS19OKH1mtOqTsJxjAoPtxPs5whcVr7YxjZs9RDm5UcfXKs3w/j71QyOZzbgJoXMvW/VaLLtqjyFqKISLdNeGZSNVwsngf6mS+Zcqrg1QpE4dSoy/lbhSNkDP2tYs/BU05G/EIwdRpa+ENXHDDjL3F5EKXklYAOGzYH0Ncx1UwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07b71b77-6979-6bc6-508f-4041a978392c@suse.com>
Date: Fri, 13 Jan 2023 10:10:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] x86/iommu: call pi_update_irte through an
 hvm_function callback
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-7-burzalodowa@gmail.com>
 <aa20eb4d-7b18-9bbf-718f-2fe5fa896713@suse.com>
 <04e5b744-bb61-b3d1-7d60-97bb710f7584@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <04e5b744-bb61-b3d1-7d60-97bb710f7584@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d6bbbe-8dea-4fa1-2872-08daf5460b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NBPRFLb6ofUDjoYuIW6maiX3pd8nuVu7dTQc3dnWXXMLAPT8PNSlOT8htcNGYDoMN1lTg5wlkjFoxOkWfLhOsMMXRDGSfGGoOtjE0q5M7e/D8UNAAff/HNu0cUfWs90Mzy74KxVlgb+43CwRLUPNfT4dxXIvldowy9wxGs+ncceOQ9QvbqS5HLBX8IfLDyLTYsAc0TW8KciB+/ZLzQqOKEP+jXXWGsTHs3EW9bVZTIJEGk9brZeRxmiHrud/13VcxBf+v/Ne6comDBgP3nUHRL0nMSW+BOWMyPGPyVyqEl99LoATnseH5JrybwUFf5436TYi27rmTn3f/MTXfyscit/ObGD2ocYUQKdNIWqveS8nPvjLdmJhCtO7U9EbKldHj4Lvy8swrbZrPYaMMF1Xu5PL55sOp+LjsSXhTnH2rquj5F2qD2nYRk2Dxh70zVu0CO14uN+9J48fkaaKsnOKVVq4ZW4KsXSuuEPhslVX9lKI69FaHYTiPcVMkRZKrUsOFasl9Y70dWNcrjpnIyckHS4G+9WrBx90q8L/x99480HSVr1s9y/0K5Dtapa684UHc03gA1+/BiyU7n0sFSZwX0f49mArBVhvQ/y2FEVDDaqnnr+BYy0ZY9gBL9+tfmbNajf3O1Vp/8g31DDI7UaI0PtXOEvEFmoMLy/5UYCUwwz1/HIbbozwmMwj8S+c8iCeyOg1tVh+ZeW4bp8xOJsFTp6rswwCKNR1bJJvlj62A5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(5660300002)(4744005)(316002)(36756003)(54906003)(2906002)(2616005)(38100700002)(83380400001)(6486002)(26005)(86362001)(31696002)(53546011)(6506007)(6512007)(186003)(478600001)(66476007)(66946007)(66556008)(31686004)(8936002)(4326008)(6916009)(8676002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHNXSVVsd2kzNUFsSDlpN0hhaG5zQW5LcTdkbnZzMDhXcWV3QkpWVHBYVGxv?=
 =?utf-8?B?N2Nxc0J5ckdIK1BGaWJYY1g2S1NPKzV5UlZUTzFnSHpyaG92czZ1MlB0cEtt?=
 =?utf-8?B?QXNsbHpQUWVDeGxVVFZIazR5alpSSVBjUnB6eVFYQlViUmVXcmNXeFBCcVh1?=
 =?utf-8?B?RnFiS0pnMjBGUERKZDYwSlV3bWdQS3lFYW80LzdxODJpVmlWc3ZUbHA1OUtC?=
 =?utf-8?B?RWtPZDdLeTRXRUhOTlF2THdSSStvdTVGRTRaLy9ybU5JQTRGODdQQ2xJOGFz?=
 =?utf-8?B?T0x4MVk0MDFQeXBROGpYNVd1MFgvd1RUUW1hUVRYSzZ6aUZQeVdCdjZ4S3VW?=
 =?utf-8?B?YjFqZHRXcml6ZmN6ZGladnV0WVVvQUJCaTkyRis0ZllOUlNCbHhvb2c0bzho?=
 =?utf-8?B?SVU1aEphcUk3UGtLTWZNS1B1N3NmK2lCWWY3ejBjczFVYkxnRUhZTHArVlFx?=
 =?utf-8?B?aC8rTitLbTlSV1FFYWV6QzBXNklHZ2N5ekxpVWpFYWk5dEZENVEyVU1KVFpw?=
 =?utf-8?B?bytlQ2dPWWFxT3dhcFh4aWMzYTZrb2lZWWpMbWdYTTVsK0ptMEx3QS9uMXpP?=
 =?utf-8?B?cGhnRWY2OFVra2JQQmlyOWQ2NTZMNUwyREFYMit2OXBtZ01idFgyNkFLNm44?=
 =?utf-8?B?ZHlZQ0wrUFY2bitlUDJzbzAwZStsV0xQQnhYS1NXRy92aEJCSVl0TWFEUEk5?=
 =?utf-8?B?ejZiaG1UMnZXUzUySlNsWUFWbFlYbSs0a2tjVHF1d01wWENJRWR0WjEyQjJa?=
 =?utf-8?B?cnR3OW00VnpyZSs4QnVvekpuVDVacFFhRTFvRXFBWDE2NW9tN3VxUHpNWFNr?=
 =?utf-8?B?L3I4RGwzd3lBcnZrZnQ3Yk9vbURib0w5L2RhcS90bG9xc3IwVHkrTDdDQ1M2?=
 =?utf-8?B?ZklnOUdkK3ArNWRkaDd0MHpaRGtCMXlMK0JFWGVpTDlQWTdEUGdmeitNSUY5?=
 =?utf-8?B?ZHZzcDhHLzF6L1dqZWRPelh4Z3BJem90OXlTclJ1OXhCNzhIWEFNckc2bWNu?=
 =?utf-8?B?bVQ5SUtxc3Y4N0plUXZ5bWlZTGF3OTFKL2tVTzB6eHNxcVNqeWhkUmxEMGFF?=
 =?utf-8?B?YWFuenFyOHRaWVhvSjhqUVJrcDR6Ymk1K0FnTVpTeFBXUVpOZVRFZkNoRzdS?=
 =?utf-8?B?VW1MaHZPdlZsKyswSE5MaFhoY1FEcTBlNVFHMm5QeGtlVll0TzNYZElQRFhr?=
 =?utf-8?B?WFRRbTEwejA5QlFhaUxyblAwRG9oWnlFdTF1RGROZjlVejdSRE9Tb0dDc3ow?=
 =?utf-8?B?bmdvak9Ta29rQ2E2TEgyZHdmS2FRa3VzUlBMWjZDTEgxT3RLSkxML1dMakZX?=
 =?utf-8?B?NEZYSEVrVTdobGRpcW1qdmFLTEtGUDErckN0SXFNc1BRUUlPWXF0dHpzWEdS?=
 =?utf-8?B?ei9NS1BRamtmalZURFRUMVU0aWU3eWVxSkNaZ28zYUJBUnpNVDhwcHpKVVhJ?=
 =?utf-8?B?ZHpGOHorTXF1TkRLeGxuYVlCU0tvWC9QTlJobjFhcWNjNFlmUnltbVRhblRp?=
 =?utf-8?B?VER4OTdpYlBUdVowSVlQWmpubGZ6WVB3NmNKYmtBV0dvVWhnVW5ZSTd0Smsz?=
 =?utf-8?B?eFZXSTQ5V2lxdGNPcGovTUQzK3BNK1Z6djJGbWNYdWduTkVYZXUzWXlUSjRN?=
 =?utf-8?B?UnRTSjlYNElqVnlycExTbnZpaDkwejliWEdDckxYZGh3SHdyRUw5N3huLzhB?=
 =?utf-8?B?d2FMOXVzNGIvTGs5SnRYdkgya2JhbkRmR2tBbkJXQzBucVltSzh1Y2RWMlRy?=
 =?utf-8?B?T21vMGdNcTlBSy9Rc0JYUVlvTkhPQzl1RlNlQlRaZnlwcFBnSlBDaHo0aUNz?=
 =?utf-8?B?YTdyWVQ0MDJHb0tHOHhlbGJMSEl1R1o0UzhzZWdFSUU1MnM5Y3hWUExJKzlj?=
 =?utf-8?B?RDREOTFMWGQzeE9Fak8zUjJPK01vdDMvTE9rSXZjS1RmN3Y0UWErQUo0b0gy?=
 =?utf-8?B?VUlQVzBPRkgzdkJGL3RPbS8xUXFreW4wMnZ1MVkwZ2E1RDhGWmhYSUM1bWZU?=
 =?utf-8?B?VW5pZlA3a09HaE4rZWdMc1B4U3JBcHlLaVZBUTg2bFhkTVBLbEZ1U0VyT0Rm?=
 =?utf-8?B?VWtJVWozSDRJcHlLUno5T2pQWHloZHRJcUNXUTZmeGI5TTVqZFZ0SVhtcUJt?=
 =?utf-8?Q?TOPOwJM0VO4NMoKqc42tzuRqh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d6bbbe-8dea-4fa1-2872-08daf5460b63
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:10:41.5628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIjdgTy8ky4RU2G2clgdBkr6ewoSUORa9M6BcZi/BwpMD6d39bq3nje03QXDiO+KMhRr8IXkB8/ADoXuSg4dWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7982

On 13.01.2023 08:30, Xenia Ragiadakou wrote:
> On 1/12/23 14:16, Jan Beulich wrote:
>> On 04.01.2023 09:45, Xenia Ragiadakou wrote:
>>> @@ -250,6 +252,9 @@ struct hvm_function_table {
>>>           /* Architecture function to setup TSC scaling ratio */
>>>           void (*setup)(struct vcpu *v);
>>>       } tsc_scaling;
>>> +
>>> +    int (*pi_update_irte)(const struct vcpu *v,
>>> +                          const struct pirq *pirq, uint8_t gvec);
>>>   };
>>
>> Please can this be moved higher up, e.g. next to .
> 
> Right after handle_eoi would be ok?

Yes. I'm sorry for sending out the earlier mail without completing the
sentence.

Jan

