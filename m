Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A65946BE51
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 15:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241231.418115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mubtV-00044x-Eh; Tue, 07 Dec 2021 14:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241231.418115; Tue, 07 Dec 2021 14:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mubtV-00042J-AU; Tue, 07 Dec 2021 14:56:37 +0000
Received: by outflank-mailman (input) for mailman id 241231;
 Tue, 07 Dec 2021 14:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mubtT-00042C-Bt
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 14:56:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de99b59e-576d-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 15:56:34 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-j8f-1AkUNwqCnDtcDh1L-A-1; Tue, 07 Dec 2021 15:56:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 14:56:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 14:56:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:20b:46a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Tue, 7 Dec 2021 14:56:30 +0000
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
X-Inumbo-ID: de99b59e-576d-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638888993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fesGwMC+sgklS9IYU5JfH8dnwTc+ryP7uhzAVm4VrBM=;
	b=WHp0hhzk99QbHQbSQICfIXPSDrlR8Kr7EdGxs86PEurKc3Do8OED2cov+DUPtoRds+Ks5e
	K5JVvvHBjKvxqoSC/c2ti/HkUwbXeZPBqj9x298nEtHJjVDG7BajLAwu+ovOwR/phZy26n
	iVDlI4Y9KCzPlpqb3xhwTRGa3E8uc6c=
X-MC-Unique: j8f-1AkUNwqCnDtcDh1L-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFYjWh5OAy7LDAZiSpisK4OdtKiO4uHV8jMFo38pLdyriA759WD3n8zNS1+OKZ8tH4EKQxRciISBV5qBTIWgn1rvPOIHwxQv8yicgAoaoMEcH67S/p4l5zqUDy50fXowllae0zPYev1D3v3BWoPnaVGVk7GTUN5+dQqIuHD981hufQVtzLaJBvUq0VqIWFqOnLutBAm+72C4q3iwmk/4wWQjNkvtoEK1vmTQJTawuRk7swZ7mN3pxc2tPPHq1bGFqHQ0aC4MT1JD01+Oq0OQNdLxrOjOwBIQWoW5SSixIq9hwzIfur8O7mg77w5W/LTaUVpfxlr2sxIy2gNtTkuTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fesGwMC+sgklS9IYU5JfH8dnwTc+ryP7uhzAVm4VrBM=;
 b=AVN9xqr090pgD+Oori6XMy/Z57VlKPMiu3ClXZbzwa3DGPBSxgD6+gkLCwGxsi4BQqHzSVndkPs/1OmFZjcxfeGLyiPuhueUvSd3MtuOt1URRRvd8HbEWjuQjoe1aegouUeogk1ldjtlkk+iRGUP5LkWAdQVkTSWqI4vTsC1pKCr3Rf+CZeI3O3Gsg20AyEeGaxi3C1GVSqpG+Fsb1i35jXnr1ELklK3JnCpjxWUhw0Ekj+ox2aoxk3JB1YLiP3GUPHLqWm+W8oo9ooDtaMeFFEzALY6BH8QfHjVfVQm1G5SyNmFS9DmIDsIX7eztxbc6fv5i1VoOSlCVOXU+KPfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e1e0b13-f77e-acd0-e43f-58efc706ac49@suse.com>
Date: Tue, 7 Dec 2021 15:56:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/7] xz: add fall-through comments to a switch
 statement
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
 <9666b3cc-d4c7-1a51-3a23-419d16232465@suse.com>
