Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3A302B98
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74437.133805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47Xf-0004am-DF; Mon, 25 Jan 2021 19:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74437.133805; Mon, 25 Jan 2021 19:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47Xf-0004aN-9j; Mon, 25 Jan 2021 19:28:51 +0000
Received: by outflank-mailman (input) for mailman id 74437;
 Mon, 25 Jan 2021 19:28:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l47Xd-0004aI-N3
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:28:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1acabf42-6a09-406c-ac1a-f35488180433;
 Mon, 25 Jan 2021 19:28:48 +0000 (UTC)
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
X-Inumbo-ID: 1acabf42-6a09-406c-ac1a-f35488180433
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611602928;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Crx3cuIwod3xazuKJt4rxZjKHBQuTKCwYOZjvXcf7Vs=;
  b=TezaE6m/sa8Uq9ptK2ptV22KgzIKLHhHZ7hOFf958bPUBYr2t/MXQYFq
   iBQQArekO4wrOju7uQR1NtUnM8r+p/xuy4063i1jHQcZ/x6EG/cc3tcp2
   bVyjJ6nOwuaz7am8+GEdGHuEW6YyJklflOWrUduZBmAKDtCyTDl50xNER
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RHypOB1ovRrM0Csm79JYt0QzHqe0E4Voqz5gdNpzGycyu0aPYUSJeVj6rzp5YKDnMsV20jbOOS
 /t6cGb+8r4T50XJg441HnZWA1PwX9JwNDCnOi3IIAuuaYnRpP9bUVoeseOUoH5RbWhlta7LOFU
 /t6iouM45hQw2+KwcTuKjx/c6je0Q+46V/qnzEio6Kjo2kjURZofgvmrOgDRlNlbBeMuAKB6cc
 /LVGzLjAlKydbUJI8Crs1ukmyd2gMRXoOftSX7k+fdXOTx3pX97jVwiXMK87cBT5vT2Il8d96l
 YhM=
X-SBRS: 5.2
X-MesageID: 36190760
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="36190760"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+RngISkh9Sx1UMHgEvUSsQXx2upkPgCEJcwsfXI786E2seAvL7d9l/RY347TmKYInbqmJl04mvbFhNVy4mV8O4jBzs11HGV9qhMBbau776Y0bWJoKGTzvKouD/iDUWP9KgkH6YvUDgDv9CzUISJlfNgV0BU83YUUHHWrFe4v0OoiF/Q8QR+x5TWz2ixkDVjrei8igeCXt0ohWIXGKx66C6qn8IAlLSBSIuvabg5c2SaXnN7tURRwx/cOCarEMbTaUmUsi0hToiBpmJKgSUFg/JRA+ItxGFUtATV2JG0F8BSz7Arx2bRtSagSHpf10no3lVRzyotTM0cJf3dr9gqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crx3cuIwod3xazuKJt4rxZjKHBQuTKCwYOZjvXcf7Vs=;
 b=Jcdoq4Z0SK3wAdVEOsXbJpYM6zImKhw6+lrAUAcCRnBGFMLbOEY7xkR3y+MNqKSBsBbjUEL7u4GaubgKVNOPfYWiJo+dNfLcd0E6gxJsnPvDCKQi0AcD5dh6bgmfkqGZmcbqcsteOu0KDTcSREMoPJvIvyfEUW2Iro0aeixPibSusoKBd89IODcqqusnp9LkaK2dZDPEni3Rx/JZ8Wqj0GaHBMMcgJEK8XhCng7kH4iM/yIgsK5woaUp2ADiD9MzLGfvTj7IAx8ysOG9XiWq0J8N7A2yXkNMSwgUNtOVWev0QaqWAUimjAM2dCikklEYvmjbuy+1Oe7dc+cFavnVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crx3cuIwod3xazuKJt4rxZjKHBQuTKCwYOZjvXcf7Vs=;
 b=sCB3dDgDXBURltfz1GSJOrZJam97kG4bv/4Mm3ao9fLREvS4AkD4MXz0RlRQ1B1o62BN+JPz+KE4lhzvq3CZ6ZNzIAYAfaT7nK8cMUeSSvuLb5oF1Y0cLaAPDM6xDvin3thbUGQm+N/HjvdIXHcHuK8TZlZD7LPQ0bbexirkIEs=
