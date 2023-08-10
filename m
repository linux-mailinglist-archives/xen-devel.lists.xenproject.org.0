Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E046777226
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581890.911346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0jC-0007WL-OU; Thu, 10 Aug 2023 08:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581890.911346; Thu, 10 Aug 2023 08:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0jC-0007Tj-K5; Thu, 10 Aug 2023 08:09:06 +0000
Received: by outflank-mailman (input) for mailman id 581890;
 Thu, 10 Aug 2023 08:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU0jA-00075H-FM
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:09:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 247d56dd-3755-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 10:08:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:08:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 08:08:59 +0000
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
X-Inumbo-ID: 247d56dd-3755-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5xaKSsFUzB1tHUZfRRxFQCk+LN7iskJspXw9Rn44cAXfglic5leSctAc2nHkcvtfEwU29utvv3D3gxga7BovVKNcNxQlDXqt6zVbwRP0DWfZrOXX+NIDx0ywKIoIdRab491bG6uHB/HsF+4ScB+effi4eSZazJAyN0OqdJ/Bbe+VXOicCd8ybGbpUKLJqwRQdTYkGdDbEnXQkM6I6gYQu7DALfOHiae195ODZNap+HuUuJV3xJUrUDVkgTxSni8CidCs2v+qLuu5am2MG/JiVn7UwSX6Fvgjc0i8G7sDHdBsxGFgDT5hYXzF4oUoU6b9YAMisthQ6ZhRLAzXxOoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeqaQGm2SvFd1mSvQd1T0j7R+k314rTD9k3Q+ZG/iqY=;
 b=nPUm5OOPLSUzBdStMBhPKjb2KvxvoKPG+ohwtgXHfc6PxZ53oFyOtB24hBO0L+HVXGrmd7QEO+nqwvuWT/oGd4ZrvaQSb9VjG0++gyRl0Xs8jTxQPFh9dSrinIVUQeUHMOaaHcdUaN+HWYjlmuwDRhXM1FGDj/F0jYT+PEdXWrRBsfTLmJZ2OFvyY57BAn+OcR6KyJv5Siytv+rxha6ortxVDCJZctKzEtItJLxjQSKsAYZONsiWOXpgfaRE9Rh7PuMfxF8nCuoiLSvG1aqcY3RTR5JvD5ECL/8ElBcpBDN8HbKjZNA0Cr4s5ZYYmDHHAfRTiL1y9GUoT9vmeCxkXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeqaQGm2SvFd1mSvQd1T0j7R+k314rTD9k3Q+ZG/iqY=;
 b=ZLKXhLyQxBW+N5w98lgFsfPg1DX4zQ4YtTcgQlgnZs4xsTkyNEkzyuc8gxE8HsB+TDPQjUsykok6Bm5ssRAPA/bYtgx+KEFggVhEQ/DnJxKnU2is3oNq1lBblfWz7xx1OtnRQAJ6yXY06ZHlwsOk6f76uh4HfCpinvwYqYmdTfg+K/6zWlPu/fdrGt6wmUFjMLm2Oil4Jws7jKtdCmDPEti8KhKJ20e1nMtyYvNrlYFHZ7EFKpXuWJA0HPg2pblF4J4Bgzfiy/BfE0ezC+N8nizNahcI4n9uZTmyfkzEg3O+pFXPnLWAk5kiImlQKY+eUGhPEHlLeiZqbR1/O4ly6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9743391f-3b89-ddba-1c79-ddbb1d143437@suse.com>
