Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0802C5BA6A4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 08:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407795.650416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4ch-0003Rz-H3; Fri, 16 Sep 2022 06:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407795.650416; Fri, 16 Sep 2022 06:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4ch-0003P0-E1; Fri, 16 Sep 2022 06:14:47 +0000
Received: by outflank-mailman (input) for mailman id 407795;
 Fri, 16 Sep 2022 06:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCzl=ZT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oZ4cg-0003Ou-0G
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 06:14:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db5857c4-3586-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 08:14:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 06:14:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 06:14:43 +0000
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
X-Inumbo-ID: db5857c4-3586-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiObvRnxGkQuUTJwxRZpEBiz4cnNx+4bshFR2qE3wrrtGZN1UJ+roEbc/NJ2CgDM9nHOKZr11Z6FW0VgqcgiTHFfm29w2JTR6SW5cybP7SiEdX2cLt7vL1q28IaVLH2pRtQPu5Rdlo3PI1a2YnzQYXd2dL26f0nw0qRxv1lRGKsGy7cRoAtncSz9PbEmSXWhCzX4fXBu5mVk1JGxA0iPDd0CydDlaHx0tQFnU+Ur4HE/OoyQ7JfGXE3flMvBCs44+yk/k6bMMpFL8h7j1iOqsQZs9qMYA0stSEbCv+jMQXWBQ9kTRt+A0my99+lryHcf35tY4493FMcLEY/UetPAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sKk68G2ejVoiK/mjkvH8PMyl0bBzj2NtY3k4lU9CKE=;
 b=oUpsFSaRRHPUvubLxic6WPey/SWBGf/giadhpeSiSt01Rta5kRmHdF4e1drT213Z2YXZVm9QPYosXMOv78lvNi+iyxNEQ34spcYOcma9h5q7n1joAPUkPLNZORZrpDyyfaPUGNlW8HG231AMqLxLbbGjtenjzYRTb1YU8AYwcs/6trYkPAuGGOPfQioyS6KzvlenaKxdTX8HGZXanVylYh5j0FxRXDLjfjsloZjt3tE6Cz4yU/dPfcM1HE0QaPERy7+eaIgOFTWgaeaiaF422oULGingFfe5+yjgVnTJ/bXFLo2XkcAwYy1RMGcwUoMJ8R6RVE3peMYknQVtgxfFoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sKk68G2ejVoiK/mjkvH8PMyl0bBzj2NtY3k4lU9CKE=;
 b=eTaIXQAGJTBa2Hqmk342i6ga0yBi3wpZENJrD6lZrwgfPE0NAmZ/PftfL9PJAZgtG3vhC6sya0Gn4ZswiZBeL1nABJkwe2JGRPmxxdWbG8eepvhQiVxvWx6STJI9ia04Iw8k8EqXJtwyXgGrSC2WRvOoPK4EKFtQO67jQm51uB8dE4hwgatmbC0LtLYz2KZ9TdZ7PlAmEvJU5uvf0jcDbxLCLzeckfm8JBgJx8c31zYFXQymJ8b6aZL9RBgE56xwnwecs3n7OZssf9gRpNrWN/33JbUVgWk5bi6YEi5Q3008+mKNJQ+NL8meY4y+X14LT3KymyvbN/4/dxL2Mm6S9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dce288b9-0609-abdd-6e92-a33bafb47651@suse.com>
