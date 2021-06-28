Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E13B5E33
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147850.272948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqad-0007Rs-RC; Mon, 28 Jun 2021 12:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147850.272948; Mon, 28 Jun 2021 12:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqad-0007Or-Mc; Mon, 28 Jun 2021 12:42:15 +0000
Received: by outflank-mailman (input) for mailman id 147850;
 Mon, 28 Jun 2021 12:42:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxqac-0007Ol-QF
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:42:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14e512c5-6921-4806-8a6c-45e233333501;
 Mon, 28 Jun 2021 12:42:13 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-lbt7wlz2OTirEiRABSiFdg-2;
 Mon, 28 Jun 2021 14:42:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 12:42:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:42:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20 via Frontend Transport; Mon, 28 Jun 2021 12:42:08 +0000
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
X-Inumbo-ID: 14e512c5-6921-4806-8a6c-45e233333501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624884132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P81GsxTs/2DdL45WpwXDIwGJ3vkgQ2EGgQS6E3ldKns=;
	b=nDe9HQw2TL5CX19ddorXk3hxbBv9EkXjKWbeRabBz5lIt3dodaOY9/8YIqS+1UOjSJxcVP
	UDx4akHPctFLy7p70K8r7AjJ1NDRyRGNtyS3liYgKhIrl6sWpHYVVm4sqYh4DHS1/950E7
	Y3jbMsBRxvOSb2luNTDIibHuuEuFogk=
X-MC-Unique: lbt7wlz2OTirEiRABSiFdg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfXQ0q4iGR/TXOxJFobspa/wsJ+BbgVO2TjvUlH4hzuZegyAEKB75tj8v4hrmaManSk1y5qsG1LQOcnNVFkxyBGBg3+wpBCBsA4RB9PGoP0uWIL+UZ4uYh4AZ+v55Wl0M+m74tl9uvGGAsIpHeCgui4ezMkZWCS1q8pIWqanRntxCJsbaLU7ZKHdERmjUSiVAVF1WvDu6aDwKXocjHw6iMjn5nnV8ZpP2FPD2rdxvML4u6PUnxQeHIRx4JOCTQT2LoICP/fNqsTgdjQt5JroUrxM3CAne5bh6D49xWC2NMpgtroCqxF8Dosi6VxqCXuLiJqFvKzFsuG1V7IuvfSRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P81GsxTs/2DdL45WpwXDIwGJ3vkgQ2EGgQS6E3ldKns=;
 b=d5LdxdioawRpfUu1j9yUAkqf+FiZ6Lji0Gw3LZKxUNQ6kN6Zlm8FZLquayLWQdsttEaPOfN7Nz+dCMsqsFp4rpckYPzr6JQm1kDexRK7Dm2N95N+D3uREABcF0ASbU852LcCkaB1jIgGrMR4S9NREVU0iA1vytAUEzu6XwSZhr4xZbQqETf9SEzjqvbguChcJvc4v+ZmKY72mQ168O2oFX4X0CfVCkasR2RKuonhF8rR3cmODVIjg4K5Q5VMM4jLg6D2DM3gnSDYhpqYMG6tLGrWE1oetaeGPvmy9KJlf7sr/s36JZUNk02PCiWoGmbXFIdn2NSI1pmCFF1bOWrJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/4] tests/resource: Rework Makefile
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210622182124.11571-1-andrew.cooper3@citrix.com>
 <20210622182124.11571-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb9dc908-78d2-7738-9781-c29b0b37994a@suse.com>