Date: Thu, 10 Aug 2023 10:08:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 5/5] xen: Add clang-format configuration
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-6-luca.fancellu@arm.com>
 <3c5ae070-d6c2-070c-e482-e5135e2acef1@suse.com>
 <394778DB-2D5E-4C52-9DA1-F23A530534A8@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <394778DB-2D5E-4C52-9DA1-F23A530534A8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be0eaaf-ab76-4a08-c6b6-08db99790d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MNL/Epfttm+//OvdpbKpp51QxS4giTUdYLzdX7MyemFasLF2IKItRxTKO5wec8YDLK4gWELT/lGZEE4/j2bTctDFj4BKOilrSyC6MpbvaadrjxC2KxdEn6Heho5qYG23OANkakUseKAaGKOD24OoTBfKqbJsV147Lz8/hhgPlODNBDzboauV9snVevgbX8ercK8sxhfx7X3+5cFu343wXBrUzozpl4TBDvtCRWwFneYRTJU8ngIvU3ldDxgBe7f+xRpSqj4eC6Cz5mpR+F5fopCU/PeqTV4n0DeCQWGGn4ISX4RHVnGIQNzHFk8e/G/+YHG54qzEoXLbTJZy6GX9WWuz4GT5wA9cdUVViI/aqwjndhDgAarz5OJI4TYwXXJz71xTSGP5th/m04qjlT4/Zau9XJLH525odG/KR3d47SQdhKliYBqGcVNZOZuoyKqIPNAW9vkeEVd6QlIgjKeTZYVhizJEyhxmSmB4Ay9lO6oKty41wGxFw4fDOknlmFCPE7Clshp4fYZUTTXbJJ61Zt2N+RSluwc+GNdXwczNMU2v1F8zTPOrjs+ZRLUgkAaJ+1pdJR+LbrrxUf89itRuldpIYmBBC7WRzNI/HsbzeUjwp1ropkwLJ+GTWftuu0N2JsQaE4gAukhUKfxPkyQxUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(136003)(39860400002)(186006)(1800799006)(451199021)(53546011)(6506007)(26005)(2906002)(36756003)(38100700002)(54906003)(2616005)(6486002)(31696002)(5660300002)(316002)(6512007)(966005)(478600001)(41300700001)(8676002)(8936002)(86362001)(31686004)(66476007)(4326008)(6916009)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWNocHRRR2VWMHErU3R4ZkdvSngwU1ZaYjdFODU1SkFQVXdJRGllZmRFTWd5?=
 =?utf-8?B?Wk4vY1g1bjJzQjdzSnpkZ2MveC80cVhqblN4V0N3SFVCMUU1Skt3NzFFRUpN?=
 =?utf-8?B?bjlqN2dPbU1JRDFUMmJOcGcwc241STVIWmRzNGxrMjNYM2hFNmc0RXFwekF2?=
 =?utf-8?B?T3VLVHRBeXNXTlQ4a0xUM2RTM2g3TU9TMlJIdnNZSjNXamhlMmtzNjh2U08r?=
 =?utf-8?B?YWpYdjlhd0hES0hGVEZ4Wnl4aS9qQUdEUzY3bEl1RDJlWGM0ZzFqczIrQ2lL?=
 =?utf-8?B?YmRkYjFnMW9GVXgwMWJPTXNPTFFnUCt2ZnNyU3J4UmhMaE00K1RsMlN1ODRr?=
 =?utf-8?B?RlRuaHlaNThlS3g0WmNHVThNeFBnWUd4aDFZVjBJSW9KYmhjbTRhM2hLS3BY?=
 =?utf-8?B?QWJIQWtqYVpLL2ZKbXV3Z3p3MzZJbUttWVhDa3RySlNxYXVqY1IzTit5aU5I?=
 =?utf-8?B?MFYyUFlOZmdzY2Mxc2FuV2Nub3gva2dTY2hXVXExVVlnWGRaSXlXdEdHMGZM?=
 =?utf-8?B?Y2hyclRLS0JMaEVEZWVPMWhoTVRXem9ic0FveTZmb1lFOTVST21IMnZMQTlQ?=
 =?utf-8?B?UzBWZ2s5b2VsdjlzVWR3SW5aRTNuWDVpT0Jzc2dBQkF2T3NIbXkxdXl2dGVZ?=
 =?utf-8?B?TnhRemlURVZNZ2I2VS9oNEV2bHJ3Y2xKbEdVdEhuSUNwQkxPMlZFdlAvdnIv?=
 =?utf-8?B?Tnc5blczTVUzWHp1NG5qdjdVeXZaaWRNN1JYWDZCQnpJSVVkaUxTQ01xRDZw?=
 =?utf-8?B?Qkt5SG1ORms1WlVWejVPZ3FBTWlEOVZ2SXdVZy9ycjNxRndaQ21WMmMvKzVL?=
 =?utf-8?B?cUN5dkNqaW9BWng2U3dGVWg4VmpsN1RiaEdONEJTNkx4N0RmQzRMOVJKWEt3?=
 =?utf-8?B?UmdqMnZTelFwNndmVGlXUk1tYnA0aDZqSWVFZ0pHb2tKOU9TK0UxY3VWSnBJ?=
 =?utf-8?B?aytTOStQa2hkN29XSGg1VDFST1VWaHJXWmg1WEFUWUswYUFIM2luZFNJSEhX?=
 =?utf-8?B?OEhqOHNwUTgweitIQTBIV2tUbkZiamczbmVyZGVFTTdBR3Z1bk85bm5yS3VQ?=
 =?utf-8?B?dWdweDQ5azBaeWp2MCtwRUdWc2YrK3N6QzRaTW85VFoxK2hKS3JRdkJ6K3lN?=
 =?utf-8?B?c3VQbGdwQloydGJ0WFcrLzR4TFVYeFhvaUtyUlJJenJGeWxhZnVJYmxoOENK?=
 =?utf-8?B?U0pPc3kxS0xZMHVHNGQzODV1bnFYUTM4T3d2YlZFZDlINTZSRFRLaWRtT3pn?=
 =?utf-8?B?QitBS2V1b2t4aEY2YjU1NVdWNE5BTjBwZENKdXdIbXZtcmtEVDFEaGtBOWd6?=
 =?utf-8?B?UXpURWxoSUc4cnhINERCditIL0ZqWGhScWZPRjJLZ3BtZkZvejdqZzY2UEow?=
 =?utf-8?B?dy9MV0NNamxUZ1BQRWJoZjRmd295VDIvcVdGYmpYZGVURHE5RFpaejlLazJF?=
 =?utf-8?B?Qkl0NXQrbGdtbnZwY1liaE82ZFVtQWxVVmJqUzhCcnRSaGc1OElJekR1dTBJ?=
 =?utf-8?B?V3paRktITFNaMmo5WHF6SDlGL1JwSHVHdkVWZXh6UDVEU3RwNXJkbDVKemlv?=
 =?utf-8?B?Ulg4VWVRLzIvU2llb2I3aW1hSkF5KzhGWEtPSS9HVWg5d1FXdWpNNHFWdGky?=
 =?utf-8?B?TVhTVUFYU2VNVVh0ZVhsWDVVVUdiakxlWWZQVTU3NUxpTFp4aUpOOUtUQ1ps?=
 =?utf-8?B?Snh6SGFNYnlndWF3em9sbk04MGhhOWk5ZmVIYVVnMUZkNFk1S2RJcmZ5cUNv?=
 =?utf-8?B?TnlBc3BrMWdWRHgwQlZsVTVmR0IrSXBqR0g5ZkxXV1JlVXVscjBLUlYvbnpG?=
 =?utf-8?B?V1g3L3lmZk9mOGtNZWpiVnZ4bXc5b2srWnl0V1hvVytkMi9pSDBTZWZYUkU4?=
 =?utf-8?B?aU9pVVQvdnpaZFQ3SlduMjF4clNFRmNTS1B6NEdUaTRLcUw4ZDlBTUtMUFhs?=
 =?utf-8?B?Q0phRGJkbkNxOVNLbVlKd1QvTnZSMUw0c1UvN3VxSW5HL3luMktWN0lxaFZ5?=
 =?utf-8?B?R1IyZm91K2szcGhjc21aeUgvcllEaWE3M29FeVlaRWtqeFczVFA4MEdqeFFF?=
 =?utf-8?B?dEJWK09mQXRpeHo1RUtQQVdxZTM5K2JnZXZQOWZqYTlMN0RTZnMxMFJGeVFQ?=
 =?utf-8?Q?+1lh8l2AyBBny0+q/pcISf+H8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be0eaaf-ab76-4a08-c6b6-08db99790d48
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:08:59.7511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkKuRkyE1CzHd2asE8/WaFyDrVVrx1xA6ptsggptDdm8YNeaHF/1zBOxmkqrpyG3XWJvzDuDvDM+Zc9WHJmUHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

