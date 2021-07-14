Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128FA3C8221
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 11:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155999.287907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bZO-0004DK-Lt; Wed, 14 Jul 2021 09:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155999.287907; Wed, 14 Jul 2021 09:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bZO-0004Am-IK; Wed, 14 Jul 2021 09:52:46 +0000
Received: by outflank-mailman (input) for mailman id 155999;
 Wed, 14 Jul 2021 09:52:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3bZN-0004Ag-6O
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 09:52:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfd0ac6e-80b7-4785-9e03-4b8a342f0367;
 Wed, 14 Jul 2021 09:52:43 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-tntHHT3ZMTeNMNrdGXLClg-1; Wed, 14 Jul 2021 11:52:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Wed, 14 Jul
 2021 09:52:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 09:52:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Wed, 14 Jul 2021 09:52:39 +0000
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
X-Inumbo-ID: bfd0ac6e-80b7-4785-9e03-4b8a342f0367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626256362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdAtoLSIEf2zCB1qHtB+BxP6hO2ntve1Eqxc9+KcE38=;
	b=VTIcqnLqUOfNzenjyV4YEZ0oEdHJxiZZjVajCoRXDA0EAgfUbBX6WYzAVHRzL5hso0zbdL
	/PGhumsuqqeJFd4GE3hX9jLUiNEmlHpoiwY3iwXAnUaigMkXeeHW5MI9ndwq66R98uLinm
	uvhJCHTjOA2yYi62+7y3PjnGB4RFYKc=
X-MC-Unique: tntHHT3ZMTeNMNrdGXLClg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImRvnlQQCLb+q8HKlsNc/UMdzV85zxtq6Dbrbp7JNN44dusbEA4OXw8XNB0a1Z5RBgOIuJh/182WTW2Wa1rnFxWj1OYRh1BsI4t7LZaGhGp4HbJYYGbYnkvd5QycRQzz4ZBdBgu9J3Les7rXn99NjJOKpAIP3GHz4y1Nsc2AH0oS7wcHNjLpuyr9CnW5hsrzjzjPPF9X9V2KKtTTfXBb6p+2gjyKCtfYDYV2XB8ZSMyGVPBuYOt61aeyD+kyLwZ9GTPIc+z6zMDcBcVfQkW1DO9HGMvFyKx6pcHUJFufMKx6KUslJytN70g2EOFAS+gnhm1FZtKN/X8lginnT2GPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdAtoLSIEf2zCB1qHtB+BxP6hO2ntve1Eqxc9+KcE38=;
 b=FBpONERSYbh7/U0bwa6/Bmdi18oSyO/11azL7MI7MSYHdF9sjpW5aPA+ao3pQO7Pcy1Wrzw+gmoCXATVDOFf5FzEvaTbVfo98FaNrEz+6qnpdMvXWWHSrY59+UtWShPD/kFGK/jcoW+pPNGZ+ZKLb4RB9a29JfKlIiYuRfFHlOg3+W1Wf+jsS/wMvn4aj3eOQY9NFVzqI/lI62S250ovm0ucaQAq0W5x+KK8D5P3wZL54R/czgKncgEYFd+YLmyZXVRG3IYZiNrlwkWl4XNhcBr6H9WsnwTRPPjf3F4D4zlBKLNHU/HK0OT4oh/sh/wNOXQZBvXSL4+/mGFiWiTTgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/4] x86/debug: move debugger_trap_entry into debugger.c
 not inlined
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
 <02355502c796b500a6b7e9e60b903d245d2ece23.1626136452.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd256446-a8b0-3431-8962-8df3bc8477e6@suse.com>
