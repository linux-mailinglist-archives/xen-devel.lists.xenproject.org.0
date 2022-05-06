Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A5151D11C
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 08:14:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322615.543996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmrEa-0006XX-2z; Fri, 06 May 2022 06:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322615.543996; Fri, 06 May 2022 06:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmrEZ-0006Ud-Ve; Fri, 06 May 2022 06:14:35 +0000
Received: by outflank-mailman (input) for mailman id 322615;
 Fri, 06 May 2022 06:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmrEY-0006M6-LK
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 06:14:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc456f5d-cd03-11ec-a406-831a346695d4;
 Fri, 06 May 2022 08:14:34 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-P8U6oUfjP7-FqdII_VHThw-1; Fri, 06 May 2022 08:14:30 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB7871.eurprd04.prod.outlook.com (2603:10a6:102:c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 06:14:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 06:14:29 +0000
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
X-Inumbo-ID: cc456f5d-cd03-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651817673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3G2EPdRZbYZXLcg0XbTX+qnuH8xgX3vTMGts2VbuJfs=;
	b=R9KBUAr+EkfI9kTJkXHE2YkzklPkE0VL/z2oH/09xbLwX7KYqNAAkshGZxSKuMwjpgg2IV
	yZ1vpchuTVea6T9GJeM5oQq89WTkdev3EpimfAVKKyfSs+U4HQS1ZgxrL0suROghqJdiTJ
	dUOpsVqJQhkkcx1ZDOHeeyzdB3v1oPg=
X-MC-Unique: P8U6oUfjP7-FqdII_VHThw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSi7xsyivMEA/FuMg07VONv+uv6dJWwff0C8YHZxISHjEtNuN8rE4Ro1eIBYZsecqydCObiEJwASgcJQ9pY5UUq/fzTwCZmafsnzyYAkRCBXtFWxCer+X17ypaH02zlF5GsG3M/4Jch9FBfs/4c+mCQRH14LpblRLa9Vp7w0Ymj17wPt+r++GJMd9eLcindvjSZEmdXQpIIrQcfC6cRpOuktk70IP+S6dm5GYlpHU5lGqLL6+c5IVVQmeGW4t27yFC+vLVnmv+nFXsJ/lsnETkws3afPoPQjg6F6sdfOdNOElQXbBg1I/zmuVtgb7VlmB5cfNeh+ancmceVbm49FYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G2EPdRZbYZXLcg0XbTX+qnuH8xgX3vTMGts2VbuJfs=;
 b=GRzZmoXyxfbe9v7L7TbNk8tLDst2YaYSkGnUrf/lSvnawBYkdIwfJucfyMBeqX3E2iZweaJqN5sRuAAq5rj7lciB9WT8/YNf01v4oEwyvBv/RX0eQFSjca8uSBQsjlRNQeUVc8M0Jk2ieovqgyJKMOnw3fMtOYjBulLDQ3cwUdzYf7oXhvm7hK4UaaRPO8g3tGsVhLa6yJsf0qXqJl2yGsscNWP2TM8lw0TIJ2AKTeuNbv8EhTWvbG9cT0BRE8Dsjj/IuIVwVbjJ/ueLBoGS9KWLYiNk2c3dUDIjiMlkNGdnoFTeDQWzY4NMJxZ/gG2ahb33q/BWhxfMADAtdw7cNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6eb6f0d0-ba46-9d4f-28f1-9612bd876e9c@suse.com>
Date: Fri, 6 May 2022 08:14:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
 <DU2PR08MB732544E17B308416A77C97E0F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6ee0b5b6-e099-c17f-48df-58ba1deb4066@suse.com>
 <DU2PR08MB7325CBB8EFD65D2BB64E92EBF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <306532fc-939d-efdf-047c-7b8556d40738@suse.com>
 <DU2PR08MB732520F0DC6CC52DD00FE481F7C59@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB732520F0DC6CC52DD00FE481F7C59@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fea9d53-1322-4307-97d8-08da2f27adaf
X-MS-TrafficTypeDiagnostic: PA4PR04MB7871:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB787157CE5C7ABA16FC73DAF9B3C59@PA4PR04MB7871.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I1tFqVVdFb2SEQgefuypQ8Y4/To/DYQLYwunhlqbf6R9eA60GDniDzq4YFSATn7jj2Q3BM3AX4VEfkoU+10daAtlau5AAnn6PrjUaNXRHTi7SvOyGveB46ANHqgnWi84Xtd9rD15qauLoCn5JgPkbnxzfGgkMXageFYoHefvJR5tscsHjQkO3XsqOCGLpknHiekOkObANQSaM6NheWAvNkt1YsRPbEBoDVn05/1lomyWBP1ZpIZ/CBrANvtwncAnv7kZ2fIOYU7tF89w5GwmpZMdqzBhjBvAF9qEgmRhdQymmtsr1JM/0D84s86bl0wgaPjhLUHp58oKdr81IOAnWqPG8lqJwNU0AV49fabsY+b1Go4f4O9CtY2NfRnJx/Ng3MfMof04/oYVjRfygr0fZUbWkG8aaBn8TdLGf5n++xunUUUE+sJWUuJnoQ2hfXSAQcl7FPHde4SR35f5B4U88j/s7P9LzJRuZme6tEGQQk9R39OdA/10PV2PBrSJndB/RWupqO3J3BXSegS9XrpbkuLVi540Gr1koSesU4GWg2NiQSl8Smp09cYUEElFZ/U0yX+P27p7SEglJhqyMnYHoKiBgrvk1vfeyNNX2HU9FYtxYhhWEogvsP/CxvuF7oYPPxuySOEiRyEzivAp/1TqS5i8K8pEAVP5PkgAa0P34HK8vn4iFHDAtbLorI90bh7CkOBnzmGqriYp0YQ5U8IuuneAU0gB0/NTYErsoVqlt3ibvxCpXunkeNa0GROSxszm9mEE+Rp/MuHKtK/UHX3HCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(31686004)(6506007)(8936002)(2906002)(38100700002)(316002)(6486002)(186003)(83380400001)(2616005)(86362001)(6512007)(36756003)(5660300002)(53546011)(66946007)(66556008)(8676002)(26005)(31696002)(66476007)(54906003)(6916009)(4326008)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elgzeU16cm5id1pVL0VLVFRYY2pUYWVjUm9wV3JkY0ZtYzFoMXgxNFVUNm10?=
 =?utf-8?B?WXIrcEd5TGlKV2Joa3FaZjJ6T29nY0JvRSswbGQ5RXFIQzZRcXdWWlhvNWhZ?=
 =?utf-8?B?NzQzdTZybU1PQ3pYalMzOGhBaVVlelNOeCtZZFZ1clNRSnlUbUE1OTI0U0pk?=
 =?utf-8?B?UThvZ1Ria01qU001TjkxNDNINU1HZ0RlZWpjNGc5aXJXUU1UVFdBVFd2aTdO?=
 =?utf-8?B?bGdkYU5rUWVObmZPQU1CRzJWUkdKdUdWRU5QbjRoRkJ0d1RUc2dVcmNkcGxW?=
 =?utf-8?B?b1F2THhBK3Z2UHBpNTNkQTkxWHo5UVdVSVBGRUJpMzIxQXZVU1p2RWt5ZXVx?=
 =?utf-8?B?TDdHeEFEK0tQRVRBaEVYTlU4ZFJmcVZjQlNBUHc0Z1RlYjBIcGxHOFlHRVlR?=
 =?utf-8?B?YnJta2lQYStBL0tKQU45eitKU1UzWStFdjlxdnRmN0ZNTmNheWdidDdTWUhv?=
 =?utf-8?B?QmlKMHFLd1pVYWhmVitjZjhBamJhb0owTW5STU1sYnh3V2Y0bUUwMUNFSFJK?=
 =?utf-8?B?anQrZS9tR0cxZTR3Y0VtZ2JLZmZyemwzNFQ4bkg1TnlLK2UyUUlUNVRobzh1?=
 =?utf-8?B?dHVHYkl5MUZWSyszNGFvVHNONTBWQU5Ca1NBWXBoOEp4c1dTU2N5U05OVmJD?=
 =?utf-8?B?RitacEM4cU42QVNFaDVvdHMxMm1vTGZtZE4wVmt4NVlabldTNGd2QVZvUzJP?=
 =?utf-8?B?cXVOWXZvNzAwUW1tV25OQXZjVFNaVTBJTkpQc3VkalZJZnJ0ekdHSlZCMkNr?=
 =?utf-8?B?MDZhMGV2WlVKS1ZSc0grbGNQVWI2UXZtUk9oK2NkNDlnVkwxV21hUGc3Y0FF?=
 =?utf-8?B?dGt3cWlLemZPZ0dCRngwcFNWYy9TQUJTbGR2UjQ5Tm4zcXZZUm1sRzBwU1hN?=
 =?utf-8?B?RlZ2cVIwWk9heDJBTW9TdzE4blFPN004Mkh6ajVyZWkvTHB2SUtibWEwcG1S?=
 =?utf-8?B?RFZ5eWI3ZVBSY2gyOXlTK2ZLYmpoL01lcG51VE9salhJQXhXelZTdnlKQXda?=
 =?utf-8?B?ZjRaV3RSaFY1U25JNGtLZWRoZ2d6R0RpQUtKUmZSY29pcTBPVmlKTG9kcXBl?=
 =?utf-8?B?b2dYZHhUbkJMYWpxdXp4aVM5WDFBQlY1VWVDZXkxdUlOVEtmUm9lclNkL1NV?=
 =?utf-8?B?UkJrdjVrc2x0dWJWSjcrcTQreHVYbVRKY3UxcDJPSXYyeGVzYVg1OXNjRy9h?=
 =?utf-8?B?dk5OL01nMWs3OWVWTHYzTEpsSGUvWHdUWEpwK0ZrT2l0ZkVlNXN3Nk9YSk9D?=
 =?utf-8?B?elVWSVkzb2VEUDFocTNsd1puYW9RT0lFeG5acFM4SUUrMEJEbUVJdDdMbnJY?=
 =?utf-8?B?dTZKTFM1THhPd0RXKzZCcWtsWFNjSWRwcWFTU3lZMDFoMXNIeFV1a25MeHVJ?=
 =?utf-8?B?L0doZmdydHBCNllGelFuNUV0RDMxNkJyK1B2QnhiSjA5ZDlYZmNtV3lPWmh2?=
 =?utf-8?B?M0J4VXQ3dVFnejZzZzhLaHQ3QmdmUmt6a3lHR2pQME50M2tWVEp2ZG9vUkZs?=
 =?utf-8?B?cDh3c29pZjc3SmI5OUgrY0pBWWJZeFhzZW1mazZudFdIUThrbHpqc0g4Mjlh?=
 =?utf-8?B?RWl3aHAwdWdZc2FUOVh6RHdXZ1RWT3ZXREFLMkJDa0VQZzdhdkdkL0lVUkFM?=
 =?utf-8?B?dFN4cVNGSzJlendkeHQ2YjlwTGUyTmQ2eVBENndvb1NsMlVTeHpIRlFNWldI?=
 =?utf-8?B?eFdScE1CY0grQUF3YXlOQ3NTeFdscnBSMTJ5U3QzbVJXYVFldWo2dXJSUFkr?=
 =?utf-8?B?emp2VWJDajB5WXY3OWRyUjQ2YUNGM00xQ3VZWmw5VEFPMEI3ei90Tm5UTEtr?=
 =?utf-8?B?V21CRFdmazhwNksvaE1lUXRDeXZpV3MweGNZZVZtcGREbWdiNVdIek5XdTFh?=
 =?utf-8?B?bkJrbG9lWGx4RUtPL2VmRFNXZ2krVnRqMDkrZld6Zk5EUFZpa2FhSVhjd21N?=
 =?utf-8?B?bE5nSi9yNkpoQXdadGpkeWhNTG9LY3cvWTQvWnMzaDNEYXVuYk0rUnVpWkZ2?=
 =?utf-8?B?ZEdQSzNOdkNSL2daWmtLSHdjK1hkczZ0YU5uSmRBNzhLMXhVa2xqU1BLZnVj?=
 =?utf-8?B?WExRYVdFeXF1cHY3VGlmN1JVYm1QdWRGaFZxbzVheVJBMDZsSlVWSjAwZzUw?=
 =?utf-8?B?K3pZeDUxUm5XRjI3L1FSZG5vbmd4NE5ISzQyRjJtNnVyMS9UbU9jam50MHlB?=
 =?utf-8?B?eFRIek1oemZWcEU3SDdmWlU4TFRtRGdWbWtFWlFCN2kzamdaRkkzTXNpZUpI?=
 =?utf-8?B?WURQd2pIMW9IRkdmNWVHa282WkNRcUUyRGVRdTBhWVkrR214UlhpSTJDeGwx?=
 =?utf-8?B?cHJvS3A2Zzh2NHI1R0dBRTJlL0lsWGtrckVzaGFVMGJ1U3BvQWcwUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fea9d53-1322-4307-97d8-08da2f27adaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 06:14:29.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcGL9pW3q8F7BEPP8jn9SFZDhvJNLebDbNNrovCuFKTe8h9xgNacoAUnNwIooumZf6MA2soaPW1/5uKNXvZrZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7871

On 06.05.2022 04:59, Penny Zheng wrote:
> Hi jan
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, May 5, 2022 10:23 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Henry Wang <Henry.Wang@arm.com>;
>> Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
>>
>> On 05.05.2022 15:44, Penny Zheng wrote:
>>> I misunderstand what you suggested here, I thought you were suggesting
>>> a way of stub function which could bring some optimization.
>>> The reason I introduced free_staticmem_pages and acquire_reserved_page
>>> here is that we now used them in common code, and if they are not
>>> defined(using stub) on !CONFIG_STATIC_MEMORY, we will have " hidden
>> symbol `xxx' isn't defined " compilation error.
>>
>> This is what I've asked for clarification about: If such errors surface, I'd like to
>> understand why the respective call sites aren't DCE-ed by the compiler.
>>
> 
> Because both definition of PGC_reserved and is_domain_using_static_memory are
> not guarded by CONFIG_STATIC_MEMORY in the first place in arm-specific file.

So perhaps that's what wants changing (at least for PGC_reserved)?

Jan


