Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6D4664D3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 14:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236578.410415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmaD-0005xH-6o; Thu, 02 Dec 2021 13:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236578.410415; Thu, 02 Dec 2021 13:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmaD-0005uY-3J; Thu, 02 Dec 2021 13:57:09 +0000
Received: by outflank-mailman (input) for mailman id 236578;
 Thu, 02 Dec 2021 13:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msmaB-0005tL-0D
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 13:57:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbc1739d-5377-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 14:57:06 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-3Z6XbEwHPf6x_zzjmazF4A-1; Thu, 02 Dec 2021 14:57:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 13:57:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 13:57:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Thu, 2 Dec 2021 13:57:02 +0000
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
X-Inumbo-ID: bbc1739d-5377-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638453425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrjjjK5socyGIKooQkWMu2YjUAmg20YydmX44WVv24g=;
	b=f+Fg19njZsVAi7XBHAx5bp8Hcfrm5Vss/KBGlwFk46feBa2lkWuBSM2L/xg35euWDQaV/h
	l2D9cI8yMXESnwRyj2V34qwrUhL3sYrkWsNVdlwQTlgrV8qA+j14dhqAFRYCu8Bl/SbF9n
	t+kus23IWWToUsaMARGp0U0AqcKshX8=
X-MC-Unique: 3Z6XbEwHPf6x_zzjmazF4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIWcWogKJzpzXq2STZtVriYDtFJWRBK2NBAUMRUOWtW1ZCrKmAJs452NKAUDNYgCnG4eR12pVGjvGIsvu65vAHrrqla0vrlkZqTkstpO9vIHGHwl8zmsciAlNKfKSGBxhQdOMWr7m4ju7cWcIte7p/3a1LN8qXStcT7YcIhaIjDFzdqjs2rvvWAbqPQw7CARozGjQUXwTRnphi+KftJf90TVwAGCn7woMYXO1/FNZirXyfdbjLYUDMHgvkyxViFvJDDyFmJO2k0ZxI7hpUUXx45L8/pOLetGXTU2cFrhA8b3nC8KZgz2rJMDOgCscmZZJYodirtDSOqUy1ELvhlDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrjjjK5socyGIKooQkWMu2YjUAmg20YydmX44WVv24g=;
 b=B8bK2AgfV4NpYG8i2/t2fNmxpKPR8lGz/fejJcqkIv4wNFHWQ2M4UtFc+JH/cyC3YBkZepurc4zdL54BUO6Md6XedyekT4jknYt4Ev7rfSIR5KK8Wj4wbZNKB/qRLa+zaPstk9P7wau6drgSVaA6M2QCca0UleM0eK91E+zGADjlUttaOEfEJtkN9EC08S+nq9K23g/zqAoAhnzP4F1gqPJZeIcD7M1+lSCPj5dx7LG6f5ha1HVFjy1xRVAQroGWjD89UxdxnK811kX+0wMjndEth13uc7u/mAtKAosX9ebOtlpl9vrIvfQOs8GbKl/e1CQJIsuwCYBXDGqiCXgj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2cfb2d33-eacc-9286-58d2-d56b88dbe054@suse.com>
