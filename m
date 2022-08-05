Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F258AC1D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 16:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381305.615925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJxyE-0004t5-KA; Fri, 05 Aug 2022 14:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381305.615925; Fri, 05 Aug 2022 14:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJxyE-0004qU-Gr; Fri, 05 Aug 2022 14:06:34 +0000
Received: by outflank-mailman (input) for mailman id 381305;
 Fri, 05 Aug 2022 14:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJxyC-0004q4-PN
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 14:06:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150054.outbound.protection.outlook.com [40.107.15.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce40fad5-14c7-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 16:06:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5841.eurprd04.prod.outlook.com (2603:10a6:208:132::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 14:06:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 14:06:29 +0000
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
X-Inumbo-ID: ce40fad5-14c7-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gthBfwEG8c9JWkj+MV9JllQKnijCe7ezlj9NED2JV2Vy0LFMgaLZ7DaIZkqzaIq56pZn8kJXjuE62VuDbxKtIqU/Pf6BUrDG++XWRpfGwXOUPhx6HvWz8GexpWjETkjYQI1YijnZLD8xWeSSRjSLd6ejuNmMt1Miu/B7NR7qk41opkJbOC/kBXENaKLGHi8FAOd+rTHCkfRsj0hpqRnjP6/C+QbyWlHGauHG/tCRxiqEhp3xwT6g2J3/4W1Wb2RfaxwfA1g3ffEYVOYqzaI9EHpaikBsvDd+H2BBozSLzLxG25RwwieIn8nc7TRspp72ksa8LyrKbXIBqdLX7S1PGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGGpvxdM5Xk/Jsi7GFTekf4ULHupdplIYq6NGVWwaF4=;
 b=LhVQizEQ9pciBiu9rIasLQYoQfI3XbY1PRvQD3ZUFyJdD+iP8317TLzWNY4CAYO0N4NCO/4rS4ShvHPUHRp73/ISiuQms+1y+yVGNhZi4cqbvzyxqN4aQlMXkc5/sZ8mAVh6B6XjBY2rJBObp1m8xMSy/SRAnJfCvnugBWh1Y9munB06jEHsWAhjeMUKiR9OY1AfI0u9DGj3n1OqBB+jFk+MhiK+PgatW2zOp9+2FauVjsZzd6TVmICMi0h6Sc09b3Jwmc8UXOXpEpckvU9hcoCKNJP+vpw3n9vUeOoJDc+SC/BSAnpBCX4RkjgucS8WKi07bk2Goc2xyLFlIBbn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGGpvxdM5Xk/Jsi7GFTekf4ULHupdplIYq6NGVWwaF4=;
 b=mjpinqlLp/tv2/KYE7/X1eAQelAMDAnas4Bbi90kv5xI50gA/LWfhrsWA8FS5spkHiWWvzGSFouYnJ97a/+rOvfiBVFhrp2W6zTGYdM8CjDlGXvUcrpHJFn4jAS7HNTu9ZR+IbRVkaDY9sptCoVNv3O9BaJ0AEEC17hZebmNs2MsEg2EItYZajkrFDlzqyHXUgRLu1ydkKatNrAc5rDdUGlYhgEgm22gH22I1S+7gq42k3TlpB/KgzcHpO90h3Zkc+wk/v+QOBvMWEJm2QU/oecQUOcz7BmdVOHzh5rGIexxzLO1kAU9hzTRvWKQ9FiIQoZU/BDU2iN+wK773EUJgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64ef8170-fd70-cd07-f861-a79639203f7a@suse.com>
Date: Fri, 5 Aug 2022 16:06:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] docs: correct x86 MCE command line option info
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f3f70a1-9a0f-42e7-4f13-08da76ebb133
X-MS-TrafficTypeDiagnostic: AM0PR04MB5841:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VNeglEHcI7VDKHLDWaelnH6SAgvi35Rf8DfNW/hTo2WHyIIOs7+P/Fw0nmXUu7kc8Ot9Z6jFDjw3cQ76jpG+v8REdPyvykLP4Qaq9tQn+01Ob4DoIK8IOdDN4hperv7BDXmJMAyUvzLfcOcBx17Rn0kDK5yBpwIdXgHIFX9p4EwZ7qMPaTBzvjeAk0NgGBQU9rfdG6t5OGCXsXDQZv/LgjdwTgTppsrlZithUm4N+8RvkMxKkjQzEuX7PAzJOLIdy+bUZFsA/2uiKuiQl/PvpAAQW2oZnd8bwYXq0X+dcy8wfopLGa27sdaY4OA/b3GyvlVhRYxfden0wsz+NvbZzx3q39zGGbjz6ip3UZiR3wVaBo0ijMf461d/xYky4CPJxbk/5fO1UtkyVZV5yzys5HYLsIlw77q/22Go/1AGouB6s6ucYzpHHpJHlbU19zJrkmZojMIiBFjx/EdVJOXI0tQpcefdHSsOzfi/WlZhTN3AtGqnrf+TANHM61r0LAstKoFlHa5KhWeiNU0u+3/MGTaE2YwgvwH1WXRKrWzgcgZuJdJ79GeEyAbqfQBdsGobpRhiUOtlT8PDfZhMcT+SCCkZSE10exxGT+1Di8oc124wGRBlUx2wN3Zr51Mv87WoxYqcgTrL84mKZShnBhVJCOCOF69RJSePjPgcDyY4qF/oU5nCd0eLLOFXeiSC8A0y6jBAUFFOgdUyWy/CS0g8854kT42sFJ3sHDFV/DZg3dford+Y7V3mJPoZbBeQoZrfnNekK4mp3OE6E4Va9o+Q/WvHRxOAzOUC33JacG6v5lRvag8v4/EIQy1xL2mL707ehxBv4b+ZML2a32qIPfxo2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(346002)(39860400002)(376002)(36756003)(6916009)(54906003)(31686004)(86362001)(66476007)(31696002)(66556008)(66946007)(8676002)(8936002)(4326008)(316002)(5660300002)(478600001)(6486002)(2906002)(38100700002)(41300700001)(2616005)(6506007)(26005)(6512007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEVQNnEyazdEUVNCTklHalN1SXlIS0FpMW5jZ3J2NFNwa1ZBUmZEVk8xdGIy?=
 =?utf-8?B?UDRWeXFOZEJLcUNmR2tEcjlWN0xNWnBNVVNHMUl2b0tzbVJSeWFRcG85TExE?=
 =?utf-8?B?dElLd0dhTnI2YU1oeWdkMGJJZURoOEJjUmpHS1VJNmZQYXZyc3dtQ0d3bXJu?=
 =?utf-8?B?SWo5TnNWMVdGcG1hdHJSRUlqVC9uT3l0TXk4WTlMRFBhUGhJa2pFR3haWUpD?=
 =?utf-8?B?VklhUEFUSEpoRmp2UkJRaWtBRUYvUmJVTHkrYzZuTGRlV3RrTXJlVUdZWWJU?=
 =?utf-8?B?cDgwNkwzRjN3UERiMkxuUVlnWExLazRqTUhBTS84ckNvRHpmRWV3bmxHSFlo?=
 =?utf-8?B?YWNCUEo0WDFCNm9LRGM4TC9ZVG1qbFcvd0tSZWN6TWlJTGlzSW1xemlScWxY?=
 =?utf-8?B?dnZsRzJOcEJnWEk0OCtNZy80RUdOUms1QmgzQmJNWEowY09JM0tzNjJISitV?=
 =?utf-8?B?WEJhT3o3K2M2NUx1b0EwQnNkSDh4SDhjOTlpd1JTU0NCN3BsMjRVNHNIODJZ?=
 =?utf-8?B?NUNEdERQdTR1N1BmbDNFclBOTVBZUUFGa1UxSkJYMHRJS0Rxd1luc1Rrb3RZ?=
 =?utf-8?B?eFJHaEZXdUFSOVpOQU51SnVpdmxMb0J5RjYzZlFxNU1wVFZIdStJZ3VSb2Jq?=
 =?utf-8?B?WllrdU0rUVdnTFg4dkErWTgrZGxSbEpPODhQQVh6ajJTdnN5c2Uwak1XZllt?=
 =?utf-8?B?dFVLeDdHVDA4dWk4NUpXUnpNS08zbnZxVDNYcGZmdm1DSUNGWXdBNVpyeFE4?=
 =?utf-8?B?Qlk0VFlrMit3Z3krTllTTU5CRDBTUU5naDJrbG5MZHZobjBRMEJ1N1AxYWZO?=
 =?utf-8?B?VHBsNks3a1hub2N5SG9TcjZPVlptNk40Q2E4QzhCY0hsUnA1TG94K3pGbGsr?=
 =?utf-8?B?UUpydGVqa1dMR043YkJIbmUwaXJEV0dSUVlib1VtTklNeUhMazZtWEpud0xt?=
 =?utf-8?B?MklLelgzSFpiNDNTZ1NXRVYwcEpHeHNZRDhkNEF0NHBoZHoydi9rbjlwOHls?=
 =?utf-8?B?L2JMSVVBYWI3b0dqcWwyR2pHdEE3U2lKNXpPS2RYRDVEMFNwRjFBaWFnUXY5?=
 =?utf-8?B?MTJ3VmkxRk5tR2hqNG9KcGsrNTBYd3ZlekZrZllSejFuZnhra0pkcStwU2NH?=
 =?utf-8?B?YUNZL0JSRnZPb1ArYnVBbWtaZWxRYVJWMmNxQTlIVWMxaDU1emZhM0k3ZXN2?=
 =?utf-8?B?ZkhqeTAveEQ1WnBZOS9IZjM5MldnM2EwZFY0ZmwvSTdMeXg3Lzk1ZmRSWXIz?=
 =?utf-8?B?RTg2L3ZBYmJlNTFDT0JtZkUxL1FkR3FDOGYrZk9NRXh6c29vbE8zL3Vicjcr?=
 =?utf-8?B?azR1cHpaQWRkWU5EMjRPWmZkYjZMc0dsUkx3UTNUQVZMbFE2YXNGYXNHNC9N?=
 =?utf-8?B?MW1TQm10VWZrc2ViZnh3N1pWd2JBSlpOSWhpWDl2UW9SQWVKMWxtR3liTUZP?=
 =?utf-8?B?MExqbEtpRXZ1MUFmZGhlRkZFL1phcmNjdUJvemV4S3JiR2lUSnNtRTFKMEtk?=
 =?utf-8?B?dW1wUmI5KzczRmVUZ2o0OVM3ZGNRa3loTDRzYktIZzlHMGtuRUptV0Vna0RH?=
 =?utf-8?B?Y2tjdTdrSnZCVTZvZjVnRWpUcW9HUGJMbmhpS2hBV1IwUjBpSW9xR2tjQjhl?=
 =?utf-8?B?Uloyek9BZHhPR3NuM0h4RWM4UXk2MWlwcW5hYmJsN0lld3hMWWFlSFBlajVv?=
 =?utf-8?B?Y0JPckZPQW1lZWtkdlRmVFdOM0VMcXpnditlRlNVSGRhRVhSSTg0c2xPYTJ5?=
 =?utf-8?B?T2FMbmlNTXdmR2w0MUR0Uy9FNUgxQnFHZk9FZnpjN2FzcmxER0VhR0w3T2VX?=
 =?utf-8?B?N1hhNFBuMUNtNk4wcytZeUQ5elcrc0VnOWlYRXY5WUxxazE3VDl2UWJLZUlP?=
 =?utf-8?B?c2F2WlkzdjRhckVsZlhZOGpLSzg0WFliYU00bGFROFVhbHNnUlRxSkpER1Bw?=
 =?utf-8?B?ZVZlZXB0U2ZEaURWbk0yL0t6RFRCcWJ6ZWlKTTV6OGhHVjAybnBqOGZabjV1?=
 =?utf-8?B?Z2ZiMy9wWU1tOHlGUUVRL1cxRy93dlpJWUtSNi8xOTV3ejc2L2lFRGZiL0NC?=
 =?utf-8?B?ajdKYjk2bjRMdjNmT2tRcXQ2cHV5Z21CbVQyWXViK2RTd09jQlVzNjNQY3Nj?=
 =?utf-8?Q?jiqnKu/NBohBPyM35gJZSF9Q3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3f70a1-9a0f-42e7-4f13-08da76ebb133
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 14:06:29.5855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VlioJuLjEsF2heRhPx2IjvfR50PLMWLI1NkmaZ01QXMZ84t/jIz52fcJeoDZH3otnGXU9tnSCGz/l4uwIACdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5841

Not even the types were correct, let alone defaults being spelled out or
the purpose of the options actually mentioned in any way.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Wording change. Explain "silent".

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1691,10 +1691,23 @@ one pending bit to be allocated.
 Defaults to 20 bits (to cover at most 1048576 interrupts).
 
 ### mce (x86)
-> `= <integer>`
+> `= <boolean>`
+
+> Default: `true`
+
+Allows to disable the use of Machine Check Exceptions.  Note that doing
+so may result in silent shutdown of the system in case an event occurs
+which would have resulted in raising a Machine Check Exception.  Silent
+here is as far as Xen is concerned; firmware may offer to retrieve some
+collected data.
 
 ### mce_fb (Intel)
-> `= <integer>`
+> `= <boolean>`
+
+> Default: `false`
+
+Force broadcasting of Machine Check Exceptions, suppressing the use of
+Local MCE functionality available in newer Intel hardware.
 
 ### mce_verbosity (x86)
 > `= verbose`

