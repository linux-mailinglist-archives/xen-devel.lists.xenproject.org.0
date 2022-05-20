Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F452EC9E
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334122.558101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns26A-0007Za-N5; Fri, 20 May 2022 12:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334122.558101; Fri, 20 May 2022 12:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns26A-0007Wb-Jv; Fri, 20 May 2022 12:51:18 +0000
Received: by outflank-mailman (input) for mailman id 334122;
 Fri, 20 May 2022 12:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns269-0007WV-4H
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:51:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8949544a-d83b-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 14:51:16 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-mZRB384WMIqcgr_KTfg2lw-1; Fri, 20 May 2022 14:51:14 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3939.eurprd04.prod.outlook.com (2603:10a6:208:11::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 12:51:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 12:51:13 +0000
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
X-Inumbo-ID: 8949544a-d83b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653051075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zt6DIOpsmTW6jf+rRgcJ2dV3ltRHop+tG8FkJT5RAVY=;
	b=DNx0kak2Ab0hGJODm+UjDynYPU1HRc2m1sS2RaX9m00ekvAZ537gs/x7JKLWdkn7HEStV+
	3VZ+PbR2BdNdGXVAv1dy124uRDL+mjCXYg68iMSgwZLIHU/iw0PREj5+uWdXmguG6Q2J+9
	kQRg1UnFJPegqnxfJPbfgDpQoaLmMEY=
X-MC-Unique: mZRB384WMIqcgr_KTfg2lw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7nGei4EokwuJUIZyxIJiKw2+kvpLHaRn/TxFXqolvvlTN/g+4n7GoJuVOfw7+M/rb6I4YEh6/DPWZlpeROP/mdRXKrjDh6WdqxIYaNmrPT2IrWrtnMOnObnxF7MwSM8PAxjwgJRj41g7+7upWAkJRMkU6wDScL4jQesJas3JoD4HqgfOlVLlQzRL9alYrFDhye7Arb2UbmUVLqyngk6vjv0rFY2fZ93iQyJ+Bid4/ZpEjTnq6eZ24vzX8ji2c+KfV4Kxkr7DF1jZMZ8khcShNI61NQ8sgtqVoUSW+sWQQHEqbOHIi8wFqQJJ//kbbaPS/7CiVU4tkcP4VL7dFo+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt6DIOpsmTW6jf+rRgcJ2dV3ltRHop+tG8FkJT5RAVY=;
 b=cSllIJJ8IDo6Fc6eoAfOwaU+HE0VjybUzCHja5OOradKZS2/u2TMMfO33oDSKeullaq0dQBhKLBXMUbpgQAlqBbcfI24htr2fk5o3sXEBOA46hFOvap3hbKAVqoAvMaqr9jrdQykkr2YblgtWfHpWBPYASSFSon816upHJ4BhCY4CJBdUywTX/lN1Ve7esFhAU7zuS44aqLlAEq+19uidBxc4Cd7w6XjsQNyJ/ln89dytp1686/uKLtAM72gdypPtBrYxnjuccRIx9xRgAUNhufrjazy/CrYP8fD9nE0T0JHo81tJ5DPcO6fFVaTkgGdJkHuQ4Byt4KQUKY/xKiPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c630ae8c-ee37-a678-4c6c-f0f9c34f98c2@suse.com>
Date: Fri, 20 May 2022 14:51:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] build: Fix make warning if there is no cppcheck
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20277da971c1050d0464410e24ecff9d5d659990.1653048581.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20277da971c1050d0464410e24ecff9d5d659990.1653048581.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0010.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e702e45e-3ff2-4fc1-738f-08da3a5f6bd2
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3939:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB39394797A3FBA4FF8EF51AB0B3D39@AM0PR0402MB3939.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vIdhuzuarx3kxF+G4nst93RVTpvk78eLmYji17NxBq7j9bBiLkJVHEi6BGMjx/6fwTfWodp9XgACx9sunwzrcltKmYDRl64MUVK1+wUlDuFpIGi5RMMFeOatkeZVLKTE3iQ0Rk1BEDYRLR58u3N9DGMC1jDTeiKyZZWBy7Oo77MFatLPFVdg11Zb08ECXlSc5P5EsYhgWqlTskVc20Ly8VxLaBZKK3q+EwrlFGUbdR6bTa71uc/u4rKzrLThaxLr3E+TlZLHhsZybF2amZ4H9xZbXJFvye+LPQmhbqCqcJ2YZIT9Z9wwau+Q4Y+5YNJKe8Er7mqJkqigRNOl+UMk6dW2GK+C2gWcJsAHosvD2GDOdlcrfxlDsYr36MUJbmtIYFsA/lhrCHF00nEcDvxQPTm6dsol7fLe7gdldlEkVLXW1PSo2mn2OPrB3uSj4UvLTS4vPwue/uxl5Byck9qYbyfmPSPTTGs/rVljMKfI3zrCwsK55ih781VrLxAGYbwtqzaWyHusprga5YH2qKbNNr2HNYnsRXpnkDgIY9ZF2JEPCvkR4JQDypMiDc/Ipp1VVb+sclNMNDgeWmNkFLZJEMrsPZRjO4Q/2XL+NtGeEbgIHAhoEJYTXUmXwO3nHrr4pcwjcXRIuiquYR/+TEj7MxW9xoaRi2uhqHKkHFFXsFy3qHKqCBF35zcHiVEymXuWaHFyN62NqAxVY1Yz8fIeFzUx/jIwSTXRvc8fpLw42Ug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(6512007)(31696002)(66946007)(26005)(8676002)(4326008)(2616005)(66556008)(508600001)(66476007)(8936002)(5660300002)(6506007)(186003)(2906002)(316002)(6916009)(54906003)(53546011)(31686004)(36756003)(38100700002)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzU3WCtVY3YxOUI1bkxkU3N3Vnl2ZXF0cGh6R0dZUDNOeitDZklxa0RoYUcz?=
 =?utf-8?B?cEJZZVExb2FWaHR2NnVBaGxoZjg5Z0MrNmhJd0kraXl4QVRkdEJjMXFnN1pk?=
 =?utf-8?B?WTRBanNBZVVwMmxhbEdmdENsRUVyL3F3RFcza0VNSXgwRFEvdG9EbXJsT3Iz?=
 =?utf-8?B?SnVQRVA3TEpVTmgraStGaVVyQnF3dlhVT09aWStwb1N6SEIvUmVsNWVodmx0?=
 =?utf-8?B?OHN5cTJndENzRWpkN0wvQUVxNWNPSndkQWFGaEQ3dDc4ZkQraEhUSURsMkpp?=
 =?utf-8?B?NHJXTkpUbkVlelgyMUY5dnJqSUtGUWp3VkMxSVk1R0ZydWd4VTllR3pHK0FD?=
 =?utf-8?B?djJGcWVKc0xramZPaXFRZ0tuSy9oVjRPYVRFQ0NxTFB0OStjQTkzMjhtR3cx?=
 =?utf-8?B?d1ZxK1Zrclp1YThsYnpSWElCNTRlZUpjM0UvdXN3WUtXR05XNW5BaTRKajRN?=
 =?utf-8?B?aHVqY3R5dkluTGlkTXF2N3ptUU9iekcveHFsL1BxZjhET0lEdEZJczdNekZo?=
 =?utf-8?B?bzc5eXNDYjIxL09CaUZCMGU2RmNOYjBCVFhkeWt0clI0aXVZNmNneU1HZHNh?=
 =?utf-8?B?MGVnNUVOMkNwRVFYUzJLWUZlVFVnVEpqclpONVRGdHB3d0Jhb1FRUzF6dHgv?=
 =?utf-8?B?UTRub2ZMQWU0c0NyY2xZU2xkeTBxMjFSNXM2VXFKcDY4VnBkM1ErM01RdGFj?=
 =?utf-8?B?MlpwcHdYczd6dXh6RjR2QWxqM1R2Z0EwL00yZW1lYWFxcG1yaGJBSm5tV2ho?=
 =?utf-8?B?d2tBL1lRVUpDcDZERUNhaWpWTFhYWDRoU09GOGs4OGtwbUNqQkszMFA0NytG?=
 =?utf-8?B?YXo3eWE2RVN3ekIvU1k1ME9KQXB0NXBSaG1Bc01SVm1kWFJPMkltc1FwM2pU?=
 =?utf-8?B?U2JrVmVMODBLNndYeWFidERyUEw1UGIvZFlsREk3Mk9hSS9xWC9yMUNhQzFX?=
 =?utf-8?B?cURIT3I1T2NZNWUzNnl0bXl4bWx4QlR6UzViT3BRZVhRVTY4ek1QQU1vanJk?=
 =?utf-8?B?WGRGR0xLN0tJMjQydHVXbHpsSkRwWVh1UTEzbFNIbzAyTTZGeDc5eEk2UlVN?=
 =?utf-8?B?UldwakJFY3hZZmphRitFR2JhY2hWbDNKYWJaZXZZZEtIU3hHV2FMTHJQaWxK?=
 =?utf-8?B?ckxXWXlFUDF5RmZVald1aElEM3J2N2dwZlRNWWpJTVE0TFJMUXFvUjZOUGJN?=
 =?utf-8?B?UGo5L2FwK0x1cHNjRXdvcWpVaEhkbXFNV0FqWUlpMk90RG5lYXFLZUNScDdJ?=
 =?utf-8?B?WTQrUnlwb3V0ZXQ3L2xWb3dzMFJHd0ZGM1VXcEJ4Wk8zUWh5UGo0OFNsWlBh?=
 =?utf-8?B?NXkyOXpDaWl5YVdjZDl5QmYwZkxmR2ZINE5yUEQyd2o4bThySzJSSWJOZjlZ?=
 =?utf-8?B?R1FvOFhXdzd3SFVmd202UkVRclB0MDZ1V3VrYmdhd29URmFwOFp6b3lnL083?=
 =?utf-8?B?SGVPc2VpMjV0QVpoN203OTQyd3h2WFdwRmRvMHBOK1Nzc2dLbEtIdytJWjFT?=
 =?utf-8?B?Qkt0ZitzYWFPSG5vNmZpQTNsWHpPOWRCc3lmRUtoeG5YMG16K2dZOWJ6b2xK?=
 =?utf-8?B?bG5wRmdZSkwzM05kQkpGRVM5WUpYNXlzT3Y3VCtVUDFITUlHTnNzdWs2c3o5?=
 =?utf-8?B?NC82TU1udFFNVGpCbnVkRjZkUjFpZ0dkM3VlbDVJU0xiWjBjNmVUWGpIeTNr?=
 =?utf-8?B?d212cTUxUlcwTklOWFlvdHhESnlYK2tReTZBbzdDUDM4TE5ldFBROUphaWR3?=
 =?utf-8?B?dmdhdHFSSm5pU1FqWEJKZlpKZ01MT3BYZE85bkR0TnIrVG1wTzMvaEdXNngw?=
 =?utf-8?B?ZWpYbmNVOGZIc3BWcC9vU0lCaHJDUFFWWXZxMWR4eFluWXJ6eFByZURpRllq?=
 =?utf-8?B?QnFpUVdJTG9FdXRMUHQwaFdoaFFwcThQMEI2OHpZcVJma2pBSjdWUG1GOTZ5?=
 =?utf-8?B?VUlUYUcvMnhoS0p0eTg4WWF6c0MydnJBVmZFUEpoUGFjeWtBSG0xTHBTVUF2?=
 =?utf-8?B?alEyeHYyZGY4cTBaVms1cWVXY3Zjc0FWcjF5dnRtV3U2STJHOVM2TzgyUTBS?=
 =?utf-8?B?bnJtdWplN0Jhd3p2Q2ZYUmdYdXlWeHdvb1ZFbHVFQ3pGM0sxUThtVkxVVTFM?=
 =?utf-8?B?a0lCbU82K2RnQkFFQ0o0aCtRZytCVVpNeDk2TEFnTzgxQTZ4N2sxd2JEZjAw?=
 =?utf-8?B?Q0hDUGRoTlBhQnplQzg3S2ptQUlBeWxWblN4RXgvSDBMeXZ4Qmpaai92VEQz?=
 =?utf-8?B?ZVBveWhsYWhSWXNxY2VpeWhubVdzbTRLdFhYWTdGd1o3bnZjMXJwaXJtYXZI?=
 =?utf-8?B?ZFhmczJ4YU1uMkRLemhqWW5nYTA1ZlltSGt6YVpYWE1tSEVCYmMzUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e702e45e-3ff2-4fc1-738f-08da3a5f6bd2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 12:51:13.3011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQnBt/JUaeC0J4vw2wDMLosCis/X5yGa8mcma8NAW3hFxi9enoHCBt8WpYi0jF/MkRwlwiwGBF1ynN322rVKZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3939

