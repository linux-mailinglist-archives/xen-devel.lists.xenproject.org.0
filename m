Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258AC6A3CBA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 09:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502253.773961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYpG-00087G-9a; Mon, 27 Feb 2023 08:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502253.773961; Mon, 27 Feb 2023 08:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYpG-000855-6b; Mon, 27 Feb 2023 08:25:38 +0000
Received: by outflank-mailman (input) for mailman id 502253;
 Mon, 27 Feb 2023 08:25:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWYpE-00084z-0W
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 08:25:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e3c592f-b678-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 09:25:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8094.eurprd04.prod.outlook.com (2603:10a6:102:1c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 08:25:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 08:25:32 +0000
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
X-Inumbo-ID: 4e3c592f-b678-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwnAhwEEnhFb76I7BwZf9s6xyExVNndeAvydKlIHMi9+5EqMfsb+gjZ3s6CLJaIuFBiZBRB+d0dT5k9eI1YUtMonkSUEEE031Usx15AU7UA5lNGtHv5V+hP0tu2fD24bxRQr0ZNLGQ+9CVTE9adTmFhn+i6yu7N4gu9zc+oif/lkORHxClc5TVo93PfS6agiO6dHt+3TJSbZLC0ncL0zTQHH9q+1hZ7cGtSX0FYANCS0XdqESiHHmPRyuSKhv1jm72quu2Dbo63R0WFAIXqIq9tnMxDwZ1YIVDWGF1NtFUC1R38yIBGYTALY+DT1iDTBFRN0CrrGyROvLdR9VgVBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sfyl7/Y7lDf78h9hLB+9Q/6fx14q15njNB5cRcJb5/w=;
 b=CrZTGAyP4gl8uf7NTLiR4dAjRU5JbzmIIh5RER6woA8QKqKOa6KyxHYExlK+IJlPrZE02kpyuWzRak54F2KZpwUPqazFAh1KqnKFIKTJDCDyJYu+yL+wW83+XDJE0b/28jxIAyC4QHffvvZ1iGXvCJ7XO1q7yV1z3P1XqfOAqZWGybT2TT3T7bajnMgiuT7vRii7HKJFh/KR/SZtRQTAni0mtuo7L84hZ+vbOCxcgTq2rDM+GBtb1Ikv+7IksJZod+D/V3JeVXb1fYH5US12YVqvc8S1rBWPEcK1ETg+UAT26HoEKQc5PlvwMkQapVV0rrQZr0371mdVVHGF//cbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfyl7/Y7lDf78h9hLB+9Q/6fx14q15njNB5cRcJb5/w=;
 b=kOmSdqyN6jufJfpgWwr2U50fsOVLv+OHf+Prd+Zxah8FU1GNWOvNnZlfRcQtCrZiYh3B4Xe/NLC/aVmwx3zY1W7xReH2NTyS23iKeSyMGNENhbN0bw0kvuWcoZAUOswKnOt9GM57LwoWVl+sj+R09ElOwUPVyNccWIWfaY00NHE+QcgdHtQRc2bgpafGEeu6PeIknczpRQzNQoF5AIHs1Q5Tcp9XG1voV96pHfzs5cgUlsmtQLDB1NnM1iXi3TysmniXAxp87Rb692iS1DHwTyZyy9oWsLz/lOrROKEVg4ozf7UndDsBSsdyUw/bV42v0OeM1DoKiKQTSxHCUWP1ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30b906ef-9c93-afec-14f5-4623cd24b273@suse.com>
Date: Mon, 27 Feb 2023 09:25:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/3] Build system: Replace git:// and http:// with
 https://
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1676750305.git.demi@invisiblethingslab.com>
 <944d212b0047339e4c15f7f85d74ff7fbfe96912.1676750305.git.demi@invisiblethingslab.com>
 <8c4aa332-07ee-e91a-50f1-ced9e36db2a1@suse.com> <Y/lASQDDXEZY5qDB@itl-email>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y/lASQDDXEZY5qDB@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f661f18-538b-4b01-9d90-08db189c3132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0xLRazXPDRCVS6k2qC4lPChd2XIjGD67oAvxlXMEyXLAIJO5oARK+6xhc2Ljm8DHMRMqK7umlyVXPnvFojffpbsewVDN2zUQsUpUE9PvuGZAlsHAUzmzU05qytS/9rrYzRdlyGEAIz4+yP7kdPIJF+Ck+4xk9SGITQFTkwTWXFHhGnoGphCH6Hnm23J5wgT/At7wtgE4T8m6vhsP6Ct1OWHQ3a3JjBqPN1oTnTPX1UthnaMr5MA2tkInYquz6ToM/C/3bA+n/bjbr2jTYT9HvuZ+L6ZcDB2TW0pZq64NdjFe13BQCGGG+HO6H3iYdUzlPffroGS+Pwz0FFJ70NtQObSWdQwSnXPudUTaIg1BPT5TZ6zO17vrKNzG7RutGKs8BN4vHoOhWYQgJqSxhuig6bSnRU6U7OMKe1zvMWnUlHEDzzMuVLmfehy8/NTERjJlkJtxORrUI2Zz2imnOR12Yr41RWZrhfjz04kjHg2ASqkzSZA94UuM3eQBImy9yijavsbMfIEZKJCnPEkHhuR2a6uMf/lIVQ7JOXY/DosFlEymGmYvvZqJQVcHP4WX+775APD8u7EZ2Qj+rgRoKeN5HUoWuWdL9RGS2o5jdhMPYH2lJ2wWKMImGYBBQ0Jx6T7mHXY/14vHtBjtARYA+t//0T7oF6ffvKWoRpYfhAyYK6MnUM53DfS1MFB55syef2VkFLGJih2OYBb2VdiWrfsyuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199018)(36756003)(5660300002)(8936002)(7416002)(6506007)(6512007)(53546011)(38100700002)(83380400001)(26005)(186003)(2616005)(86362001)(31696002)(316002)(41300700001)(66946007)(54906003)(66476007)(4326008)(66556008)(6916009)(8676002)(478600001)(6486002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW9pcXB0Nk1qQnFFNy9rUFViRjJmSlFMSHZVR3RyYXVmOHR4Z3dKMTI2K2VQ?=
 =?utf-8?B?MHRlaG1QNG8xeDdrdkd1TmtFODEyeDZVSExUeVZYSXNoNGUzQk9CM21ZaC8z?=
 =?utf-8?B?ZGlIMzhHUG93OHV5OVhYVk9TWmw5bFhadWZ4K3oyaURGUmZkaVYwTTJSbGY3?=
 =?utf-8?B?TW9aOGFNeEpwMmhKR1orMlYrWkFLOUpjMjV4RC9hZ0k3bFVaRDRHZURraitM?=
 =?utf-8?B?QmQ5MTRnNlE5VFEvMFZMdjdqN2EzcnZLYXBLNTFveFk1S29ZUDEzU3JZaHJn?=
 =?utf-8?B?Zm5PN0pYQ2UrenM2NXR3M1c5cmtWSStvazFpWE5pSnNKUnJKdCtVVi9ETU1l?=
 =?utf-8?B?cU5JMGNobVlsZWxXTkMrVmljbHF1WFpMK0VvVW9KaVpUMzYzZzQ0bGU0MWI2?=
 =?utf-8?B?VlM4dXl6Y05zZUxGYmVwYTFtVHFyM0FHY1Y3c0RTbk9DbUZLNnl6RWZ0R2kz?=
 =?utf-8?B?V2x2cFhUNTVSOTFOc05OS2RMMG1iSkgrVmJTNE0vOVpWWHBBdER3c3ZxVFJD?=
 =?utf-8?B?ais3ejJoVnhwdlNuZXlaeFpUZFdJaXYzckMwaExpU2k0SktreDJIb0dJRTd5?=
 =?utf-8?B?NkkyYXRjeVh5aE1vYTlsR0F1TzEzUEg5SzM5NmcwVXFoZmkwYmdXc0pnRHI3?=
 =?utf-8?B?L2pZM05KaExVeno3UTYxVVJ5eTJpY09uNG9GaHJid1JXamVITDA5Y2orcDJh?=
 =?utf-8?B?QkQzQmVHZUpYdXpQQWFtaDByU2xxTXhvTHNKTHhxQzlqTXVFL2ZkSThaN3VC?=
 =?utf-8?B?cDRZRHNjWjdYT1prR015Zi9VZ0cwaTk5RXpnanYvRktwWkkraHBELytVdlgz?=
 =?utf-8?B?U093US9GQjE4czZXQ0FVLzgrUDJLNkxSWGV6T1R4ZGZRejhIYTRZb3ZoSE41?=
 =?utf-8?B?Vk1IOFZpZE5RWEx3SVQ4YWVhdC9DMWlSUUdVa2VkL1hyNVhBQ1FKMFFCOVNN?=
 =?utf-8?B?aGdkNUlqcUJtZm5RTXV2UUlKMUgyRmx4S0lPQkJBam5DaWZTNlZRM20raEVQ?=
 =?utf-8?B?VGJxQzlxandPS2FSRHllaUJJbmlMZ1hPQTJsMEh1ODB1cVJINE43UnlENVZW?=
 =?utf-8?B?NStlNWFyS1BhbjM0cVFFdUhJWGdycDJnKy80VHFYVEN2R2xyMjg4OG9iV0hi?=
 =?utf-8?B?UzRnUm4yRFNPVjh3VEhicFd4bGc3cnhjTUxXbG9sTmRaY3lwb2tEcmVZaitV?=
 =?utf-8?B?MGY0ZEpETXQwd21BUFY2M3B3cmFLdmdrUS9WczNncEwvZnVYa2NvbWMybDNC?=
 =?utf-8?B?eVB0elBDN24zdFpKZXlFdnZqQjF2ZGh0alloaDBIY1dON2loR1ZWS3pWVWQ5?=
 =?utf-8?B?L1lvNmUyZWlNOUpEOFp1NGVXK3Zxd28wZ3c0anZJYUtTNWg2Snk2OW1xY29r?=
 =?utf-8?B?QnlSd1JlNEZ2a284QUN6bG9Zem1JZGluWXhCREhzZDh4Z3Q2eWN4MS9lM0NQ?=
 =?utf-8?B?SXNaVjEyN1ZKc1k1bUNSOXpzenRDeW9peTIrSEJtYmQ5ZXhlWi8zb1pWVXFl?=
 =?utf-8?B?ZXRUNDFWQUN2czd1ZVJZbkZ5WTNFWUIvZHFYYzBzUXhJSElYTUNwaVpzNDNI?=
 =?utf-8?B?dHFOdzZDSEpJRFQ2Vmp2SXN3eXlQWEljazN3dElTMFVxV2t6UGtacHZvN3M3?=
 =?utf-8?B?ODhnMmU4RzJEZVhHWks2cmsraCtZdDBkTFFITnRuck85UG9sRk9USWc2R2RO?=
 =?utf-8?B?YnNwdHdiOFhGTU1FVW1JM3J0YVZnQUFUY3JvcXdHNlZ0UGpxQUM4dmpYZWtE?=
 =?utf-8?B?ZnNDQXRFZktUck90aHB0TzFRb3MxTWkrY2FhL2ZuNytCK2xuN3Vha0pxSTFD?=
 =?utf-8?B?U3BLdjFCUjQzUXltZTkrSm9NWlRvODYrMTRpWEVKOG51RjllWHFRaVorMFJu?=
 =?utf-8?B?RUJjNHJ2c2RDelIwbTg4R2lQSXRLb1ZQVktLK1NLZGhETitmcVdzR3c4dWxJ?=
 =?utf-8?B?NHlaSjFuN2pjemFOcDRQTktZRzhTWWJWcGM2eUJwdHVqQUllMjlxd2cxMEdZ?=
 =?utf-8?B?ZTFocG1pa29UZUsydTg2SktBRmt3c0lPU1ZvODFkdm9nemRMcFNrcEdRa1pS?=
 =?utf-8?B?dFU5Mlk1cnZ3b3pwd080a2YwaGZwU0pKZXZUMENzU2V2bUdqcERaN0UxWG1B?=
 =?utf-8?Q?WoyTg8sX/a33xqXqWrnNNmnMM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f661f18-538b-4b01-9d90-08db189c3132
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 08:25:32.7266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuIOllO1SNQb+6rEifm2R+KdOa8/LUc9bN74t4/PpS/ljOVd2Xi0IJ6P1rZe+2al5mmqEo6UGL0wXtrjqObRng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8094

