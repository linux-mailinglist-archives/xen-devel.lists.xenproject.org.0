Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F313AE312
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 08:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145328.267385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDIj-0004ID-Of; Mon, 21 Jun 2021 06:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145328.267385; Mon, 21 Jun 2021 06:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDIj-0004F6-L0; Mon, 21 Jun 2021 06:20:53 +0000
Received: by outflank-mailman (input) for mailman id 145328;
 Mon, 21 Jun 2021 06:20:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvDIi-0004F0-2C
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 06:20:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87f8be02-5eed-42c5-b700-e87e6d5882cb;
 Mon, 21 Jun 2021 06:20:50 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-LDTNUoYjNcahE98F_2ShsQ-1;
 Mon, 21 Jun 2021 08:20:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Mon, 21 Jun
 2021 06:20:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:20:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Mon, 21 Jun 2021 06:20:46 +0000
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
X-Inumbo-ID: 87f8be02-5eed-42c5-b700-e87e6d5882cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624256449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruhE0QKoRuCVYe7RS0x0yN4oNulKQ6DELES75MMD1vI=;
	b=ESy9RQjK93x3vH1GvbZvOdxlLwpDl0np1tAMGa3dimRh2HOfaUiSz6F3a7oidlodgzHv0v
	i9jYqXRj7dBvpZ9jBhK2rs4jrmIh/LJWX3F+DRglx8OiCGxZng4wtTC0Z9yoBB77YCFD4F
	jAhbDUI63GsRuuEU2Rgrjqi6v/s9Tbg=
X-MC-Unique: LDTNUoYjNcahE98F_2ShsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DevzNIQ38Q58EImuhosbplUFEBF9r4E4Y4AcSVTg5Ll0/2dvNoKmD3dklvF6czrWULSXOTXdbYXVTDiiabBJghDOCGgkydUH5CGZfJLVlqDrsNTcgTRDR/FCHVoffV95wgDSWbRS2XT25in4aL4HzrU5BvZDALSGjknR5ildNhurHLkQSr6x+YF0DG/43qmhFL4C9sh1MkCWLKDtdjyUVibHrXkdUXoPZDSpMlDSMnT8k7dVLP+Nkyr9ppkOGgRuxzX1ACiUazMH4WHE/HKSc6gtGMnVwHOQlu3s6yQpVh0OaMuKnfp14mG/AYaS45XMK3cTuvhds+P3MKlIdyJX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruhE0QKoRuCVYe7RS0x0yN4oNulKQ6DELES75MMD1vI=;
 b=Knw5IE/4g7Yj8XOU5kLs/oo9qoGIUCseL7OJsSJPmLkdLJbo86wTZz0dsJsP+oDIwq7oDB6TGAOt32ljj1FQMZ01JNc6u+FF9F4l5H5kqFLLx3njq7eamoRdKTSi4Ug3wicz6Qp37ceLK0l3EGj1w5MzN8nvF3qiYObrex+2T5S6FJ+/Qnmtl8pT7EDUeUvBRgIqeGV8FfApniK8dsQYbN2zvvJFN2+nOY1vS7MEdR9GWFqRolvKFWDBjcmN+fVuMGvHcHwYYuuDgZrcxlvlcu+hDeIutVh226ms6sFGisPZHtXILPjM46p9Y54G23IkrUINCOzzz19ckxlcxzKY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/AMD: make HT range dynamic for Fam17 and up
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
 <9fdd9760-6de7-be4c-a75b-0d3b1cc10a38@citrix.com>
 <ee781cf2-47c2-0b5c-4f21-37ceaed283af@suse.com>