In-Reply-To: <9666b3cc-d4c7-1a51-3a23-419d16232465@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3322713d-94b2-46e8-44cb-08d9b991c167
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48450FDDCCB5378EB23B4426B36E9@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	meHr2NnH4X6o1sPFMd9yxJV7UyQn0amjitFkXXvcgHloKKHU6k7FIHX3IhHi56awve+yTlD4WzLnKI/LR4RTAQ0lUFuq25JTZstruUa+Md1kvnc0KZCNhDo9AZt8+TVHMdAhIhahAH5fYMiErCAb+7V4Y+Froachc7DEKst25clMbAjlPeWAp6jHQj5UxEfrTSBX2sa2MeSJjjOSWJskjDIGvK9lxcKML6A/RlKyod8dQzfmeP3cpP272LB9dGUXA1idMahdrhr8tCd2cjJv80tZ/3tutLC86HeOpPK+djIHYJ3LzPnZiWv00dvdWHXVhXxYsj8wZbDIo9Z8n/Lkb/V7REXfAE38XQPZ5n80B3ZXZk615ezg/cdKIl+thWVfKEYmN+g2PsjyS6AIyboY2ywyrJD2OXZrCwQKHF8cqV2uvDtHWz01SCrheYghr9nGBsAzAXVca1dESw4exHdnmglRUnnUVX5JAhvqTr5UrPJdTFBJIF7P+fHjjqB/E1bEx/Ll7x3qFL81lI4sHjX2/9gclRCcvf4zc9dlcJxYx+mSj1u/StooahD/ycMFp7sd6i4sjecRj3+C/441tnGWIqLZ+w8THgJEy+KLARjsZPqb40VNRtlMlBsmQT5Z4nScaPrMcFBUD8Q/WIsG0SNjEnC2Ji47/BORnL9AjRkFtlBnWoFWpF5kptD2wCPx1YmsaHGjPUn7py8kTIIn1vjztX7Eo+Xhvn4yyTGRukS+tEo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(66946007)(66476007)(186003)(66556008)(508600001)(86362001)(5660300002)(6916009)(956004)(31686004)(2616005)(26005)(83380400001)(31696002)(53546011)(2906002)(6486002)(8936002)(8676002)(16576012)(4744005)(316002)(4326008)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2tnbU9CZEd5aEhWQWtPTlJvTHRNZ0l5QWs3MXVRRVlEVlZZMDhyQjBBK0J5?=
 =?utf-8?B?c1ZQWi9POTZhamRSY3d1cDJJZlk5T2luRW5NUnJjRlNjdjdkUW9xSHpvNTAv?=
 =?utf-8?B?d3lFN0JrZDFmazRxK2o1RmowYXhWK2U2b3YwdjJwU2kyKzlEVmszbjRKd0RK?=
 =?utf-8?B?T1BEWjJUdC96ekhIcGdYYm1COWd4NUx1NFpteWR0dkhNNUhTNHJtK3MxOVNk?=
 =?utf-8?B?NEtHWmdISTZBd1RuZ0dyZE90bnZqOCtPZ214RXA3aHJLMS9VWEVQRDZmQU5t?=
 =?utf-8?B?ZDVIRkRRWmZQM0ZjRlBISFBGRGRwYk56U1hmaFNLRG15R0lWQlFpeGdLWCtL?=
 =?utf-8?B?ZGt1M1lPYnduQmRjVW85bjRxY2ZPVnBTRzZNNjdjaW5McUZXaTcrNk0wdVJL?=
 =?utf-8?B?TFZ3d0VFWGtmeis4anFjL21aWE40ZFNwYk9Qby9oK00vRGJPcFhUTmM1dzBl?=
 =?utf-8?B?K01Ka1BabzdaNG1PR3kvd01IcEFIUE5YaHZWM2FsNVIxZXUzbE40MDNDa0c0?=
 =?utf-8?B?amp3VmllM1ZXbVNOZHNlNEE0ZmI2dEFYNnBGL1RSMmw3SkdYKzdaSlh4eE9r?=
 =?utf-8?B?VkoyTEp5bEU3NFh2ZzZFRzJGUS9Ra1R6bDRiY3U5ZXBsQ1pyVlBiVFJvMUJj?=
 =?utf-8?B?ald3TFFBYTRGZmYvbTNvcUdwb0lBdk9DRXZuQUtONWorZ0pDTEFDaFJ3MWxJ?=
 =?utf-8?B?WUVNZGMzZzdCUHRSMjV4V3BCTXlnYlBka0RLeTUwWXczS09yL0lCTTVLWDZ5?=
 =?utf-8?B?V2dINEppODZGRzJRQmZPdlJCZlcyNGhCdE9jVXpiS3UrSXF3Q0hhU2VxN3Fl?=
 =?utf-8?B?KzVXYlA4Nnc1d0g5ckpPTnNPVldPTEdTMnpEcEU5VDNvcTRuUFlPMmpEcHhI?=
 =?utf-8?B?TU4vS3JiR01mUUY3YkpQd0FTRGpmWVUzUjlIb0lKMzMvdW1FelIyUmVkaCtJ?=
 =?utf-8?B?RHJDQy83bWszNmI1TVFzeHA5R1BtZW1uVjdwcnB2em5EZ0JDOERvL1JTVjN1?=
 =?utf-8?B?aHpBK1NIak1WZVpxWHA1RmhhSWVpMGw3dmJGcmZweG1rcXdnV29xc0FNdUpl?=
 =?utf-8?B?QUlkNFkwd1YyRUUzWWsrSmtHajlQcklxMjh3NEZnTWxiVDRpdlVoQkYzLzhq?=
 =?utf-8?B?a28wT1VlaHJIbnpqczVpdElxbHppWGh3QU92SkprSklBaVljR2NlWUN4UDIr?=
 =?utf-8?B?QXFzT2NSYXRYRnJlb2pTRkgzc0pUQWQ2TXZLbklkWENRampYMjRxNDhEeWhv?=
 =?utf-8?B?allzbUxBWHBXNXFIemowdU15STRPVXorcCtiYmkrZDAvWHYxTTlyV0FlaTYy?=
 =?utf-8?B?amoveUZEN3VzdnBCbTk3ajlTenY1RmZtMTJ5a2hFL1krWmpUZU0zeUZBSG53?=
 =?utf-8?B?OFJsNDE5elNqZzZPS1EwcjVJZFVCNmlEUy9sUktHMjV2UVgvV29aVlNOdHph?=
 =?utf-8?B?bGp1WVY5NDhXcGMwM2lFbGpwc2NnSkgvaGIxZDI2SlhwRlJsNTRpNnlhekpi?=
 =?utf-8?B?QzZ2WDUwNmFnT0x3MVRlLzFlK3oxd3JyL1dUWERubWVUSnltcTJaS1lUd01x?=
 =?utf-8?B?dEt5bTdsRnBVYnpFNElIU3dJYm9sbS81a3Nlekg2U1RUbTVyVmJFZEphUnFT?=
 =?utf-8?B?YlNWQWxvQVdaZStlSmd3L1NsM2FBeFhIWUVJUklqSkNWeVBXei8wcGpteklP?=
 =?utf-8?B?WDRHWUZKaTZ2NmgxS21ISVJoUDl5bTBtcG81QmRJV3N6My9LL050d0hOeTBp?=
 =?utf-8?B?SW92TS8rNERUdnNUUUo0Q3RRQzMrSnVFMWQxWDhiS2ZGS3c3VkthMXJOWVRM?=
 =?utf-8?B?K0F2b252cFFUTW1RQnc5dFlldnVJREJFQ1dpdVU4aTNGMjZhOWtFNmN3ZmY5?=
 =?utf-8?B?ZTZCeFZCSi9pdUJSenRRb1pNN2p6WFNudU1rQzdmeUl1dXdQVlQyOFkxWEpI?=
 =?utf-8?B?aWpya3lSenVyK2RtOGE3VS9aSWd2N01XNXU1VUxCTDZVNlNuRnRvK0FacURL?=
 =?utf-8?B?VmJhNEg4aXE5V0NFTzFYL3R1N1kzNldtQjQ0QitDcmMwdkJpakJ4aFRsOVlN?=
 =?utf-8?B?akJGNmZVMUlZcE92bUxFbDloekRKbVE5RzIxdnRqdnhWN2pQWUhQOVcrT3NM?=
 =?utf-8?B?Z3hsZlRKSnVET3grMDFVUk96VUg5bnc4bDM3R055cnR4NGx6ZEI3SkhVTlh2?=
 =?utf-8?Q?6SpQ0PDoyj0r2dxwqmRU8Yw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3322713d-94b2-46e8-44cb-08d9b991c167
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 14:56:31.7142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDlo5uRyJ/tY4mzZwdOgWfH+1Km4Jtruc4cv3VKpkYHQCUOErIAFm+EfiY94WEVUWSHBC/Rcr2PoIahQJn6ryw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

On 06.12.2021 14:30, Jan Beulich wrote:
> From: Lasse Collin <lasse.collin@tukaani.org>
> 
> It's good style. I was also told that GCC 7 is more strict and might
> give a warning when such comments are missing.
> 
> Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> [Linux commit: 5a244f48ecbbd03a11eb84819c5c599db81823ee]
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Because of the ongoing discussion on the respective v1 sub-thread I
have dropped this ack. It was suggested that I may have misunderstood
and it was actually withdrawn.

Jan


