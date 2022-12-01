Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FC63F394
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450842.708322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lJT-0004ux-5e; Thu, 01 Dec 2022 15:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450842.708322; Thu, 01 Dec 2022 15:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lJT-0004sz-26; Thu, 01 Dec 2022 15:17:23 +0000
Received: by outflank-mailman (input) for mailman id 450842;
 Thu, 01 Dec 2022 15:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVjU=37=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0lJQ-0004pl-Vk
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:17:21 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f43ac50-718b-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 16:17:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8783.eurprd04.prod.outlook.com (2603:10a6:102:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 15:17:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 15:17:17 +0000
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
X-Inumbo-ID: 3f43ac50-718b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO2jnw52phmgJWQmD+Yr7tpmY/F6vy9Dlv0FzQv+x3ynEV8igkwKPTIbAEsgjDwqYafTuStqiuKUmEs61vhEgFzND4GVoUpyNZmuxsUoWixJd2nGhicUO+NQiUtWrirHHNF+IkWEzplk9Zo/l0x2bIxQ5pCXNWtH86HpW8bFqxwYSU5G/ulO+W3f0B9ZgkwIK2xhjDWvaKx74wxAzgbEWCVvmzYO50wr6+NQrkMhVffZ0tyTJ2pCosEZhANObMdn6ATz9VtWL3QGQppM3BIGf5FoYRsXPyOJOleTseYwN38TJyrGHGiZRA4/M4z529b3O+20DffLAxuUvAmIKKsd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj0YB9lYypHcboaWuvWlUU4K4AJRltYjViBZorZSRUo=;
 b=ImJdGYhlHC5l7zA5Fg4w3zzSFrUUNxyj4yBNn7eV37sHgYySrlN7cUt02Ym4p730kHNuHKd0m4riqulcDw9AiKqjfc+uBhzjgzr0yDaBNFvt2JqpYrmHDvcRHOIvtxFRjQuyINwykWOzJttdzFsSqWr80kmCbQpo99ESdGFSez7LC/5VQ3w0FmSo+hL3DXst9E29GwwA/dSYwsoPtknk3m56w5InRZN57SktZa7D0AEVR4d1tWpLeQGzGVb+YxJSljaNT9ZNnHrqQ5mrUFeV/O5swadVrUd7OVFqNd2P8j81E8QfdzOluISTw+NDoo7JJERZoLPL/gVRGwcqxFheTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj0YB9lYypHcboaWuvWlUU4K4AJRltYjViBZorZSRUo=;
 b=fhF6NsTtugKyo3qwEgQ64QkcCEKFpxIUtCsfe7Pz/pdaT8dmJYueraLvY63jfp+kjuRxOQ7yHngN/P8RI/NtaWtiGkUwfc68C6sakUtV9nzfN8RDuHeUKwMjnVnLZJ4KRHWEuehK4rTnkFSwiRBEARK7uJrCrJbwZ2shCv4tiGH4qTOJVm/SVxAqntn/AT/C6kmI50lFY5V0TmIJmcSZIhADD2kHGAiARckQ7Rq9gJ+EeYt7p8chUNYyLMsrGlptNQAEHsekAW0Xlyv8vU8ARLNnp/HXB7qHOhgCUKzOc72ox+dfh6uu8BHYgN1zjTt5mWlmnGAWvlTwDBRQMvOwtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <791303a6-7b37-20fc-083c-be8083c90014@suse.com>
Date: Thu, 1 Dec 2022 16:17:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Commit moratorium
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <3deaeaf4-dd5d-93cb-2ca5-3c22e2c19bff@xen.org>
 <16684217-afbd-3671-5fad-08057a0e1b20@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <16684217-afbd-3671-5fad-08057a0e1b20@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: cc247060-7b4e-4c4a-ff40-08dad3af2239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ujVeSPKfGoh0WMFaNjoflF+cUoveOFEqxmYgsa9xhkhLxoGRZtbezErmHJjMWp+GcdTClNXOzhb5BHgfOxXn/icVQH1ukMohblqi6a003t1yx/c5B8Xq24uYRUDLWTFLrgejPJwpo0BCwLCqEsdI+jEnfYTL1ORXV5Gjo2J10gL+1bI/RqVjGansuP6g4NEt+SwfS1lfAsgZZFbT6rH3Xcsqmc4IgFr1VlzQpdt7UVsvIymF2PLlCCM0NVhuDPRpznkKiCmwBCXWj7TwwZapMYlxYMxeUBXswgjPIDrNeSMTiXZFwN+dnGf2Rcr5PrCNBkKhRcEZk8AR1C3yLju/h0BOtojIgKa5hRoPBIZcG+NYubqTGaPdRJDkBI2UabF1or+68nUuOz29anKgqQqWvAAsIPbLPV4sO/n5eyBhMUMP4eaY3Rr5iAa2aalbDhVmrwK1LSKqLJ4MHvaGv3b18pBSAWrqN+C5JN+b5pvNZTxxI1G4gsk0eXYtIF4PrPPNtYfovaeWtnNYgritYZrqGkJVGam7SZP1kjppz1Owqo6VnY9SX0YrSiBvEOW3nhx6cCKmFeSON7ZNT8l9ZdjUYYRFUyF88aTEy18up+H73WX/7ogtGrZu92PNLFPSp08XpFqBnKLHPBAyoXsmH0fzcz9cPIHjtaa6FuQqhJx6zdZSOVmgNpO2DCOV877rB0cIFjEiGqiQ4ymz74+ekyfsqQ/XEIpgFEWY8ruMkB3YoQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(36756003)(31696002)(86362001)(31686004)(54906003)(558084003)(6486002)(6916009)(316002)(5660300002)(7116003)(66946007)(8676002)(4326008)(478600001)(66476007)(41300700001)(8936002)(66556008)(3480700007)(38100700002)(2906002)(53546011)(6512007)(26005)(186003)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDVFY1MxaUdFT0tRcVF0QVJxV1FWSzJ2UUoyVVFKNWdiRk9SWWNSZ0JOa25S?=
 =?utf-8?B?VER1Vlh2Ym5xaTQxRWV3NHRTMUNENHgwYzFBN0RLbXJIYjhhOXdxTmF3MDl3?=
 =?utf-8?B?MlRta0d4TFEvQWNsNUVLSnYxNzEraWpOeWJsN2wzOHYvd2tRUUNtanpCUTZM?=
 =?utf-8?B?bW1DaDBsMU1MV2tWMzJmaFNjckk4SEdHb2IrZ25VeCsyU0tEdUpkTGtocnJJ?=
 =?utf-8?B?RUdhU0lmL2RJOHRTaW5hR0xpZHFvem9DeVhVTDNWREhGUGFWWGRyMDVqMHFE?=
 =?utf-8?B?SjdsUGd0aXhidkRTWXNad1lZc1VFQW1ldHZaOWJPYmI5elFnWG9uVGNqWHF0?=
 =?utf-8?B?SHdGSW5IMDZWM0hqNllVNzR4eHhCdVR3NWdydWlpeEpwUGNkTEozVFB2TDBT?=
 =?utf-8?B?MTZkazd2b3FFS0psQzJ5R3ZFcGkyQTNrd1RyOFh1dk01UTJ0TWR1VlhTbzRm?=
 =?utf-8?B?TU9IcmVYRklIblJWZjBCMDQyNlNDNWlPYlRTVm9PR0VjcjZyOXhzRG5FeWdW?=
 =?utf-8?B?YnFtdjdCMDNJenpUNEJsM2tUcDVMN0tSWC9Xc1VpMzNWRkFyZjBHdDBMZWsx?=
 =?utf-8?B?SlkrUnFlMHV2L2dEYmMwSXIzZ2Raa3drNTl6N0NwRWh5K1Q3TjFzVlFGT1hr?=
 =?utf-8?B?RWpzQXpFMGVObTBJL2xiUXpzMlVFWUk5R2NSWU9XcTlPZjI2QndCTERPd0xW?=
 =?utf-8?B?emR0K2xkVjRLb21kbjZ3cUFYVGg4dGFVYWJZcld1VHBtc0M2WHAvMC9nQmdV?=
 =?utf-8?B?ZmFxcXBoVlVVcXh2dUMwL0dyTjVzMFVCMFg3eTg2ODRnVVI1aWhYN1lnU3c0?=
 =?utf-8?B?VW82MExwalBMRGJpSXBTMTlEb3JHYUNDbzV0bVl0NUxZM09FUUtOaUptTSsw?=
 =?utf-8?B?MTdHaWhuQmdORDlqWnJJZzc5bklObVZDU3pvZkhYc1hBRTQ3N0YzbWp0VVdw?=
 =?utf-8?B?dGJHeG1NK3BCdXR3Zk5Oa2JzY0dWZTMrK2thNmptYk1VVXFKWGFpSittaitC?=
 =?utf-8?B?MVBiN3ZhbmZkT1BUbGRKK1VDdWpTR1VSeHo1dkdlaUxPSEo2VkQxdTRvZTA4?=
 =?utf-8?B?eEFjbitnY2dNN2d0NVRKcFdROXRqSTg2SzVIeVhOaUd2OEdDT0VldWpibEg3?=
 =?utf-8?B?VXI1NSttMDJ4SVdFOCtyK1JBMmJaSGRWb1Q2cFl1Y3p0NTkxTXNrQkFvOTB5?=
 =?utf-8?B?aXFocnp3cll0WDcxSzhnS3ZoNWtVekliQkJjNmVwQnE2enNSREdmMEs5Wm9z?=
 =?utf-8?B?VzlONmkyRDBxWkJmbm9CSDR5TjBzN242bnBNMTJ5b2lEYWJMVEh5VFFuWERI?=
 =?utf-8?B?aVF3SFJmdUM3QkY1eS9PVlR5cWlOUnd6K2tSemxYcWlPOFNhUEVXOG4xZWdt?=
 =?utf-8?B?WXRXb2dvZHoyL1VmejFuVlVwck9YZkZQcUI5WkFyU25EeTZjZU5SYTZPbUVx?=
 =?utf-8?B?UWIxUkVpSkdqbExvWnpLTVUxTmVLdHcrd1FaOFgrR3dJVkZ0bFZiSmlWQ252?=
 =?utf-8?B?VzlTUHhnVGpRUCs1SUJqWVpLbWdtdGd4dXlMckplank5THphWFl2VnBJV3ZN?=
 =?utf-8?B?cm1PTEx4bHlNTDFMTWF4YnU3cFoydzBnZlhJMUVtZUtBdVBWVXVseVI2RnF3?=
 =?utf-8?B?azZhZ2pUd2hzQWpRZER6Q2NTZTFMNkVZMThuRjR5bFZKOWgwR1ppK080cWVa?=
 =?utf-8?B?R2FLY3pqNzl5UE9uaFhKSlhjUTFPVTkrNmlDekxhenUyQ09Vck9MZHAzWWkw?=
 =?utf-8?B?OUIxaVR6TFVOTHVmNlR0WUxMc0NqNzljU0NoQVR2ZTdXS1V0bUQ1OWhhMnd5?=
 =?utf-8?B?cUk3TnBGNUJJVVNnVzg0UXpjY3RjVUNtazhkNWpUNnc3TGNCN3RvSVNsR056?=
 =?utf-8?B?alFHVFN0d0l6V2ZPQVp3QTJya1lHdC84WmFBUlpqNG9DRUNBMzRkK3lCRVBN?=
 =?utf-8?B?RFV6b3lPSGRPMzdjYW5RY0p5c0loWTJXWTA1M1VIMkZjU1JzTEt6WlUvbUU2?=
 =?utf-8?B?MzViTVNqeUZ1WVV6dG02dkN4d1FjNXk2MVV4MTB5SitMejBiSVZtaURlKzRX?=
 =?utf-8?B?Z2NJWmo3emdkRGwxV2tuQzk2WlhZcE9iRlZoeDBObEY1d0FKdHVybENjKzcx?=
 =?utf-8?Q?/tbuqKKolFCYtdPt5UEoIasc3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc247060-7b4e-4c4a-ff40-08dad3af2239
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 15:17:17.5028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axyOekih4drRQuc2OqxlZLZGKfWtlQLSciVUFlxyIx/LQBdchC0FiHDZm2Rf1yi4E1z2eb0EnDND4MXr2Hu5WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8783

On 01.12.2022 15:32, Julien Grall wrote:
> I have finally managed to branch 4.17. The tree is now re-opened.

Does this extend to the 4.17 branch as well? I've committed Anthony's
build fix to staging, but wasn't sure about doing the "backport"
right away ...

Jan