On 20.05.2022 14:14, Bertrand Marquis wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -694,12 +694,14 @@ $(objtree)/%.c.cppcheck: $(srctree)/%.c $(objtree)/include/generated/autoconf.h
>  	$(call if_changed,cppcheck_xml)
>  
>  cppcheck-version:
> -ifeq ($(shell which $(CPPCHECK)),)
> -	$(error Cannot find cppcheck executable: $(CPPCHECK))
> -endif
> -ifeq ($(shell $(CPPCHECK) --version | awk '{print ($$2 < 2.7)}'),1)
> -	$(error Please upgrade your cppcheck to version 2.7 or greater)
> -endif
> +	@if ! which $(CPPCHECK) > /dev/null 2>&1; then \
> +		echo "Cannot find cppcheck executable: $(CPPCHECK)"; \
> +		exit 1; \
> +	fi
> +	@if [ "$$($(CPPCHECK) --version | awk '{print ($$2 < 2.7)}')" -eq 1 ]; then \
> +		echo "Please upgrade your cppcheck to version 2.7 or greater"; \
> +		exit 1; \
> +	fi
>  
>  # Put this in generated headers this way it is cleaned by include/Makefile
>  $(objtree)/include/generated/compiler-def.h:

Fine with me, even if - as said on v1 - I would have preferred $(if ...).
One question though: Wouldn't it better be $(Q) instead of the two plain
@? Preferably with that adjustment (which I guess can be made while
committing):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