Date: Mon, 28 Jun 2021 14:42:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622182124.11571-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01451b67-1792-4127-a8c1-08d93a32248f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB339107597B3949BE379D6284B3039@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gLec3ccxsKp6BkfFz0EIylPF7sy3svGBIEiM/NBjuDnwQBIIE0K4FKz9eIDtaFJDscD6scJSAiyEBQ8VuIAFWRu4BQWfp4IHoAuKN0bgTUrquwHV2OLmtgS3IRUA4cJZ4+TLI6MSKHa12h/xGKIkmyOR0UnseWJOuRlj0hxPghwC6W+1MU0dDf82TBs6b2XC79hkRLEYBdffplqS+4VwtJwNGV2gYCRl0X+34sYGXOBfC/qpueNb5lfRr3RhWVnUF8lwjj5RRWI371+YY8VlLNiX/b1xBtA4dyXgr3ddG3+p62lZTWw7SlZC9cRvvCJ8v4SKTN+cvPBVCKDS9Ruu1jRUOH71Ikmx8q/hyexdt8XX0STLfE+ZH/EX6vqr2B/Sq0vBqwBDIGaTcg0oxz3lrj4xHm4QUlyOjjvWlPMt6p9p7g+U8ajrXaYIo2G02YSLS3fSR0586M8c3Ui+3juEHX/9vjSCtetWCrGD8OJxKIkeBa/QC77+7kqgYU+UYGtFq9sGAp01niCzdIrLJTBHOZQPtMeXH/Wyk0e4Wjp0MEdN0d5uDGQrf7WETjoy+3xxdnqvigDVwSuhfA0iCpP58/pbbrWkP2LnYrF7GKoCw8iLF7J1MelBlsgcHrDD2o7op0ikLz6UgfxQ75WRA5sakw9vnVv9sfgE36yuns5dV9+JUsNo7hwi7piNzGWJetKZpmy8uvIWhIMWmubZx8qFJvrLw0TIG0Jb2gwxoHPf5KY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39860400002)(376002)(396003)(8676002)(16526019)(8936002)(956004)(31696002)(31686004)(2616005)(4326008)(478600001)(186003)(38100700002)(6486002)(86362001)(36756003)(5660300002)(2906002)(316002)(66556008)(4744005)(53546011)(66946007)(54906003)(6916009)(66476007)(26005)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tlg3VGNzRGlTblBGKzFxYkZCK1VrNGlDWU92SmpBdHhHNEI5cjNFbFhxbEx3?=
 =?utf-8?B?ZklydE4yaE9MQUNEM1V6UXJBaHpRS20vWGlHOER3VWEzYTlOZHZLaWR4Mndu?=
 =?utf-8?B?dnk1bndhalkvbFdEZ3ZzODY1ZnZsYVVGRjVJV25NL3d5NHltbjNlVHpiQUU3?=
 =?utf-8?B?VHlWSDRoQlpuaTg5bGhaNjM0VHRETGZxVUdEdlUvZTNLOGxGQmVHRmpBd2Fr?=
 =?utf-8?B?elN1MG1oWVd6WCtySlhITFdJK09mSUp0TndLbExqMUJXTDQ2N2JoSW1xNWhz?=
 =?utf-8?B?ZzJIVGE4NnA2RS9hSHZxK20wa0J5c3NxZ3hrcGsxalZWejAyQ0FYQlU2eGxF?=
 =?utf-8?B?WE00Ym9tUjhtUGREaEp2aWdISm5qeGpqdUlIeTJSZVIwakt5b2xuOUxFMU5W?=
 =?utf-8?B?YzhXY2xDVE1tSXByVi9kZ0RGWU41TGI1TW1COWZoTW5HWVNhK0NxWDEzdGtZ?=
 =?utf-8?B?NkFnRUNveHNLbExDMGhVZXVRQlFreHNvejA1SDYvR2dydmdhZGRzdUdVcUc5?=
 =?utf-8?B?WmlVaklmOThNaFlITjIwakxueXIyZ0F3Y1Y0RmpPQmxEQ0N6T21abFRNbG4y?=
 =?utf-8?B?TGd3SlhVK2lPUmxNL28wdjRML0Y2OEFEclE4eVZFOTI3d21nZkFPVmxxZlBT?=
 =?utf-8?B?ZmxkMXFQWTlkdkNaMG54K3VLNWtWbHNEdFk4VjRjb0NwK1MzMWRzaFhyb1Qw?=
 =?utf-8?B?aEJscVlFWTZrM1hTOGR4bWVCUUhrNU9aK05qNWN4MGJMUE5WcE1mRERkZjRv?=
 =?utf-8?B?cENlYlZHK3NmZjFzblRZeFdIQkpzLzh0V0tLWldDbnQ1SGVNUklZak0vNmNS?=
 =?utf-8?B?Qk1JZEFCNmZDUXgvRDNKOFRtZEZ6U21tOTVsTHZyVU5ndVVQcytPMFRhM0dv?=
 =?utf-8?B?VWtSSW9pRG83RGcrY2RXQ1dFN3c5T1hLRUpxYm1MYUJKenM5a0lJSVh0UDFv?=
 =?utf-8?B?d1dKdkg5YW11T3huTURpaWdmRzRwa1VCbjV2Q2x1SlgvRG9Id1ZmZys5RTJu?=
 =?utf-8?B?RnFHWEMvN3ZEM2lFdzZQcy8yQ3lab1dyQ2lDWnErdE5SeWd1cm5YbUdUVlJP?=
 =?utf-8?B?Ulk0YzlQSnN5UzNPK2hzWDVMUWgrUlI4c2RHM0RvalJLR3ExRGtieWt2endN?=
 =?utf-8?B?b1FpSmtDTjVTM3NQUXI3aDRRb24yVDh5RnI0QldETHljMXdCeVFqckx0My9G?=
 =?utf-8?B?bGUzUjcvaEdaZlBzdEFmSmlaM1RCYnA0Sm8zd1dqK0o1WUZBMDBPM0lOOHJk?=
 =?utf-8?B?Zm9sVzI5dEtMWDQ2aWJxWi9RKzdKRGRUWkMvVk1kZE43NHJpQ1Z0ek0ySWZO?=
 =?utf-8?B?VHhTZUdhT00xMU1UVkhQaUpvSnR5K2xTZ1pZNmw2QklCT1hJZzRuR1B5enV6?=
 =?utf-8?B?S2JWclJhakZyVlNiMHRtaHBHaVdqYWxBN3c4ZTg3OWtENlhSYzFLRi9LU2xs?=
 =?utf-8?B?Q3NoeGpid3RScCtFZVhUUG5kTUxrbk1wRWhyQ3YyYU95NkJoYWpTUGJISmI0?=
 =?utf-8?B?aFh1U1FpSm8vZW5rUzdaTU9zN1pUdXpkS3VyMmdnRGdoZGpnZElFYVBXQ0p0?=
 =?utf-8?B?V0NXNGRYWDdDVWxlMkxsczBEMk5DcVNIVExNa0lWMVJCbmxGamdyNVRsM3gw?=
 =?utf-8?B?R0dZUnFIMnlWZ1p0cUFKNUFZNncvaWE4YUNQQTVuSzBBUGdqZ05QMjUzbkpn?=
 =?utf-8?B?TGJ3clBKbUZFNUhBODhleEFkQWxoKzRhZVd6QUVTekVBN2V4L0x6TGlaMDRs?=
 =?utf-8?Q?rkiTz+EFB1O8qZTsCj0XwkKT3lLNgY5EKFDJfq7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01451b67-1792-4127-a8c1-08d93a32248f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:42:08.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3FtGxN72Dtbtjm6yPMvVTSS+0YREU5Q4XqYbZMAMWdFJ1uPGKwrVAORt5E4P5pNbAJQ6aX2X/MS9IV5+mjGWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

On 22.06.2021 20:21, Andrew Cooper wrote:
> In particular, fill in the install/uninstall rules so this test can be
> packaged to be automated sensibly.
> 
> Make all object files depend on the Makefile, drop redundant -f's for $(RM),
> and use $(TARGET) when appropriate.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/tools/tests/resource/Makefile
> +++ b/tools/tests/resource/Makefile
> @@ -12,17 +12,20 @@ run: $(TARGET)
>  
>  .PHONY: clean
>  clean:
> -	$(RM) -f -- *.o $(TARGET) $(DEPS_RM)
> +	$(RM) -- *.o $(TARGET) $(DEPS_RM)
>  
>  .PHONY: distclean
>  distclean: clean
> -	$(RM) -f -- *~
> +	$(RM) -- *~

While needing to repeat very similar clean: rules in every Makefile is
already looking odd to me, having to repeat this distclean: rule
everywhere leaves me with even more question marks. But of course this
is nothing you introduce here, so merely a remark.

Jan


