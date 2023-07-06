Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F17496D9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559703.874957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJq5-0002qz-Ro; Thu, 06 Jul 2023 07:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559703.874957; Thu, 06 Jul 2023 07:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJq5-0002p6-Oh; Thu, 06 Jul 2023 07:55:45 +0000
Received: by outflank-mailman (input) for mailman id 559703;
 Thu, 06 Jul 2023 07:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHJq4-0002p0-Eg
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:55:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81db9767-1bd2-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 09:55:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9245.eurprd04.prod.outlook.com (2603:10a6:102:2a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:55:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 07:55:40 +0000
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
X-Inumbo-ID: 81db9767-1bd2-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O11EvokaK/M0IK3w32tVu1czcNN1HXbYiV76e0q2WaXJhxfCKpcgtvMrUzn0HZ8WZBf7BvJ+SXpUegbW6eWklIOiN8y32NQuex+/OZ7T1FVS15Xbm6wFJQGGTG5HWExT9L7cfUX5leT18eEqFygMNXuGc403bX/lOFELIa6mx6R0yKQnk9594ygQdeuf5p/qmsA3MTTVn0OrAfAKOfB6fD8H5vh7QVCVbJiv0oUkpnIKlXxvwDr70dW+9ZgJIgEi19wos7lxQYHIBDEgvHN2SKckoB7Ys1652MJBTBAuX4HiH1cCcmuI20NpNtI+LSw14Ncl7MpdJmkceFNrScq8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nB3ss0zZcTG4ngDKW3KalbdWIcY/w9BdAoFh5Oojdxk=;
 b=khku9GNXLlY8doHc7QaCKSx62NVlRO3O28BFb2ayvNWYZmRi35SWwvnVr7m3Kxx11al6SyNx+1M9O2Iq7L3YeDKYL0B00g0QNZmdWYsNLCh8chSAqgRwzTHDW+/FxEOiIRZwpAv635ushjt/UYhACF+zdAyOwOEAbNRlSmsDWFb2HOOFhNgP51e1CUBB/GsP15LFq8GRjRF3sN6E71NkiP9sSkfdcLonJjuH9aehAVI6dvMXH7bApP3wrgjAqgyF1EJm8DfZ90tohKW9jFuBGD4E3ybn3Y+/nYCKhVAnUAorMNL0YUIpAjHU+uouwBbNWjgwT+JPFp3xbmJAmAkHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB3ss0zZcTG4ngDKW3KalbdWIcY/w9BdAoFh5Oojdxk=;
 b=MyIKwZHXYwWq7dWY+40QiDEdYMl5Hzk0amZ1IXfPc6r1TvNctwv0W/cwnBvTyhtcHAVoCeFVvmAuw/QbLXJjfPacFsjyQyWaBDplb9mKwnNFRZS1MMuuiwdOMHVZnlE8H0514TiBcHUZJcDpsFKI/EUYJBMeWpXRdlvXOV8OHwnfnO/QrY8dA/TfGpsWTyMy/0tyivyCoK3o6lfbWlAgHd9fvnXd6xeJbhG6qg5gfJOxcRE/PUj+ihWuW5Orb7TIiKg/0OKtCx09eE7wqC0AZisfRJBe+pET/JuOQ+eswhE/8amUQ1tpCd+fXTvxS4UEvGf0b0cueCLpJqfwAuS3fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45dad847-7d0e-c2e5-62a2-f640d9879676@suse.com>
Date: Thu, 6 Jul 2023 09:55:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 06/13] xen/efi: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9a791b84be74d7ca575eb94e070aae7294d95bbf.1688559115.git.gianluca.luparini@bugseng.com>
 <alpine.DEB.2.22.394.2307051635170.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307051635170.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: da5cadd0-261b-4f0b-295e-08db7df66472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nu+iPTfjns9iej1nsceJnFpUYy2lyp4T5ZiAlB4tZrzByGzduzmBYH8oBylQBOWgbl4/vkx/IuOibM+Pc+UIuj2VlICUbZJAhsAB2vDACtEDrBpZm28cfRlTaUZ8CazZdAWoY3Y6iNQUAZm4Cgox1DnVBYs1gRSPJCI62RZ6fGZNvDBXVFaYWrTqp96oX420XcGyRy8rNRCAlhBxGfk2aCYUnTqiU2iblpamxLY4PnkYhK1PPcTtJU853tZWQdiCm42dQD9ClN5ZX+lcRk/M+yfKjl6MSH190pBVaYh5IuEW78prz6GODKJlOidkQ1QVJX+bMY15n9TfA7AQewtuVbV09aYfxFbVqZtUbesd6MjTFFqKm9/cL9eQWtfsCeZ7im/ULB4s4UINAAIEeC3yiPXtQThJwdSX1QBuqmW6NckXBWgFcVvBNi/4f6c7yKT5ntoVt8VqG18r+kCNwmpfd/puakIKANQsJ8e+7lAr7h2cmloByiFBD+pWdTz+S7mpTCrV4LWejHlKxyUrJV4S8gmzkGsBNdDd4mpwG39e1KVl2nz68n9vUBsjqi/0b0FFe6LHOzjew7tWY1cx56KxsUUWpiAnwv4pkYrTgTSFS5creyAwpJ08I2IigxfQSbWvwuNRpXS3O9Z7oaX43bdPKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(38100700002)(36756003)(31696002)(86362001)(6512007)(478600001)(6486002)(186003)(6506007)(53546011)(26005)(8936002)(8676002)(5660300002)(54906003)(66946007)(31686004)(41300700001)(6916009)(4326008)(66556008)(66476007)(316002)(2906002)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZBVG8vbVR1SjV5NjlJNi9vYzF5QkxYdEhwS1dKK3hmVmJlVlNIRWhFaHNq?=
 =?utf-8?B?Q2h4bGpiV2ZBWEJEdkgwWG1HY2Z4ZVJiZiswakM1U0cxM2Y3Z2pDa1kxRWVm?=
 =?utf-8?B?K3N1NXRqS3FHUnZadkk4VzhkS0UvUFNDbVppdTZZV216VkY4MTlIYks5Q1lT?=
 =?utf-8?B?SFN3b1NTNzZmU2xaem9DWVA3eG93Vkw2YTBwdzlBTHZyZ210UUVJRHFWYWJz?=
 =?utf-8?B?UE5YWEF0MzVPQVZMQWZnMzFzVyt4TVJIejFZMXdxQ2dHcTRLbGk2b0J4RmhB?=
 =?utf-8?B?NjRLMFdSY1ZyOVkvUlZXNkRadk12cTQwOFh1bEVvVjZDQTN6V0xOU2xNT3JH?=
 =?utf-8?B?dlZhRHE3UGpxWkhKcXQ2VTY3cHV1eFhIT2dpcTl4OVJDcWNYSWpMeWEvOTZu?=
 =?utf-8?B?S0JZbTlHak1BdTVSS0hrOGdlVEpHc0RGamZWM1R6OFphUDJ2dXNtWVd1T0RH?=
 =?utf-8?B?VllNUHVyTnVPZHd3a2tHUXFIaEVEcGROM3U5akZpUkNrYmJ5Tzc5aC8zSzdn?=
 =?utf-8?B?WEdUcTgxaEF3UFM0SWQxb1hxWU5QRXAySk9ieVhzdHFDRlBqazluU2ppMUF3?=
 =?utf-8?B?SDdNUnJTZm9wTDZMQjhyVjBWdmtNNUlxVk9GV051dzM1UFFKZ1B3YndYOFNQ?=
 =?utf-8?B?SFZqYzdTbGh3OWMyUDd0MjRFODROSE4ySWhoREdDSXhOTi9sS1hleVZiSjFD?=
 =?utf-8?B?SWdxV0NXRDNycVVrdkU4Mkc4S3ZTL3dOQ0hVazAxRzdId000MGdOZTdRL2F1?=
 =?utf-8?B?Z1ZtQmZLYVU0OCtGZUt2MXBXSDZVdmtsOVIra0JoYTd6eDA1UEZvYUNJS0FR?=
 =?utf-8?B?MVdBOGFnLzFEdWJYRWVqU2JwS3RQR2JrN2JoNXNaby9qS0N3a3RpYWV4OVFS?=
 =?utf-8?B?NUlaTEEzWm05ZitNaUIzblI3M2NrZVJXaUlPa28rL2Jnd21LSUFEdE1naGgy?=
 =?utf-8?B?QzdvTDVmU01LTzB0dnBzSDBxSEx4b1VXaHJ4dVpPeGZOemhPT3lQb0tZV2ZC?=
 =?utf-8?B?c3FZMUg4QjVhVzQxTU5mVWxvbGlKS3lUM0xJMUlaOUdqR0JlZE5McUlmZVpX?=
 =?utf-8?B?S1RJdnR0eVcwbFpaZ25kRUZIaDR0UFQ0WkJMV2k5Smo0TSthQlMyaGxQOThB?=
 =?utf-8?B?MGVtUVpKbE5tWjNHaEpvSURMVnZDMzRaSlZYNTN3SlRKcERZcFZuWUVCSUFO?=
 =?utf-8?B?WDByb1V2WDI5ZnBSdm5hSGlpN3UvalcyOEhtVnNxY2Q3TGFFekdZa1dOUjE3?=
 =?utf-8?B?ZG81YnltdSt6N1NmOS9WSjBsMmlLU3hEMUV1dUpLT3QvNEJ1aGdVMisrMlNV?=
 =?utf-8?B?M3Q4MTdoZkJXRElJdUptVHFVQTBiNjNpNnNWNkxSczVqa2tQOUdJdHIrVUYx?=
 =?utf-8?B?VFZkRUpqU3dyOTdPcG02NkpIWHI1cmh0OWZaZXBubDU3eXpRbWNhdHljeWVl?=
 =?utf-8?B?VDJEd01vdGpuMi9QVXpMbm44SlpnZ1dzdzJ3MEI5ZVQ5UzdkeGo2UUJIL0p2?=
 =?utf-8?B?K083NkRnRHVkYnp6SXprUWFQMTNCKzdxbG44ZUh3bHp2dmZuL2JlQXE1bmY3?=
 =?utf-8?B?SWoxWEFNdGx1TnJNTHF5UEt3MkRFUUd2N0UyQ2xYWTlySUErTTlDYUpFdVlx?=
 =?utf-8?B?MCszMGcvSXpRdWQxeDgvQjZNMmxxRVdsWm1kSS9nRk04ZnpVUXZLVjdLZ3Zs?=
 =?utf-8?B?UHB0eVU4ZmlTSFhjR2V2RXlRS3NJWXNnQjJjR2dEYStFZ1VEZ25OZGNRTWYz?=
 =?utf-8?B?NWNST2V1M215RCtlWjI5NlVwRjFlNzhDUmZ5bW5YZG0wMlFDbWxFU1IrUDVE?=
 =?utf-8?B?UmdBaThrU2hVYlE1OEdVN2U1ZHAzSHhpVDdvT2JsbnoyeWhQMEJKdEhBYmVK?=
 =?utf-8?B?TjBZK0RVLy91QkhTUGd0anJUYmV0dmM4OGtJVXZnRlJzTWQ2eDF6ZXBMWXAw?=
 =?utf-8?B?R1UrK1pYNDA4anNKclE0NWUyVTlsQ2NYSTAxVDNKUVJsNUZZajhhOWhzVnlx?=
 =?utf-8?B?YXMvY3JLNEtoL0hoOElkNmFCRUwzWDR0RGdOODVENHVNOEliQThSUWM1ZExW?=
 =?utf-8?B?VjlUODdWNU5ZVjdzRW4xKzgwZk0yYVB1ZEpvMnlDemlFUjFmYWJPZUVWSlFh?=
 =?utf-8?Q?HSlivieru1MMPUj6e/0tKMpC2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5cadd0-261b-4f0b-295e-08db7df66472
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:55:40.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVtKJ6Hnf/Eeo9cumYNouEe1xQ1anRwCSO4ujLqgCqMkjEMk6upbYAnJb5K6u0e3kDTH/BdRT9aFz0o+L+HfMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9245

