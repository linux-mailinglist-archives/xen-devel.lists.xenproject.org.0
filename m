Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6506CC014
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515790.798963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8yx-0003A5-96; Tue, 28 Mar 2023 13:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515790.798963; Tue, 28 Mar 2023 13:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8yx-00037U-5T; Tue, 28 Mar 2023 13:03:23 +0000
Received: by outflank-mailman (input) for mailman id 515790;
 Tue, 28 Mar 2023 13:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph8yv-00037O-Ha
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:03:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea0e98db-cd68-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:03:20 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 13:03:19 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:03:19 +0000
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
X-Inumbo-ID: ea0e98db-cd68-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNdIsXzlmMWfZNMFzBlSV8tOKpSYk4ov1JabMGFMWjKThODK40MvsoP67xqYiz+GPx0MPKuJMiYW4QU6pXDApCMHWDgIm+O7SVX/ZoNIz2sOS5C+U4qOOUReoJYgJC/BAWoTef5uXeEJUfyJNtN/s+E0yxlJyS/RivUfFP9Fzeh9rYqtzZ0sZ/9FVbtUkc3exR2okOLTYym+Jd0FwWt2zsrCoh8uw+eS18bXPYWLb9q9fJycD+6TTMbMpjOKQCBC+xRmX+N/+6Goet0hlTKRpxvqnErawigR41KjcTGFSsH2lURMBrOjsdx661HijG7iYDCb8rWKGx0EVMOJPe7mGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snnWXGz0HbVgVivR0ee/+TvpCfZHx6zyVCQ2mssJ2Jc=;
 b=KUMZjoYLmZNe+cJpJvIChhLFnsu75soRh5uk1YmZ5sEmGlm2u1LUrc76ekrj/3yHcxCTpYxpsBqsUyHTBXLP7sUbHfahD63wsKZdKI9VcVvXaXCAuASARHnNp7CvjsZwPyn59h7LPF2lNeoEujE8EwpviMzEyFZm2uByo1FlITNp+TrzA+TuRDWROfKFIqdo2XtDHVARbDl0tturBR12v1OjhN4ZKKQnR8dI8Y4Ni/omh+tMSikwH6QOqykiO1osgsDENyG8kUIY7Sq+GlYdNiUzHffoaIM8o8ekUZgS0dGCnkz95TKbM4MQuH7s1KRKJc6Wa1vT4lRzFyo3+oRgBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snnWXGz0HbVgVivR0ee/+TvpCfZHx6zyVCQ2mssJ2Jc=;
 b=a/H4+wcik+6F9zrWXnF7q+OKrSyUBvLQe3WYX7MoICkGq1j++QwfvbIjJh8XUcwaC0GLwIgM7ssK5PnatQyy3l4JLbR2tSD3FBPMyFSSs+/JdzAou3ujV9Dr+urRQom82grnbnb8ndy0IU2JiLSJodM94IJL1WR0BHqTVphsT4Cp1bkUBAJ+H0wAqWpbNxWhLahlyXIWKsyYIZiyqAiEU4N1wiGRYGeBd6IzUAYE1db+mC5QMEPmV7KYhsPFJcstQg8u1oIB0BbP8/PMxWwb+DiAPhQKZxVu8u+eOvSb9apSs7mCl0yi4PNfw1pKCad4MqFffNEZsVlanwA8ffPWng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9eb7b538-4074-4b15-4ea2-67d9cc0bf85d@suse.com>