Date: Thu, 2 Dec 2021 14:57:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 03/47] build: generate "include/xen/compile.h" with
 if_changed
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-4-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce71ffc1-cfb0-4e01-3c17-08d9b59b9e8b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71520454203E4E30E649053EB3699@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P8ZHQ5tuoJEeKHThkHOUDy0HuyIXB5wrUh6Ts9qzdrPxqXvEwUhT4aiSbnbSeT524XrHJfa4A1QLSK6lySB512z4AE6cZKJPgk8FkNStPwOHQF7RTJQC9LQb3fNSVlabBSFI4g2c6JTpZ1K+Zf8pKpoA3J97PQqtKJKZg3GiduX5nvKt4KcujmhJR4NcBytJqWeuOFWhqFlCL9VuIdzvBBF/jYLcnmF3c/lirOfkF/VovG/lPFXmGGlf8oxLdE2ZPPpQJlQMO9gz8mQq+nddiodzWQsAV1E0utkQ828YekY8L9+R9H3QNUOXrmGm0pkSrk2JSdpFYEL5dTs7dRYG1jDSkxK9IIKEN3g6oDRbPdXoUAmY0hv+Ggez7cL2VuA9SStSYScqZtrhtaw30qapuQMexR9PSLb4KLsjtIBuwbOdL9Y9tGDHYPc9nCti8tIIjSkpGP7OqOet+vkJCUxehiII2av0cxQweHa1XlTc0Yg+ZqrUKKtLSWnyAuTZE4R5KJ5r/fyd9NnWtOhxlUBX6Oltph8mo1AdWLwoEBBF4UmTUqQhNXtt2e9Tm0rlEDBLqtSBU0OGb6qNHknyj0wyjyQ9jFdCwfg+d93j7Zy0yr5HWHBrrsbFiRv8H0iQfQHkpshyg8udpGDzKQF3f4Xk+L/ZaNhSY2pQvZaCl3UBuTEbXvRyeGBsp/RAgvQT80+3pbQSl6ccSzr6QZz7pNBbjXO7RmdjLprpZiSK7ra23kdq/A2D02Pp879apk/b78iB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66946007)(66556008)(66476007)(956004)(316002)(508600001)(5660300002)(54906003)(86362001)(38100700002)(6486002)(16576012)(186003)(4326008)(8676002)(8936002)(2616005)(53546011)(36756003)(2906002)(31686004)(26005)(4744005)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGE5cFdnNENYU3V4WmFBZnhPejFyb0JTMnhrS01IRzdNWk43NC95MU5ueExY?=
 =?utf-8?B?K29INUtFUEs1QmpkOG9PTzlKT3ZBc3ZZVEFiRW82cFhHYUcrTzlSMXVSY3d1?=
 =?utf-8?B?bDZIeGhnMmVjbk1tRzJRQWFyNkpPZGpxZ0h2YU1jOFZzejRxVURSUEJlbTFx?=
 =?utf-8?B?UUI1SlpwZi9BTjdjWnBjS3ZxTDdVOUJNUy9wMy80TWorZ0RoUkI2ODJ6Q0sv?=
 =?utf-8?B?VVVmRjJ1eU14ai96VzBYWTdMMm14NGJCelFEb2ZJaE1TWG1LQWlRaTRqTDFi?=
 =?utf-8?B?VnRoK1UxcGI0M3V6cDlSbDZIbEFqVVRNcHVNN0dBdU01Q0FQN3l1dEFOcHc1?=
 =?utf-8?B?MUhUaXd3K0R1bnFadmRKOVc3TmVLaWpBS01CZG5QdWcxS1E5OUFmcVhqN1Rx?=
 =?utf-8?B?SjdaZDR0VkNUMkl0L2diYkVraEhRRzUwYU00V1Z1QllUUzN4YkczMDhkS04x?=
 =?utf-8?B?cXRXa2tOamt5MXdra3d4Zi9XYUNaVTB5M1lvTS9HMFhXTmxDSEN3UmJrMCs3?=
 =?utf-8?B?ZVlXVHpkcmcyNld0SFRjbmpTYjlQQmJNM0N2Y2cwMGg5NXBIY0F1aE1QbVFG?=
 =?utf-8?B?VDVGUkVobzJPd2FhNWhpNmlZZXk0VXdRbTZacjRscEQxTDdhaFhUUm5WVzNZ?=
 =?utf-8?B?Vit1bUFMcHdadlJWbzdEa0J3RUZ0elE5dFRHRHBXNWhFVlU0RFNtVzRIanBp?=
 =?utf-8?B?SkxnKzJ0VC9tTVRGRTkvYU9mUlY5TFRFeWJpNVFYM0l2aE5qZ0EzZ3Z6OS9K?=
 =?utf-8?B?SDI5VUVkWmlDVCt1bkliQWppY0JMUnA1VzNsRDJsTERUUVhwN0dFbjFjZXBx?=
 =?utf-8?B?bjQrajVlY0cwSzRGZno3Umtabythekt1SWgvSVlOSWRMNFlNVFVuOXd4Ky9M?=
 =?utf-8?B?dm9tSmdJdTBJaHNkT3g5SzVSTDhJRWlWZUF0Z0M1NTY2VnlYSjhSYktMNHIw?=
 =?utf-8?B?aXVhVUo0WHRYSkJoSTZqL3MzUnRyei9TUTFPMUpVSnlhbzhaZW1JZEtFMDZJ?=
 =?utf-8?B?eHVHMWVwajNIdHdHdm41bVVrZUZIY1pzQVIvQ2MzTUxYZi90eTBrNGJ1MWFY?=
 =?utf-8?B?OTRBclRLMDdXckpScEVTNjA1WlJRUmpBTjJIZE5tUFh3SHFoNkJlVjlCcVN6?=
 =?utf-8?B?NXlieXVzd2E4NkVCdUZST2FURWRZamYybGQ1bEppMUY3VkVXKzJVb0JXTG9X?=
 =?utf-8?B?eW8xLzV1ZW9LQ3lZam5paGlGWjh6aDdQRlBCQVRWOUJiR1VBRWJzT20wWmVr?=
 =?utf-8?B?T3hKdTN1bjlIVDVDK2tYd1loS25OQWMrcGtaUDZvTDB1bVA1QVc5Y1AraUFD?=
 =?utf-8?B?ZFh1b1Z5QmdRajA5UVM5UkxGQzEzVk5nWi9RbVdrajB3dklhdHJHQWxpMnFY?=
 =?utf-8?B?ays0NXBRUzBnVmUxS0g4NThTaEExQlh0VnNoQlBoTThBT3lOeTlqS3RNOVE5?=
 =?utf-8?B?Y2NHaW02UWdBTzdjSkVRZElMeHV0ODJvWTcxaXZtQUp2V2NFbHNxOVpRaVA5?=
 =?utf-8?B?dWpOcWFMcTArUEY1aExKSlQ1d2tSc3lrMjMwelA4TWlSdERDeUE4c3pQdGJj?=
 =?utf-8?B?RFl4NlZaSTlXVGZaOHVvY2xMRUh4L0U1cFllNExuVFhteUcrWkdWQkR6cTQv?=
 =?utf-8?B?c2pMR1dLbFJ3UGM4NnYyeDBYc1hUTVNxMko3RGtKc0ZSOUZJLzllbDFETFk5?=
 =?utf-8?B?VGU4Slk1Y0J2V2w2MnNFUGpxc0RERFRZcUZjQlpWb3hkVG11dllJMHg1TWdS?=
 =?utf-8?B?L1dWSE85aTRtOW5pYzhtbmk0a3N0YnlvU1JPeEVPNmJLUjhBUkNQT3MvK29a?=
 =?utf-8?B?eEJjZ09nUUVnL3FhaktnWEpXNUdmMTcwcTBBZU1KNC9naHUvemo2cTFVeXcy?=
 =?utf-8?B?T0d6WlY3OHdwcUxQRUNRWU5qUDZNRnozT2t0WlpRdUt6eDhJSy9Md2grQ3Js?=
 =?utf-8?B?YmQwSVpiV3hpbE9pSk1pVUdhTXFzQlAyNkVmUUw4QXlHZnhGcFZvMzdOTmZh?=
 =?utf-8?B?SHNhQnlSOVFOZ2Q5aXNrS3dlT1lFM1FnbGFjcWpQbFpCdnduMXJ6a044S2Qr?=
 =?utf-8?B?ejc0TXlhOFZydzk1TDRIZExvRTlMN2lxMU9JSEp3dDNLMHFwT3RwMHk4WjlB?=
 =?utf-8?B?U3QyaG1xYUxUZ1BPME9OLzZkNmpBYUV0MkF0SWcxSXBXK0J4VVF3M1VPSGs4?=
 =?utf-8?Q?RNk9SouObDQhuOrk1Z4tocM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce71ffc1-cfb0-4e01-3c17-08d9b59b9e8b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 13:57:03.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWTvWTUS7CQbPumiRvq/nXC7mkk939SdW2006kcuAP8GTgtOrzJx9J7U9lCMJ439EU3YlL1jeJT7C7neRJd2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 25.11.2021 14:39, Anthony PERARD wrote:
> This will avoid regenerating "compile.h" if the content hasn't changed.
> 
> As it's currently the case, the file isn't regenerated during `sudo
> make install` if it exist and does belong to a different user, thus we
> can remove the target "delete-unfresh-files". Target "$(TARGET)" still
> need a phony dependency, so add "FORCE".
> 
> Use "$(dot-target).tmp" as temporary file as this is already cover by
> ".*.tmp" partern in ".gitconfig".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