Subject: Re: [PATCH v10 07/11] docs/specs: add missing definitions to
 libxc-migration-stream
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-8-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <60bd407a-1308-4311-c39e-69c37e27f186@citrix.com>
Date: Mon, 25 Jan 2021 19:28:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-8-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0130.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::9) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32c11465-6ee7-481e-6a9a-08d8c1676e2b
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5662:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5662FFB00A2519A0061E5566BABD9@SJ0PR03MB5662.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hi/sCcvXqq2YLR+Cjii1h8cVDT42hzjYEm2+Iw69FkCW+lP/+5Vmnc7+NT7NQ23F7zI967ThmQ4/P75Az0MlMhKDUdR28H/JkDDg0by5Db6rmkVtAi+062Uet0f9xcbDMKMCF9nBVRMsz6Kh6Zbvg7Ghc6iBPJTDQXdo2eSUiEwbDd3bevhuFc9Mbi2CAthvxdi6yYFA4wh1uRy12iJll+ldp77uhdXUdTWBJm6DW62F5SBKYxqLQAVxygzG2JTIHmvZvGhbk5UBZOxNSyB/IhkNIJ1QrfCdUJr8pOLZp15E/AAiMhrdRKZYaVKTSKbbQq4212uGvCToRUC1gXe7YRwtwB6sId3Ug+BGLqqMBBiJElCK4ZHLcGcwyUezbofsuIoaOxrVx9d39PVtBcqxEiFRjY8yGfmJ/5WWJgUH13FBmjHvimZDlj0Azk3flbM/98V7ZuVYz1cR4LCYhqD6xTKekNEdpvRwdm63x+Z3zgg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(4326008)(66946007)(86362001)(8676002)(2906002)(8936002)(26005)(2616005)(6666004)(6486002)(36756003)(31686004)(54906003)(956004)(53546011)(186003)(16526019)(478600001)(66476007)(4744005)(66556008)(31696002)(5660300002)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2s2bDk1UmlZWnNkWVZISXNsMTZONmxlWnVENE0yaUhEaGNpTmR5MmZXQm10?=
 =?utf-8?B?S3R4ZEZDVlE0eE14WXFjd1RDeWJXUERZY0kwMlRGY2lFRW5BdmZ1U0xXSmEw?=
 =?utf-8?B?WU9rUFJFK1ZoMUllS1ZubmM3eDRkc0Nlb0c1YXpTNzJ6c3diNnRlWkl4L1lP?=
 =?utf-8?B?NVpZTkJGZmlqSzNUcUJNWFoyZkxveDdhbTFXdG1BY1hjTE54cEpqdW54SS90?=
 =?utf-8?B?d2hXSXVhRVRJSG5iUVZudEpESUxJODh4NDdtclNBTDUyNEtMOG5Xc1FxTEto?=
 =?utf-8?B?RFFtT09jb0kzR29ib1l0aE1RSC9iOWhPQjgvOGZZaDhOaTMzQlhZb2toZWZM?=
 =?utf-8?B?RFh5K3owTnRhekRqRVFGQUZSdWwwbXk3TzVTU0E1OE5pTXJwYmY5dHVNdmIw?=
 =?utf-8?B?QU9yYWIrTTlkWUl2a0E3VnJCRk0wQlhyQ1YyUkRKc0k2Vm5GbHgwK2dmRGV1?=
 =?utf-8?B?VCtvdjBjRGF3My9FcE1ucFIxK05uTnJUeEZReFYwQUNFT0k2VkxXTlJ5VVlW?=
 =?utf-8?B?UDhDUVFzaUlIVlVmMEJXOHNjSUhSSWhwdzU5cXA5eHVNNFN6RVk3MzhodFgw?=
 =?utf-8?B?SFdmMkkyMUIvTXhMV2NyWEhodEtMWnp2WXJjanEzNEtEOUJjS1EzWnEreUUy?=
 =?utf-8?B?cDhWdWMxajdJS251cXJoOUdFWXBkc0RRYVFaa0FadHp6d0FhUkF6QWxxdHow?=
 =?utf-8?B?bEtxdXUxRm1Gd1hYblByU0NjQjJmaEJYRW42enNoZEdwTW95SkxyU3hQRUh3?=
 =?utf-8?B?UlhmMG5qUUhGaXlHUG1HT21IbXVmdEoyM1ltbDVSRFE4UVVMZGhWdjA1bEVD?=
 =?utf-8?B?THEwSHFOOUlNbjI5OTJsTFdRZ1ZPNktlVHFLeFc0LzBZaDVRYVR5QWNmYlFT?=
 =?utf-8?B?WVQweFk5Ty9KYTFBQXFZeHZaQU16OStvTllYb3RTcWozWCtRbFpkc2x6YTZk?=
 =?utf-8?B?bXU2WWQ0a3Y3NlNqUHVERkwwV0J3bTg1TVUvNzU5VTJ4Y2wrQTlPVlA5YlFZ?=
 =?utf-8?B?SVRWY0s5NnNydVFQOGFldVBhV2RxZWhNZ3RUWUhwQ1FVd1FlWGduM2h6aFFM?=
 =?utf-8?B?VTdFNlNsVHp4bysrRitJTzFPZDIyRThYR0JDSGhBaFdlTFdMUEVGdXY3c1Yx?=
 =?utf-8?B?dk8xNGdxSW9RT2JvcjM3QTNHMnpBSkwvSVdLZU0zTUZJYWRHVUZ5aUpWbWZa?=
 =?utf-8?B?VVJCY0dIaXJnemU4RHhVb25GSHVOTzdhemgxc1B5UFFQOTI0M2VkczhHVjhH?=
 =?utf-8?B?bVV0Rkd4S01vVHRzNFdpeEowWUVmcFYvVHI5S2MwbGthd3h5YzlrVjRMME5H?=
 =?utf-8?B?Z2YvVUJJWlJNVk0zdzR5NXBkRlNuR1g2V0RpNk9adEsyWjd6RzRQaStCWTlK?=
 =?utf-8?B?R2cwd1NQK2F6Q2MyWVlscmI0RkEwelk1dmlVQkxCaUplM2h5R2NFNmFZaUQr?=
 =?utf-8?B?NVNNOGtUOUUvbDhnMlJqZ1dVYVNRRkdaQ21QdmpBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c11465-6ee7-481e-6a9a-08d8c1676e2b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 19:28:44.8205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Fdi333C397U6EL93T9UpnyGzCHsIs7uOPyjfKGLkjFjfKMVCnlXt+HHhOxxgwzmlQtFNy68UB66hJFWY5Toizwm0qZtM81lfaK/7TWiFBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5662
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> The STATIC_DATA_END, X86_CPUID_POLICY and X86_MSR_POLICY record types have
> sections explaining what they are but their values are not defined. Indeed
> their values are defined as "Reserved for future mandatory records."
>
> Also, the spec revision is adjusted to match the migration stream version
> and an END record is added to the description of a 'typical save record for
> and x86 HVM guest.'
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Fixes: 6f71b5b1506 ("docs/migration Specify migration v3 and STATIC_DATA_END")
> Fixes: ddd273d8863 ("docs/migration: Specify X86_{CPUID,MSR}_POLICY records")
> Acked-by: Wei Liu <wl@xen.org>

I've committed this.  I have no idea where these hunks got lost, because
I definitely did have them at some point during the mig-v3 work.

~Andrew