Date: Tue, 28 Mar 2023 15:03:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
 <ZCLNQGXvUBxZbIGS@Air-de-Roger> <ZCLX1qD/FmbF5ulu@mail-itl>
 <540906f7-4543-9d01-2b2b-a3bd70eda74b@suse.com> <ZCLjGhbzGD2jykT9@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCLjGhbzGD2jykT9@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: a26e835a-3f22-48e0-9321-08db2f8ccd47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jUTD9mfieRMYzi9EjnVfzgoZNWgJVwCmZoKOVzj4lfv+IcFaRyJi8SmtNMAea9QHueDUYvGZ7XSCV7szvl/+AOq9UxyW8Ohk3L5nzGo4Wov2MeXipr219SPbDbYpIfoyyoS98qO5yXAxCLxI1zpKaeNQxW7w+iSECnXKBKHvTdB1IaOYw26P0fHM0hqBqGElyfBbB/16q7NItN2g7VeoWR3kWyE05VaClYlfIjUwtTkHIoS2aOyk1o/Qe+KPUDrFC8abvDRufHlreQB3f4m1Kfx7+EKoSu6bxTMblLGpxYpxFJdgtjlT/oNV4RtWEj4gW1QHhyCQ3pDHnOVvwBLmOb2Dz8wRL1qhJZk0UVaSXhFTXzZVp9cE05dHeONhWE5JfPZaZvqH3QbAfw9Uc5H0rSekpvVA+5C9BZSPYEFv/wH+Y1+R/Q01kzHZJM1VILfcEPlmqLdAqU4R9DS+wv2CHyo7DqpsVVt79nB26/nBW5sTgs7KMh1jOllmBaDtggBT59juVLmSUpLhQrzL88uMMssEZDqz+l5ci6qZgGvBc0/ur1/FRkdQWdHTL58cTdlbIIe/KGcEWPkWu96FSwxwGxhy/iSnMUmWMmEHVKwQwI9B2u0gkupizZaZy/bwx727zpgrJ3RzytbKmnQSbgJQ2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(36756003)(86362001)(31696002)(478600001)(316002)(54906003)(8676002)(6486002)(66946007)(6916009)(66476007)(41300700001)(6512007)(4326008)(6506007)(26005)(53546011)(2616005)(186003)(83380400001)(31686004)(66574015)(2906002)(66556008)(8936002)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkhSM0lRaXBCVC93ZlVKaHJkVWRuNnhCeUNPb1BzUUd1bTgrOGIvaXFPTnBM?=
 =?utf-8?B?akp6SGV5Q3lwWCtWN0tpNGNjTWZUbTlVZGtzWW9jNVRzaXE5aDNlSXNYRThi?=
 =?utf-8?B?SEpscUFuMlQ4U2kyNkcyVFluTnphU3B5R3V4Q21NUzY0OW16eGZxUS90a1lZ?=
 =?utf-8?B?dXUxcDJIYTlZTE10YnBEenZDVmt1Z3pxajdrSnNHV0tXdnhXbGN2RDRpY1pP?=
 =?utf-8?B?azFubXhEd044UlQxRjBRbU9SSGFwUjZtY1IzZzd2K0RZRlFObEhaYU05SDIv?=
 =?utf-8?B?R0xHREZuRi8zWnErRFFQOEMyNFFEWUQ5OWVudHhVaTBHT1JKSXhVY1VpdzhZ?=
 =?utf-8?B?WThPUXl5ZkN5QXVVU04xUGNnZGppMDVrTTc3dkJuR1B5L0FVL0FoQXhSenVn?=
 =?utf-8?B?VGtqR0lkcnE2N2pIcWsvZm95OTlCeUlLU0I0THBabjVEZkEyU3FnN3I5bVMw?=
 =?utf-8?B?WEd5dldTWElPTUcrSW9QZTV3a3VVVlVOblRRVDFSaTUvWWRTUTY5d1hsWm5N?=
 =?utf-8?B?d09yS3NWVXJJUmdDMkNwTGFwdXJkWXNPMzJVZmRlZHBxS2pTczF4VlJBcXc5?=
 =?utf-8?B?UnFGOEFTZ01aN1VrK3FlTXkrM0xjZzUyVTc5SkpUT01IN0dNMlk5WFRaQXl3?=
 =?utf-8?B?VE5PaTVYUFM4NUJ3VTJmZ2hYVzZlMkdkODE5TW1XU3VvVkpDakNSQVNWaDJY?=
 =?utf-8?B?cTJkZmVUQlhBUVdFZ2hLakp0MWNiZllMMjIwWDJTMmVnN05odVpIUFJkWTFw?=
 =?utf-8?B?VVg2Y0N3ck5vekJRQ1ozYWJuZm9ielFFNDFSYmV5eEJJNXlXZHV5d2NSaWFm?=
 =?utf-8?B?K05TTXRXMis0UE9sZUk1a0swVVUvblBJWkJzRWVxV0tjN3R5b0Q0K0ZGYTVk?=
 =?utf-8?B?bitkYjhOa0t3Yzh1clQyQTBBQzFEYWhSS3BBUEpBaVQxeW9DQ0JGUXVVaHRF?=
 =?utf-8?B?ZDBucDh5YnlmMllnYkNmbU9nK25PL0hCcVoyRFJjT3BvWjQvc0ozbUJPSUJh?=
 =?utf-8?B?NTVSeXhSTk1SRlk5NUYxd1lJb2xENFFYdEJ1c0dJUURtejFMUlNSMzRVME0w?=
 =?utf-8?B?c2NkRURyNzQrbld6QWJtYWN5UXJGb1Ayb0EwK0dqUEw4ZU9IaXR3RlUxTi9z?=
 =?utf-8?B?VEoxRVV1cERrNkkyRmc2VnM2cDRzNnNyRHh4YTJ3bWhZOTk0WGVSdGsvZGh1?=
 =?utf-8?B?N3hlSUpIUHh5TEFjcVZqbVdRVjNpdnNBblp1REZKQXZKTU01UGloQWt4T2NE?=
 =?utf-8?B?L3pTbmFDcitxOC82aVFDK1dvckNQSXJidm1aekc4NDFjZ25NYTNXek9Zak9y?=
 =?utf-8?B?M1NEdHhiZW9JeW1CTVY1VDB4cEJyNFNxY2NCSnNBNTNqUWZMSTljZjhlQnJp?=
 =?utf-8?B?Szd6MzR3SkdFZG1HT0IxYjRDOTBIRmM4Z1dDRER5SG41UU9DVU9mYjdWUHlY?=
 =?utf-8?B?Z1FPaUdPVjJ4Ny9NZ085K1hOOUpwMjArNEY2NVQzK0RjN2JyaGNDbEkwQXVL?=
 =?utf-8?B?dksyTTIwdXNYektOTWdWSmp4ZVRYbGVhYzdWakppK25mWno0TGRpQjNNc20x?=
 =?utf-8?B?dGZFR0wyMmxCazhGQXA3ajB1anpOMXJtOUpCT2Z4RDZ4dkJJMVIyaUpDemhY?=
 =?utf-8?B?K3dnQTJVNVU4MzFlWXNySTkvcnlQR2ErRWZoZjZYaklVSU5jMGpDL3RMNzQw?=
 =?utf-8?B?ekpWNUtGbmVQMEZHdHFLaTlxVW1tSEhPWDFCNkVCUzhCTW12aVpGbnJOSkcr?=
 =?utf-8?B?SjNGMDdEb3JjUzlVbkQ1MmxnQmU2eWUzOE1UOVBBQXlpTDdQY3ZDQUxhbGpV?=
 =?utf-8?B?Y2VWcEFiVitGMDViVGFjekh0ai96Z0RnREh4TmExOW82V29VY3BTMElQVmFQ?=
 =?utf-8?B?cGFBMnVtMERnU3RKRGI5Uk9pYkk3b0tKQjJ4bCthWkRydC9XSzcxR01tRS85?=
 =?utf-8?B?UzdMVHovZC8zeHR6NVVaMXF2ZGZLUmNKMjdqSGlMajF0ZFFQeTBjeUNNOGVH?=
 =?utf-8?B?MUVVTDFENGFUWU5TSHdienJwY09nY21qcGpTVFN1UXk1VS9FWmxCSlBOck03?=
 =?utf-8?B?Y0FJbzlKU2Zqc2NMWUQ4ZUxZU0JMSEZMam1VdXhhL0ZuaWF3M1NUa05CYnpr?=
 =?utf-8?Q?rlPMPGSsfRiVRjvxqrZCRxKn8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26e835a-3f22-48e0-9321-08db2f8ccd47
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:03:19.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ0PlG9X3dgh2KtlYAvf0MV3EsS8AwE6/cywj/Px970mR0kCZgx3iVoP2pK744Pvu4iprUHIlmCyzeRXX+gGqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