Date: Fri, 16 Sep 2022 08:14:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Crash when writing to x86 hardware debug registers
Content-Language: en-US
To: Neil Sikka <neilsikka@gmail.com>
References: <CAHPMNWcL=te17jVOCE5896whZTyeg2bmw_iUR-F6iz53y9bqPA@mail.gmail.com>
 <CAHPMNWc49vW9Hy+7WDHK924J0wG-EOPjoT+wXswqy0qj-uCReQ@mail.gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAHPMNWc49vW9Hy+7WDHK924J0wG-EOPjoT+wXswqy0qj-uCReQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0074.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: fd59252a-26b8-4f26-757c-08da97aabf06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2uci7KxhPS22sfuOsJvf4wL47XoWPgslPLhWKsCjBX3koUksM4exs0Owq77yCeV3SdGUwurf6lOq/WISkPVVVIkv/bApUz71rntTdy7sgFgabCTKtA48Y0+XrVDWClk/EjvudEgrh4ZdmO+4G1Xc1H3MhOI+7YSwcvvN1ztExmMukY1g6hXbBj/LAvDWwmrboB2Zj5rpnZg0lnhd/ulik8bDGt66pcWRFAJcDSkuXdafT0qqUq65HKLzaMovPLDU8aU8gD2pf2Jyk8I5yKdZlY/zlAyODp0Fb1B6RU/N4MO/94TE+2tb46I5BFVrQEzrABIE2F6CMEHTuhSYW/oD6fXvuq9AHQ6n7lBOato8vA2IFwcXO6zHZRNTrPXrn1ssh8Qc/sJIDWbOO3n1XRv5B3Mq7c3aWfBv5LGGqgVMf0ChDiPVxEyQ5yOUkOmTeJA7yPQYFm3B2ZY6MLInW4FlxtnUjYjTC6kD8qAGEiXCeVMT2U9z+sa9gqwqLLdqI0dCUcEwYk0WJ11OHC8JdP3qnWEM4fSjQ9M/i2vqn8VHqd1hl8MEQm3u31hHH6Sg8woQqmD8amcS7Z4mejx2j+4wERos7zzLeIluKVKu4nVlp72Ol20k1YBU8B/ibxnePavCDqe0MIuaMxMK06zxY17MF04hD3GLUYL3EdptEOBqDn5vsVbA/dQKtE70RxcqqlBJMKPjn+jDzf4YQ1evrgS6bdSPMqlBfm22HUiHRh5uuKiUumXWelSq2JNDs+WNTLuqD/E8/lY3JPHQwP6lSxyDc4Dak3eXxnyF9lGc5GbPykM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(6506007)(31686004)(53546011)(31696002)(41300700001)(4326008)(66556008)(66476007)(66946007)(2616005)(2906002)(86362001)(6512007)(6916009)(26005)(316002)(83380400001)(8936002)(36756003)(186003)(5660300002)(38100700002)(8676002)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGZPSEJXQlVjUUhKMVE3QUhqWHVyU09YbFFROGJlT1A1Z2RXQmxnSlMxVzhI?=
 =?utf-8?B?MkRjRlV4Rm1ZaG9wcW1yd2RCbncvaEp2YS9kZmh4RzdyMHhFOWl4aDg0aTJ3?=
 =?utf-8?B?S3ZNWkFZWFdZSUl2M3JYeFJQcnBlMmJ1OVExMG4yODVtZXRhOWNYN2RpWEU3?=
 =?utf-8?B?TTJCbXNWN21BZWEwYnJZYTdCeFNpUHUzWjhZL254eDNFeWtFb21XQy93RFRr?=
 =?utf-8?B?dWtWcHhLTWd3S1htaTdnOGZIbWNvRFFVQTZXR0FRQlFNNnpWZWZ1M3h1R2dv?=
 =?utf-8?B?b1JwMlFZS2plR2pNQVp0TTcxQTVjV0pYY2JEVVgzeVdGZ2FOWEozV2J2Nndw?=
 =?utf-8?B?YXAyb3RTY1FMQnRBKy85Rm96c1VMS2hjVXVFQytxLzlhWStNdDV5dHBIWTNa?=
 =?utf-8?B?QS8xN3F3UDlkc0srMmR0aUR1ZjFwcVJOQ1lFTHNwODRScmpPQUxsZkhWQUF5?=
 =?utf-8?B?MCtCL2REVW1rTjBwS1JrWTZQZjFHQzNMT3gxSmFOSVcxNTZ2M1FheVhNaEc2?=
 =?utf-8?B?MDhDc29HakJrL3FkRHVNU2RLYzB4RnFUdE9Xcm13OU1zcDI3N1BNZEpiSmpa?=
 =?utf-8?B?WTgwbm8zOUN6MDZhdDh1TjU0b1RPbStEMGxTOXhPRExzaWxiUkdvMnNnUG11?=
 =?utf-8?B?U0s0bnpkVGt4Uk50Q1RheHBCdEZKUFBOVENDUlBIRkQzbFgzT1psMUVzVDhu?=
 =?utf-8?B?Wm0rMGo2SmF0MDZud0xoaS9DVkJjZHpXQ25zSW5RVDVhSS8xTHc3U1hRTmxt?=
 =?utf-8?B?TERSclBkWGZaa2ozS3hKcEVMTytHTHhJT2RSWTRlRGhHbGlOaUM1Tyt2Y1o1?=
 =?utf-8?B?M2VseXJhZm9ya3FxS3JRR1lwcmhMZS9HK2RETzZ5S28vck1wZ1pnMXlWUzdx?=
 =?utf-8?B?ODVoc1ZQVUw4MmxsSEhpcUtmZUFueWo2OWNXSXVmM1pEZ29ySEhOUXhGb21D?=
 =?utf-8?B?MGI4UlVuVGkwRzEweXZRU2JZeVU4Y2JFaWQ3d3pGME1DTkRuWjVoMEJndzVk?=
 =?utf-8?B?dXJia21GOFBrb3VIcVNCYWx3Ui8xUDE1QU1jcDRPNjhseXptYU5kUnlJVXZZ?=
 =?utf-8?B?U2tEajNBNTlUTEdJRFVqRmtCRHZNcVM2bUZsMDFTNndVQzk0azhzQy9DZGJJ?=
 =?utf-8?B?Ty92ZjJPdmc3WDAxaFl4Rm9ZZVNGZHViWXd1dER2Nit3SDJYWENaSWxmeWpa?=
 =?utf-8?B?R1BJS1NIbmlyM2FqR00rS2ljdzJGc2JsR1U2QnBDcWo1ZndCREJsNC9oUlpS?=
 =?utf-8?B?eEI1VXE3bUs3UTB5azlVQmxqRlduYVVBa0VjRDRIQ3gvK0VDM21BczRoeGtU?=
 =?utf-8?B?L0tRSFVsRWZJdFBERnd6bkl1a2pWMVdaRUo2RGp5T1NYdEVjZG9nNTBiYUVk?=
 =?utf-8?B?a0EyUnB5bXZ6V0p0Wm9JalJLNWNEaHYxTlgrcW9lZjZOZmMrczNnL0xEQ0Rt?=
 =?utf-8?B?QU0vWkJENTZXMkc3eVNiMi9JQVBEVktPSWZYYWNpRDF4RHZEb0VvclN3UkUz?=
 =?utf-8?B?a0gvOUJ2dmdqYVRXdEFyeXh3bEhVZzFiRjJ4SkhnZzJTbU1UdmNWYTEwbCsv?=
 =?utf-8?B?Z1c2T2lSdlFaVmZlSVl3Q05MTkxHYUtOMXcybzV0a0QrYzBXMWFzR0g1REor?=
 =?utf-8?B?cGZJVFJuMktGdDBmOEpJNEhmV3J6MVB2MHR4WGtvaUlMYnRyYTZwbjVUSzdN?=
 =?utf-8?B?VGdzM1Vhem5hUGEvSHQ3WGlXWnpBdG5vR0F1bTFEL3BpMDduVjJNMkpTVjd2?=
 =?utf-8?B?UFF0aXNZQmwyTm9ORENOZzlVcWVPVGsvOW5zWFNWNEFaRWtJSGtaOFMxYng0?=
 =?utf-8?B?eTR3SFlVS2c0SnN0Q1VrYUlwS3U3cGdMa1JhamxoSGsxUFdHN1B1VVc3RDhC?=
 =?utf-8?B?bE5RQy9kTWpQai9WRk5lUWl1OXNpTVdYZUNydGZXOW1pd1VlZXkvcS94cVBt?=
 =?utf-8?B?akNzQUc4ODVLaXZpYTBEWE5Lc3RrYWlxSE1JZU1FZmZsdkNsblJYdlEwQy9X?=
 =?utf-8?B?aE1IM1RqdkRTeU1TUDZuT1M0VUdEaEJtdkZTdDA0VW1YOGVFTVlSdndwTlcx?=
 =?utf-8?B?eWFhNzU5dHNRbGtZRjZMcjFLc2JzaXZFZnFRMlZXblBYNVc1Skk5dFB4RjNW?=
 =?utf-8?Q?tcK8onCyG3rVpMvhzIql/dEmh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd59252a-26b8-4f26-757c-08da97aabf06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 06:14:43.2702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyfwS0Hxkq+SX0jbEV8xr5ojn+ER1x0ZDrkOHTgIBz6t5Ttdqr1uMiOCx3u7gqy4HsRoIG1QnUaTFKnp0Y/E7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695