On 09.08.2023 18:18, Luca Fancellu wrote:
>> On 9 Aug 2023, at 16:48, Jan Beulich <jbeulich@suse.com> wrote:
>> On 28.07.2023 10:11, Luca Fancellu wrote:
>>> --- /dev/null
>>> +++ b/xen/.clang-format
>>> @@ -0,0 +1,693 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +#
>>> +# clang-format configuration file. Intended for clang-format >= 15.
>>> +#
>>> +# For more information, see:
>>> +#
>>> +#   Documentation/process/clang-format.rst
>>> +#   https://clang.llvm.org/docs/ClangFormat.html
>>> +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
>>> +#
>>> +---
>>> +
>>> +# [not specified]
>>> +# Align function parameter that goes into a new line, under the open bracket
>>> +# (supported in clang-format 3.8)
>>> +AlignAfterOpenBracket: Align
>>
>> I'm not convinced this rule (assuming I'm getting it right) is
>> suitable in all cases, especially for functions with long names or
>> very many parameters.
> 
> Not sure I understand, I think this is the current behaviour in the codebase now.

My understanding is that the above aims at (only)

unsigned long function(unsigned long first_long_argument,
                       unsigned long second_long_argument);

when we also permit

unsigned long function(
    unsigned long first_long_argument,
    unsigned long second_long_argument);

Jan