On 28.03.2023 14:52, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 28, 2023 at 02:34:23PM +0200, Jan Beulich wrote:
>> On 28.03.2023 14:05, Marek Marczykowski-Górecki wrote:
>>> On Tue, Mar 28, 2023 at 01:28:44PM +0200, Roger Pau Monné wrote:
>>>> On Sat, Mar 25, 2023 at 03:49:23AM +0100, Marek Marczykowski-Górecki wrote:
>>>>> +static bool cf_check msixtbl_page_accept(
>>>>> +        const struct hvm_io_handler *handler, const ioreq_t *r)
>>>>> +{
>>>>> +    ASSERT(r->type == IOREQ_TYPE_COPY);
>>>>> +
>>>>> +    return msixtbl_page_handler_get_hwaddr(
>>>>> +            current->domain, r->addr, r->dir == IOREQ_WRITE);
>>>>
>>>> I think you want to accept it also if it's a write to the PBA, and
>>>> just drop it.  You should always pass write=false and then drop it in
>>>> msixtbl_page_write() if it falls in the PBA region (but still return
>>>> X86EMUL_OKAY).
>>>
>>> I don't want to interfere with msixtbl_mmio_page_ops, this handler is
>>> only about accesses not hitting actual MSI-X structures.
>>
>> In his functionally similar vPCI change I did ask Roger to handle the
>> "extra" space right from the same handlers. Maybe that's going to be
>> best here, too.
> 
> I have considered this option, but msixtbl_range() is already quite
> complex, adding yet another case there won't make it easier to follow.

Do you care about the case of msixtbl_addr_to_desc() returning NULL at
all for the purpose you have? Like in Roger's patch I'd assume
msixtbl_find_entry() needs extending what ranges it accepts; if need
be another parameter may be added to cover cases where the extended
coverage isn't wanted.

> I mean, technically I can probably merge those two handlers together,
> but I don't think it will result in nicer code. Especially since the
> general direction is to abandon split of MSI-X table access handling
> between Xen and QEMU and go with just QEMU doing it, hopefully at some
> point not needing msixtbl_mmio_ops anymore (but still needing the one
> for adjacent accesses).

Hmm, at this point I'm not convinced of this plan. Instead I was hoping
that once vPCI properly supports PVH DomU-s, we may also be able to make
use of it for HVM, delegating less to qemu rather than more.

Jan

