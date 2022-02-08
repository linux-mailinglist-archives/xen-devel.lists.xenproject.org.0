Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD24AD48F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:17:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267814.461568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMcV-0002Ws-Kq; Tue, 08 Feb 2022 09:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267814.461568; Tue, 08 Feb 2022 09:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMcV-0002Ud-HO; Tue, 08 Feb 2022 09:17:07 +0000
Received: by outflank-mailman (input) for mailman id 267814;
 Tue, 08 Feb 2022 09:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHMcU-0002UX-7e
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:17:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1a17862-88bf-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:17:05 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-qgKohuLWPSKSfDSy0SZ3XQ-1; Tue, 08 Feb 2022 10:17:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2557.eurprd04.prod.outlook.com (2603:10a6:800:56::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:17:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 09:17:01 +0000
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
X-Inumbo-ID: e1a17862-88bf-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644311824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jO5oujVGxYE8gCO9O1wJxedKAsnpNsZI1EHBIUKEpYU=;
	b=BVMoEN7NdFom2L1rlgx23wrWEGbTlPggeD7S1tky4GgM/4gGsl1dGe9BAel/mmvanFdyHs
	zBL5zNzkacHbPDyl07WeTaDjQwMqO+CVrS7//EnmFNaP9fDujh9LT/Kk5O8F+cuBWwI6p5
	ui3rY7159x7g7Rko10pWg9K55Qt+zVk=
X-MC-Unique: qgKohuLWPSKSfDSy0SZ3XQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DigtZyC5FzcCRoHB7dsm32+4VIQ6S3nal5l68PpjiCmN44GE3SSLY/sRZ5MjIA1/VXJHX+JzVLAgKvjPSxr/n9U1RYbDenS3QVNKnMjH6km19Vx7caamU86iK5Frhk+iHFzU2XGRwwb8ikKsxa30e1dBqYekAGjbrW7KTNx8saMdYBOUtm+RCeY6mBRQNvAokp5WdRP1VjPjq7ubtcscdZSzHfHxrlJ0QTGTBe6mjhSJdoT1SBv2Dgp+PI6HyhtmoHAtH2hORTfrzFzPPloK/IGbiEvOqigmM4cgUcVFxaZwYnzk6U0EAZ46ILc4quXzsgXBS8YmBjs/y9CYMy90pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO5oujVGxYE8gCO9O1wJxedKAsnpNsZI1EHBIUKEpYU=;
 b=XDSyop4ipRuVzBOk0KvO/3Vv8DFMaVjGAyct66BTyp6K40X2z361HfHKI9Gk2QqqpqyTDCkFq5Eo24bSHLqbqyogwrOoEeI9jFIalct/Z5JhaL31Lo0mR/BFJL2+U7XUEbJnPxLdXl/YsQekPyVG9FGmNZxC3cqjTztV8k24cO+9rD959jQyrxvzJgxJabJ8CorhCRFHc8BI5RNofcPniwwkmf4UoxwHbUXJB8MU7zMEzlMrHr9hG42tYr7d+cTKNA+vTM3N7/4uoYuLFiuHacVP1YE6xNjLSlmfPwp9DmlKiH8QFGirf/m9D+uOMu6rpV7RHHZsq3QCnLO4NtS+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bc9c545-5af7-8665-4830-e8aa3836101b@suse.com>
Date: Tue, 8 Feb 2022 10:16:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com>
 <61d85343-9a37-6409-449d-a662ae5258c5@suse.com>
 <66992013-f438-246b-451d-d96f6eea22c0@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66992013-f438-246b-451d-d96f6eea22c0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0052.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e33fc65-3486-41cd-9523-08d9eae3c3cb
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2557:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2557BF8275AF82AA1AEF0E42B32D9@VI1PR0401MB2557.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CqsWkiqYdNcZON3U9T3EucIg0e09PrePPIG6zC5RucbjqeNIofpCJ7HIsVwZ4ta1mJ0gMaAcP4I04+EWf9QxiqejDC7gPm1twF0kJRLChmpwhl0WM5xO7taoFQERVGg2zgBMDPG7xU12dPWkPAIzirEsHbWpdh0jFC3ZTTQjP+IY7iypktZGvp3iVTCuBW/pwmocvGs0S28N3KabYOy02BXmsOKPkVY/7+gmIMCWbAUE1oV67dQXiys6R8rBNJJoRDntzpvaV1qGeRyvyvttBcdqvLuiteWJB3Rf+55p0zVRdsKRHuYN3COsefQ0zU8PfYYkKga9JnvXA+7cPj+Ip/T4VEHqiuoauzIyHP1/1WPU0cC9WahRbQpAZxa81eYJD3bQSuVksu+ZeHPawFx9LeAMRR1lc5dJLEqK9DB7C377i1ZuayGolz5zUK9hTVLa5OPHLQbb6xOT0NnWW+8LC8yaDGO5KOg1wj5YoMl8kB+ZRT6pX2M8pmcdTQ20Cje95SV7zS0trcYStKHhs762UAdETdrAqUT9z3sCalAsYmamcP7qXm5U3xrIjJ1ranJqI3CPyJL7rLiiUI1saN7TUFb0UMbYPFJgSKzEO8isPCosL/4AaaGYmABeLUXfNdPxXkWvmKZ10mgBOWh4Kkg3CFyZyv3eqff3ov/Inhe1LcrVmgtOvx3u72NXvEIVSmio6lYpKrDca2wcZ5Off1pLvOXmW3rb/e7l7v/kb6Le+1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6916009)(54906003)(2906002)(66946007)(86362001)(53546011)(26005)(186003)(6512007)(6506007)(31696002)(4326008)(316002)(6486002)(2616005)(8676002)(38100700002)(8936002)(66476007)(508600001)(36756003)(66556008)(31686004)(7416002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXQvUk5Ya0g2VThkNUhFT0VRK2Q3azVoY2h1a2FwTDNlcnlmVk1WT2xrV3VZ?=
 =?utf-8?B?M0ZrN2pWTDZ1cUVsWHRsbkljcGE0OHhJenpWVTdwMlU0blU2aDdxZXJUTkVl?=
 =?utf-8?B?SUZxazd3SmZxY3M5dWt5eVpaM0FoSEVuQTF1eGpZYWNndTVEU2k1SUJUTlAv?=
 =?utf-8?B?MTh1MU1NemRMT1U5eXlRTUVBbU4rcm04bmxLUk9CWktPanRneFJqY3B6akN4?=
 =?utf-8?B?UzN1TVJnUGdTWGRHblZaMUZMVkRLdStUcSs2b0hPQmdXVE95MnlLWHlka0Rm?=
 =?utf-8?B?dFZnTmxXRTNmQ1doSEtCU3dTZHA3WGlpQW5INE1pRFo5akV5Ny9TVzlwR1Zy?=
 =?utf-8?B?Z09yYk5hc3VUUVVlVkZRYUovT2kvTk53QlVLYVc0c1hGVXR3VTAwbzdhVnFW?=
 =?utf-8?B?NFVTNHhmS3VPdFJaeWErdFlFNUtBNUVZMU9TNzFockJXeEN3TW4wbFNHSlZH?=
 =?utf-8?B?R1kzOFQ1RlYvaWM0NVk5MDRzRnV4WGx3cGM2bzU0YnJLOUpNbzlxRDU5NzZz?=
 =?utf-8?B?dzFPQ2VoemxxTnNLTjhIcnlaRzl2V1RVNTcwVUUvOWtGaE5QK1BuQXVVQWJy?=
 =?utf-8?B?S05INWhTM0doYmNrTnpTNXh4c0RMUFFweEQxYnlMaDJOeWVuTnA5c1d6cEF1?=
 =?utf-8?B?S25Sc1pnUGZndkZzWlMrallGbzd1TUdqNllNclJ3ci9wT2Q3RmdERHRzTnpB?=
 =?utf-8?B?b0lZd081R2Fwc1VwVTNIbUlOTzlqVjV4UDMzTUNDMGtvOFA2UDE2SkNEWU02?=
 =?utf-8?B?M04waFJrelhvSVN6TjhabnlNRXdVaWx3eC8rYWRFSkdrWk91dmZVQytJL2kz?=
 =?utf-8?B?aThacUZiOWI1ZlVOenA4Y2ZpVXFIWWU1TEhGWCsyM1VybkVHL3EvRVEzb090?=
 =?utf-8?B?QytNaVQyaEc0RXVQeG9ZcytCTHkvQ3NUQWRiWDNpZGFvVXlzZkJhWm10eW41?=
 =?utf-8?B?UlkrcDdXWjJEUHU2Sk45UlFhYnFGV05ROUwzMWpVNWExN2NPUlFJSTN6aXVJ?=
 =?utf-8?B?cWdLcE9Ka2xTMkx6R2JpbUZxQUNTeFFRdWVqdjBxYXRwcnpnT0V4QnBFaFZD?=
 =?utf-8?B?NEZQRmxLaThPa2JoTXc3dU9iZitCMGNuanFXZjhqTm95ZzlYbXdVMFpVQTBN?=
 =?utf-8?B?UnFTcHNVbWxKdFFiTDlXSGZnVDAvV2NLWWs3ZVZpeElFZCtpVlZFOFk1bEVJ?=
 =?utf-8?B?UGJCazZUd1JYZXJWQ0x5WkNzbjN5SWNITjB6U0djd2oxbUU5MS82WDc5a25h?=
 =?utf-8?B?Y0xXS0dUTmFPK1d2Q2ZhWE1jZmFaajJVMklSR2lOcVVBaGVoME1DQ3p6aEVv?=
 =?utf-8?B?WllqZVF1VVpXb01ENkVqOFkvUkdIN3ZWZWgyWWM5a1pWQnpQamszd3k2ay9M?=
 =?utf-8?B?cVVPdFFKdW1QK1N5cmd0b1VrcGpzaVJVTmVaeGlCTllIck12REhkQTRMVHZy?=
 =?utf-8?B?cFVxSHFvVG5yZU5WcFFLZVROS20rRHFxM0l2c0ZRRlpwRFJIRi9CSnlJVVZC?=
 =?utf-8?B?UHRxK3NRNElsczhydVVDcCtvUWNaMG5CYnY5ckFja09hR1Jkam81VXpGa2Ev?=
 =?utf-8?B?UEJIb1J5elRBMGhGL1d3ajZuM0NqQWx3T1BEQVVzTFFkYlVMN2dWMUdSdFl1?=
 =?utf-8?B?Vm9QZXU0dzZOZXNqd20xUEUrUHZRamY5azYyd2hMUllwZGRNYXlIOGdlekE2?=
 =?utf-8?B?cDd6ekRYMHk5Y3NGT2Nxd0tiQlNzbFJveC9zUXA5NEJtdDRGMnVCUnFSSVAw?=
 =?utf-8?B?NmlQdkNsYkJRa2ZhbC9pcjNZVVJSa3pXSUFoU21XYkFYQmx1Z2Z0ZEo3eFNp?=
 =?utf-8?B?SXluV3AyM3lmUEhPRDE3b0t2QWNoeDdHMURhZHorazRvUEFNaW1IS2VNbUlE?=
 =?utf-8?B?YlJmY1lQMzJ1U2pLSk1tcVdheGVST2NKL0xzRVE3djdyTWdGYW5CdnNVdjB6?=
 =?utf-8?B?WHU0TVBXREtvYjZrKzJwVlBEb1pFR0ZJMUZuWDlBdmx3WGcxMy9QNGFsTHIw?=
 =?utf-8?B?bGVETkpBMUNVMFhDUlpETitVVno4eTI0bjNaZVBpbjArWHpLVHFRdkErTGt6?=
 =?utf-8?B?R3RTQ29rcksrNktIb0JIcFJSQjd1cU1GY2o0eUJybTdvQ283WVNZTVJOaVV0?=
 =?utf-8?B?OEMzSzBqSUtERzlmenpHUHhPNVdSV1VYUmlVdUJhV2NmMDdsZktQbEFYZXV1?=
 =?utf-8?Q?oAhAnW5icWAEjTI9mRNSH0U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e33fc65-3486-41cd-9523-08d9eae3c3cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:17:01.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xx1KZdjuYMYglvti27ZufMiO+402zdqcpVq9ZBhBRqERkuSTyT22fPEdfAbxF/1RV492hjKfxpZDAc/5SqBFvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2557

On 08.02.2022 09:06, Oleksandr Andrushchenko wrote:
> 
> 
> On 07.02.22 19:06, Jan Beulich wrote:
>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>> +static uint32_t guest_bar_ignore_read(const struct pci_dev *pdev,
>>> +                                      unsigned int reg, void *data)
>>> +{
>>> +    return 0;
>>> +}
>>> +
>>> +static int bar_ignore_access(const struct pci_dev *pdev, unsigned int reg,
>>> +                             struct vpci_bar *bar)
>>> +{
>>> +    if ( is_hardware_domain(pdev->domain) )
>>> +        return 0;
>>> +
>>> +    return vpci_add_register(pdev->vpci, guest_bar_ignore_read, NULL,
>>> +                             reg, 4, bar);
>>> +}
>> For these two functions: I'm not sure "ignore" is an appropriate
>> term here. unused_bar_read() and unused_bar() maybe? Or,
>> considering we already have VPCI_BAR_EMPTY, s/unused/empty/ ? I'm
>> also not sure we really need the is_hardware_domain() check here:
>> Returning 0 for Dom0 is going to be fine as well; there's no need
>> to fetch the value from actual hardware. The one exception might
>> be for devices with buggy BAR behavior ...
> Well, I think this should be ok, so then
> - s/guest_bar_ignore_read/empty_bar_read
> - s/bar_ignore_access/empty_bar

Hmm, seeing it, I don't think empty_bar() is a good function name.
setup_empty_bar() or empty_bar_setup() would make more clear what
the function's purpose is.

> - no is_hardware_domain check

Please wait a little to see whether Roger has any input on this aspect.

Jan