Date: Wed, 14 Jul 2021 11:52:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <02355502c796b500a6b7e9e60b903d245d2ece23.1626136452.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ef7ce17-976a-4871-27d8-08d946ad1e67
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168E3795D4ED6476AA5417CB3139@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	easCDhQi5cI4j5A6UbDCmCwoEzFH6A1daEa+kYrNHSZyZyx3cL5yuUMPDhmXGuVctl9JY6yVdIvSbVkxf6DrPUjvdRW/JTPLLXVcWlvwi0QYL10/jlPKpDYK3m/VLAy93nA/huMZpipIyp7ZcM/Xj+Glp3wUfghCO1nD8Iyxf8LlplXJgQhbuX5ez8Me7uTH5gn5vCJ9D42sIgmDrtCmYMdjjM2RiYKxMYsREt2Yzs5co2CgABRYkELlPRGtobxfIpyMEVOqJyFnvnLDs3rvLHV4su9GrZkhldqz1dlyoNax+u+PBOwNTxUceNExNtdwoDHRW1l9JbdmA7MK8DaWzAyH9oVDy7DcIRbo9t/KYBe5fPYNM/AottYeKGLatnOnjQx+zqcZ9MNchF+UVuzGeJUW50AoQ6QSvMwrYgKRZTpBR51SbZicHxizpIVUZvljatbOozcok4t/XH72N+HSE2poCsEQbpZnEcf8cWPAbtJGQA4NeN8TeZANQkTjLxUsx4JbNqgTycgN+hk9LaD8fSg2CvtvLzjdteZXIqe6vJRC+rmcNVx+x6uPW0Hy/YoV2u5P9UGjEOfNsOuf4QQfrkd1EfeTnOw22vk7oAWPOWku8ewM8KuRSI7uldpkTk4BnDKGyM4Hs4eKQAhW0TqAtzuQm4ouLA/9vkVrUJlQ1l6j7qTIawzrjd5U27tixniZYpNSmksv8XUM5LWP5YWTUKyvqwkc4TeC7RmAN9nNeeVyLhiBGX1v5HJvUbTlFshlYSd6ZASgmL/uaaFwTS74d/J0e7sYHvOXp6rblJYo9IA/3quv8clHmJf/GM+sSxCX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39850400004)(396003)(376002)(366004)(38100700002)(8936002)(6916009)(7416002)(5660300002)(2616005)(31686004)(956004)(86362001)(8676002)(4326008)(54906003)(36756003)(66556008)(26005)(66476007)(16576012)(53546011)(2906002)(31696002)(186003)(478600001)(83380400001)(6486002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alhsK0x1MXV0NFZQK3p0RlUwSHVkK3lJQmVlV0tUY1N1NWdwaUpvYnFTSDZ0?=
 =?utf-8?B?WjZoL1dONjJ1VzBCUmY4bVdSVzhCckJnTW5DMEFmZzM3SnROMnVLMjBabnRk?=
 =?utf-8?B?dWc4Wm45aTRXOXNFcG1wRTRsY0JaMlN5alhERU9aMXpaeWdzeDEzNFAzMVps?=
 =?utf-8?B?T0FoMkRzQmpYcWd4UjV0NS83b1lNRHNSYjVNTEp5akovU2FHRXl4Zm4zR0tj?=
 =?utf-8?B?TzFheGNLNXdXaHRyTXoxdytkL0tSZGUvRE1sWDRxWHh6ZGxnTUdrWFh1M1lI?=
 =?utf-8?B?amxCYWpaRmx3cFM0V3dPYmFNY2FWRlIveXZOVUx2UmlFLzI2SGRJYW1md01y?=
 =?utf-8?B?MDZyTGI2TWZHdm9rTTgxeGdhYk1KbWtoa253NHJKdS9wamw4Q2drUTQxcUk2?=
 =?utf-8?B?L0JaWm1vclpKZlVyc2Y4UFVJWUlSclhpenY1ZFJ3STN6dk84NGdycHAvYmtu?=
 =?utf-8?B?aEhvdko5bUw5U2ZxRVQyQndVMTU2UC82cmVYN2JWbFhyUUJVNUpyL0lrUkJK?=
 =?utf-8?B?OFExYXdxTUVMWUtVMjc1UktzUVgyR1dVVzhNeEd5TDEreDBhbHZxNXg0alRH?=
 =?utf-8?B?VkFOWnlwWXF3R2NVTTZSdjV2NFRnRU1WNm5hVHVyWTBtSTAwS1hFVzBJZ0VQ?=
 =?utf-8?B?dldTZjk4dTAxTnpZOGtFOWN5UmJlR1F5UTdhMmpKSUt6V2Jueno5MUpReElj?=
 =?utf-8?B?QkFYNlJQZWM5dmRuVHgyOEZOTW11R2lJZzZFdGNFRXV2ellURTl2K0IyWUN2?=
 =?utf-8?B?MERUYzVVWThDMnk2TlB5MlpyeDY1SzRpY2ZnRTB1d2dCcGdPNFlGL1B6ZHM3?=
 =?utf-8?B?Zm54T2pHZTlBVkJwQytyU2Ewc2ZFaVpjVm9Oa2diWUJadkpML3F3cm5mSTVu?=
 =?utf-8?B?S1BLN3d1WHN1QU5ISFVHSmYvYW5LTnNFMzZrcXgwTHFNNU1uM1cyS3VPOFpW?=
 =?utf-8?B?VkFycUxDYm1QZHo3dmNLYzlDVmhaWDRuS2FXZERqOTFsaE00aGNNSEF2WkpW?=
 =?utf-8?B?L3p5Z1BNNEhPczhnbll0ZzJ1UTIvd1RpckJiUXVvdHRqaVlCVXZvRTNKZ215?=
 =?utf-8?B?OFI1LzRaYVZvL0hFZGk0aXpKOHBuMW1yQmxOMk9STWM3VjBWMUp0aFRCN1Zq?=
 =?utf-8?B?RXQ2dGVKMzBUVW1Fb1NjT3ZaaEZUODArUi9kSkxzVmVubjhyY3g3bUZiSkFB?=
 =?utf-8?B?dmlMK3hubXBhaHYvK1NaWDkvem85Y2F6eDFoa0wxcWplUFpIcU12alhZWk1U?=
 =?utf-8?B?SC9oMndIQSs2REYrWUVRY0R1YityNkhTQ2RIaVJmM1RackE2dzlESG1DZmZO?=
 =?utf-8?B?MGxlL1BVOUlHbm5iVG1PbVVkN0xRNUhmSlZZSllaVjAzWTViOGY0QzJsajlx?=
 =?utf-8?B?aWEwMC95TExpSmJYelRRaE9oYTVpUEhqUTU2cVBRdkU4bjg1VzJsRDlTTW1J?=
 =?utf-8?B?QTV1Qy91TnRkQ21xWExtYlZvVFhQb2o1Mms3VXNIZ2o0Zy9CMS9UNzJ0UFRn?=
 =?utf-8?B?ZDJUMnM2T3p4TVNabzBnaEhLd2owbHNIUGM3bjlLN2w3N25XVHFlZjVEVWlF?=
 =?utf-8?B?aU5NbVVxcG9oSE8wam12MXMwdlhKdzJrNzV0aGhqVjBmU3ArSTRMMWZ2QlZw?=
 =?utf-8?B?RjBIZE8vc2RWUmtPQWtVcVhYZkFEN1dhb2FFUGV4TGpvaXNvazkwMXJLUHo0?=
 =?utf-8?B?ZGtlT2tqWFA1ekF0dGYycXJIN2gxYUxVc01yV0l0ODNWaktWU2xTMUdBaHhi?=
 =?utf-8?Q?kOpKg7rSt6x2HDKUpWyhBle0SyLTfjCIhHxhnOM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef7ce17-976a-4871-27d8-08d946ad1e67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 09:52:40.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GPrNrzWHaPsLZdsmhmDlAPr/aHowvZ9DamW3JGsAWc27Dzlrn8SVWocDvLlUMKke7g8122e5KXYu2/5Hj/NeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 13.07.2021 03:59, Bobby Eshleman wrote:
> The function debugger_trap_entry() is rather large for an inlined
> function.

Well, yes, perhaps.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -32,6 +32,7 @@ obj-y += emul-i8254.o
>  obj-y += extable.o
>  obj-y += flushtlb.o
>  obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
> +obj-$(CONFIG_CRASH_DEBUG) += debugger.o

Please insert at the appropriate location, rather than breaking the
(mostly) alphabetical sorting.

> --- /dev/null
> +++ b/xen/arch/x86/debugger.c
> @@ -0,0 +1,41 @@
> +/******************************************************************************
> + * x86 crash debug hooks
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <asm/debugger.h>
> +#include <xen/domain.h>
> +#include <xen/event.h>
> +#include <xen/sched.h>
> +
> +bool debugger_trap_entry(
> +    unsigned int vector, struct cpu_user_regs *regs)

As you have to touch this anyway, can you please bring it in line
with the stubs introduced in the first patch, by constifying the
2nd parameter?

> +{
> +    /*
> +     * This function is called before any checks are made.  Amongst other
> +     * things, be aware that during early boot, current is not a safe pointer
> +     * to follow.
> +     */
> +    struct vcpu *v = current;

This one can (and hence better would) gain a "const" as well.

Jan