Message-ID: <6f210c4e-4f52-af78-2bff-bdc65da6abfe@suse.com>
Date: Mon, 21 Jun 2021 08:20:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ee781cf2-47c2-0b5c-4f21-37ceaed283af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6938720b-54fc-4339-ef2d-08d9347cb537
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4607E1CDB069C2A8A9FCDDEEB30A9@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w0DHZCQ29n9KIFDbkAcB5YWkCEc+7gKhkNC531WrG1Gy77oyF7BljZ2Zn+dqFYibOCdsqH4LU8GHOIv1PhgbVqFFLUcrmMXdGrvxhoZeaFoHAVv/h6W67xgsiWnu58C8kM99HyjKTStGBBzTxeREa3kyPC2JZGN8Zrxw5Z6q+mSI7IY+ic6E707ib3lBhHrgxyvLNDzDztXZPVmnCwbb+PkqPpGhHZXex2nrRvs22L/qilntqBu7b7BQBCDwV3NpOszwt9nEHNumzN8/hPXJdhmKNkN0sSsC2zb2vuct/GgCHDR/YMr9fcCLrGBLzUVnIPXKXxggKznpn9Dusmbr6WQIVfWfVpwfvZNfR6sLJdJMT8A5kDkR/7hBed4xiTZYtg09LzxYQVIWPffzGOIcbNhx33El5S+nGS9yBoXGdSE5DjOwtitRG5xtx01EQWS/D0CP/c6Ye9UuvMrcWrfiJV/3K/8VF59oDQq5Yzftaup0VPOPTcze/DVHgkUGFwGaotWpYqIthBT9JD0Ipt6ynxwSK2OeYv7EJuiVFKZLBcKRIhtYsFAk+GYULXCd1+sxC9sewtDGjG60xmxZK6o6lkCqFw5nIdoLgsqhogb4UtKsym1WND0Agf+Q5xtDXLFkea62MytU9uiyCe3JvH8eYGr/HAtxnlDvW5ZCH8KDOG/qxmwvii5IadXr503QMEEr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39850400004)(376002)(396003)(346002)(36756003)(956004)(5660300002)(8676002)(16526019)(6486002)(2616005)(478600001)(8936002)(31686004)(26005)(6916009)(2906002)(4744005)(31696002)(186003)(86362001)(66946007)(38100700002)(54906003)(53546011)(4326008)(66556008)(316002)(66476007)(16576012)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTlPcmEvWEVKOUNyWnJnV2xVRnpvcG5yR0I4Vno3UEtGYnVJWnhqdDI4Z0RE?=
 =?utf-8?B?d0tkTlUzU0J0U0RCZTFyaGJRTjdYKzdDMzd2RHBzSThwUlVJWEl1bkM4Z3Qv?=
 =?utf-8?B?emJKZDh1UHprT0k5MTYvSVI4VkxoSS9JdUhkd0VuSXB1MkpFQ1kwZVdNR1pJ?=
 =?utf-8?B?THcwSkJQNEs5MTFVMmZiNTFIWFhmMlpRRnBQbXp6bmlidkN0TXNVZXNaVk5C?=
 =?utf-8?B?UTh4eTN6RFNndEhqZkpka0NIUTBEVUdzYklBQ1VEZ3RWVGFsMTNvQ2p1dU5z?=
 =?utf-8?B?NTdzMWZyMUc0NjVGNHFCTzhrSlI2WG5jcTl2VDVCbFpyQnBKV3NEbGRvOGJN?=
 =?utf-8?B?b0RsM1JWU3kxM1gxWUkwQ25PayswbkVwTjFaU0lGRnJlS3NSZG04TXBlalhE?=
 =?utf-8?B?WncxL3Fic0VYSmRxckhsYXRMMUliMGF2OXY4bFNSbkJNZEp6REZWMkRDUjR5?=
 =?utf-8?B?SGJ0S3NsQ01RV0JpN3hFcnYwMmFmaktEZVI4ZUo4QW1zeTE1WkQwMHZDa2hG?=
 =?utf-8?B?dXVHVmNGeU5nREdLRUR5N21wd1NGZkVUbnVMeklhVm1NR21KWlM0ZXBtVkYx?=
 =?utf-8?B?N2ZPNVdzU0RCMGdRZGl1d0hPOElncHFzVXNUQ1p0ZysyaWovY1l5QUw4VkJZ?=
 =?utf-8?B?SmNlb1Y3UnFNMDJwTVFsVzhqS1FDOU02Rkg3SU9oWjhJZnpiblo4Y0l6NWor?=
 =?utf-8?B?NVNIRDFnMk9nbGUzYVR0NE5vbHdsT1R0QkJPS3JOTHorM050YWM4TGpqMU55?=
 =?utf-8?B?K003cm55ajc1WXQ0K1lDYXRaUzFIVXByeXNqalgxeDczZlpMQ3FYM0xaa3R1?=
 =?utf-8?B?eE5kT2VaV1NUbWh6Sk9IRlhiZ29zZFBYK0hWWVBWMzJDU1FxMEllcFBTUTdw?=
 =?utf-8?B?ckJ0RmVKTCtVYm5WNnZSeDM0YlZIaTh6c2drTGlLZVE3Z0NUeVBaNFJmYkhZ?=
 =?utf-8?B?MXM3SEY2TS9ZOC9sOVlTUCs0RCtqK2p3OFlUWmJzRnNXYzlDZW0rSWQxa0pX?=
 =?utf-8?B?Q0RmQXB1NUJZdys4SCtzVHFER2laTFZWb3FRQ01JNjNtaVk0UWlVT2xJMEVQ?=
 =?utf-8?B?SWJRblVsMUVOSjUvS3NFbFNBWnRqcVRzZVY4cG1TYkxBOWdBNjlpRnlLaFJR?=
 =?utf-8?B?NmlIMmlQWStDdXg3MVcwcHh3MUkzRUpNWXhqUjlNbEwxekVBOWF1WFoyQll3?=
 =?utf-8?B?ZkRrVGlrazFUT0J4SEpiS3l3dkRPWElDUjI1Q2ZhaFAyQmRFMkltZnR4R28r?=
 =?utf-8?B?dmlpNzJKK2pUTkdWOGtLRGJERHlrY1Nxbm5uL2dSZlp0cmVBaGJydXVJeWlt?=
 =?utf-8?B?NXB3NHRlZDZ2c01mOGJ5VlcrTkl6a3hvZlhhV0Zqai9McVd1SmJxY3pHWU9N?=
 =?utf-8?B?VTJRcUhiZjZNdElLMkp4N1Zic25uOEt0eStpVFpzTUc2SHREUnZtS3NmMEhQ?=
 =?utf-8?B?a0xiK1FUeWx1SWJoWUJXQ0dReFoySXRTUmI5YUwxV1VmOFZuMUhWdU5PRWtQ?=
 =?utf-8?B?cjJWSnZDOGppQjR1bEJlL1h3R1g1Tlp3QXh3NWgzUnhVRGtWRisxbHRVZ3Zi?=
 =?utf-8?B?QjhoZjRVSGRtN2s1MndqakN6N1ZQQkZyZ25LTmVUM0NoVDZ2aGlTVVljdlZj?=
 =?utf-8?B?L2hDNkpwVHFNdEZrdlNRenM5MGpzajYzSDdvSm1Eb0I3azJMcnhSVXpxZUx5?=
 =?utf-8?B?VDNpalIvL01rR0pYTjViVWtTVWpxMElwWlFTdWR1V3pQYWc2ays5Q1BGUDFV?=
 =?utf-8?Q?9KsZVfJx8rVUg/NEiHVt3eJYN/aj1/IvKn7B9yX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6938720b-54fc-4339-ef2d-08d9347cb537
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 06:20:47.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MEMJsbjBjrBTFqWkeqaQEZ25EPAl4WWTztP9GXVWZgeYnRzMEy2ktiqlp7XX7Qa/tDE8w/Qkc3sObkw2Pmuqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 21.06.2021 08:18, Jan Beulich wrote:
> Another aspect I was wondering about is whether
> 
>  		if (paddr_bits > PADDR_BITS)
>  			paddr_bits = PADDR_BITS;
> 
> should apply before or after subtracting the value from
> 80000008.EBX. I was first inclined to make it the more relaxed
> way (applying before reduction), but then thought I'd first leave
> it as is now, on the basis that the PTE layout doesn't change, and
> hence 52 remains the limit for the full address.

Actually that was the wrong way round - the PTE layout argument
suggests I should cap first, then subtract. Which will also simplify
what needs doing for hap_paddr_bits.

Jan