On 06.07.2023 01:37, Stefano Stabellini wrote:
> On Wed, 5 Jul 2023, Simone Ballarin wrote:
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -34,13 +34,13 @@
>>  #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
>>  
>>  #define SMBIOS3_TABLE_GUID \
>> -  { 0xf2fd1544, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
>> +  { 0xf2fd1544U, 0x9794U, 0x4a2cU, {0x99U, 0x2eU, 0xe5U, 0xbbU, 0xcfU, 0x20U, 0xe3U, 0x94U} }
>>  #define SHIM_LOCK_PROTOCOL_GUID \
>> -  { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
>> +  { 0x605dab50U, 0xe046U, 0x4300U, {0xabU, 0xb6U, 0x3dU, 0xd8U, 0x10U, 0xddU, 0x8bU, 0x23U} }
>>  #define APPLE_PROPERTIES_PROTOCOL_GUID \
>> -  { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
>> +  { 0x91bd12feU, 0xf6c3U, 0x44fbU, { 0xa5U, 0xb7U, 0x51U, 0x22U, 0xabU, 0x30U, 0x3aU, 0xe0U} }
>>  #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
>> -  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
>> +  { 0xb122a263U, 0x3661U, 0x4f68U, {0x99U, 0x29U, 0x78U, 0xf8U, 0xb0U, 0xd6U, 0x21U, 0x80U} }
>>  #define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1
> 
> To be honest in these case I don't know if this is better or if it is
> better to add U only to the first numbers (0xf2fd1544U, 0x605dab50U,
> 0x91bd12feU, 0xb122a263U).

I'd prefer the latter, but I wonder whether that's in the spirit of Misra.

Jan