On 24.02.2023 23:55, Demi Marie Obenour wrote:
> On Tue, Feb 21, 2023 at 11:07:58AM +0100, Jan Beulich wrote:
>> On 19.02.2023 03:46, Demi Marie Obenour wrote:
>>> --- a/stubdom/configure
>>> +++ b/stubdom/configure
>>> @@ -3535,7 +3535,7 @@ if test "x$ZLIB_URL" = "x"; then :
>>>  	if test "x$extfiles" = "xy"; then :
>>>    ZLIB_URL=\$\(XEN_EXTFILES_URL\)
>>>  else
>>> -  ZLIB_URL="http://www.zlib.net"
>>> +  ZLIB_URL="https://www.zlib.net"
>>>  fi
>>
>> In v3 you said that this URL can't be used anymore for the version we're
>> trying to fetch (which I can confirm). Leaving aside the question of why
>> stubdom was never updated in that regard, what use is it to update URL
>> (without even mentioning the aspect in the description) in such a case?
>> (I haven't gone through any of the other URLs again, so there may well
>> be more similar cases.)
> 
> Main advantage is that it will fail securely rather than downloading
> whatever random code an MITM attacker put in there.

As said before (and implied here): At the very least you need to mention
the aspect in the description. But then wouldn't things be failing equally
securely if no (non-working) URL was put in place, or one which is
guaranteed to yield an error but makes obvious that no real URL is meant?

Jan