On 15.09.2022 22:04, Neil Sikka wrote:
> Update: I rebuilt the hypervisor binary in debug mode and get the following
> output in xl dmesg after the crash.
> 
> (XEN) HVM9 restore: CPU 0
> (XEN) HVM9 restore: PIC 0
> (XEN) HVM9 restore: PIC 1
> (XEN) HVM9 restore: IOAPIC 0
> (XEN) HVM9 restore: LAPIC 0
> (XEN) HVM9 restore: LAPIC_REGS 0
> (XEN) HVM9 restore: PCI_IRQ 0
> (XEN) HVM9 restore: ISA_IRQ 0
> (XEN) HVM9 restore: PCI_LINK 0
> (XEN) HVM9 restore: PIT 0
> (XEN) HVM9 restore: RTC 0
> (XEN) HVM9 restore: HPET 0
> (XEN) HVM9 restore: PMTIMER 0
> (XEN) HVM9 restore: MTRR 0
> (XEN) HVM9 restore: VIRIDIAN_DOMAIN 0
> (XEN) HVM9 restore: CPU_XSAVE 0
> (XEN) HVM9 restore: VIRIDIAN_VCPU 0
> (XEN) HVM9 restore: VMCE_VCPU 0
> (XEN) HVM9 restore: TSC_ADJUST 0
> (XEN) HVM9 restore: CPU_MSR 0
> (XEN) d9: VIRIDIAN MSR_TIME_REF_COUNT: accessed
> (XEN) vmx.c:3295:d9v0 RDMSR 0x00000000 unimplemented

Now that's MSR_P5_MC_ADDR, and hence an issue which Roger did already see
and fix. You will want to update to 4.16.2.

Jan

