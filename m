Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2F458AC1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228665.395736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp52o-0003xc-A8; Mon, 22 Nov 2021 08:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228665.395736; Mon, 22 Nov 2021 08:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp52o-0003uy-6g; Mon, 22 Nov 2021 08:51:22 +0000
Received: by outflank-mailman (input) for mailman id 228665;
 Mon, 22 Nov 2021 08:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp52n-0003um-DN
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:51:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5caf3646-4b71-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 09:51:20 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-ci4DGV1rPBuwW1o4xuhBQA-1; Mon, 22 Nov 2021 09:51:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 08:51:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:51:18 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM6P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 08:51:17 +0000
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
X-Inumbo-ID: 5caf3646-4b71-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637571080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zi7GBd2KgxU0iOVPiuwxSI/ci+UPVqYQyZX14nPLrcM=;
	b=OS9xVs3De/7mS67W0YzpNFkcn3djj31FOlW0cRKN0WE1EqkN1fwGMbyUAnd68EMy326I+u
	/9lRtyikK2jUHWLg09qEdivC7/ZIoqbdi6h3545pn3Ue46NtlWvVBmdRkcACDfFYT9fhfD
	t3H1kEYSMouy/jsqy5XavY7XLA5lKPc=
X-MC-Unique: ci4DGV1rPBuwW1o4xuhBQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnKa/lsi1kh7iUPtWtG6P2GE5NSz6R1qUUQISJeSBmJY0XD80MEsfV/XI51djPooQC7f4YlzZXg+58NvSpBwUTCS7T9lcCmH09PrLnUf5BdMT4vvOR8D1vWd+G+iR+UdnV6AK+naO99eAUMk0mi9ceabQKMA7cO15UuHW6mee5K23fsf+HRIIriR49SGBWfDRDUzveS0Z72LeihAGCxotdYkyVd9MrSQER5hLBU2ZXQ3kMtV4FLblkSedUlsAhYxiSu6TQVCyzsz4Gj1i2EPXHYb6IoUUUPMTOmWKKswZ0yJYl3M/hCmtCZsS2j7uuxFWuEtsWLEv3SGnCZqwqEIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi7GBd2KgxU0iOVPiuwxSI/ci+UPVqYQyZX14nPLrcM=;
 b=YyyD49LLto4dXKefQlyTe+v6q022RroyXnVW4aYo89KlqpTY/j0pYjxRq1JqDJXXlco223kfKhGjfuDDYU11p11nN7zKNF5fUqLg1YY3a8nJaz92xGgkmiP3IX+GvqDbFROuYz094ezP94euqzGmehdljPaKTotPkzZWym6pbeBz4zYkQyasjdd6h1aMJESsgszzP+9l8rs2+H88GITiVgVrc6PjkKlatYw3gWLzaUKkHvvHCjkcN1JwOJd+YJMVmZfcXk7d7PIalT1kInH+z3wtCWSIpMyI9KsA0+xJrieRG2bVgmCxe1m51NSGzIJ1q8a/j41Chg8beufPEVVMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb0dcba1-71d1-faf5-fe01-46ea8e5896bd@suse.com>
Date: Mon, 22 Nov 2021 09:51:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/5] x86/traps: Drop dummy_nmi_callback()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211119182106.14868-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4441fe2-298d-4b2b-27cb-08d9ad953fa1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35355EE04267930C5F5D515DB39F9@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1EhVbKfUh/PyGcuEf8PkeXVDqQ6nTf9m3XyTe1pkie5CSwp+ROlJzbbGQdldqD3pw8iD1CROwzq2pgHwKTntFZ84VuKRMNqQV/1bCi3aKYA0xCDJNUawTV05dhGfeoVIFZr1tsEIwxNKAGiK/m+V9YpP2SiPjQk6h4T9blODSwvm5Nk/fbY/Dw/+f2CgntftcR31kAKF8sWynO+TD6yt7DutWFL5uDPw18F76In0luYUumuf4s4wpz18FyQqSYsWeoJoNsA2GJMoiyFIs0IJDUeBUDJgJqyDUJHB0J9uP+KyrldHbWZXn+d+CKKU3Ews5Z4Aktft+LR3k/mIwLh+PybpB39sX97qp46WVZodXldzvMVF0/8HJCPlCrGY6R/zRZ87rnohe39TGiqSOn3cvI2Dl0H3WfiJWyxKtu90cpKgFaqIFWw3fenqgXV8auPj0gql2oK+CbYc1CGX0Xs1MWB2Q9cM7KMc32OBIXg5aflzFWIaKujK3g2BlYDnoVgAPrLY/xuAvbDJVCpT9ZFLH7QOgKLlXvh+YZAvJ2GtfQr9+aeyGGrEDY0azX1GzjtTe7GIYlVHhIpM7Z4NZKoHCHyCy47bvzcTYPfp9KwIHu6DZYU4mclX811LBaGyk3XxE7ZHO+7meq81pbCvXsighsvGMDlMbzvBAzJ6wwL7aQrn/XT43SzyxvKEdZ+9cACuVrcpCDoW8WK9KDD5QU8xAqXCghlN7GA+IBUbW4WY+VI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(508600001)(66946007)(2616005)(66476007)(4326008)(8936002)(53546011)(86362001)(54906003)(186003)(31686004)(8676002)(31696002)(2906002)(36756003)(5660300002)(6486002)(316002)(66556008)(4744005)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmxMUXRxYjc1cnlUUzVVSHFDdWw2YTlhbDg5MVMyZzd2SzZOSHVWakFKaHZM?=
 =?utf-8?B?Rm1pSzM0emdXV3Nhb0N3YXQ2QUg2TTVJSXlRNndiTk5hVVJSL3BzUGt4UVY0?=
 =?utf-8?B?T3lia0h6WnRVNnlFUGNnOXdvejF2dnNvU3ROMUZsQVNuMmFxUGx6blh6c0Z4?=
 =?utf-8?B?d212UTVlZHV2L0pqNStoc2pXeGtmWC9INWswdSt0akdjQWJXMnU0ZDJqbnVY?=
 =?utf-8?B?WE4yRGpaMDlKYko2UGQzRGdNMmRQQ2FWd2JkOE5FdkFra0wxdTdsNUZvT25z?=
 =?utf-8?B?dXVkTHBNdERVZWhtdUptZXpRKzBwSnplYU1VbTBFSnIvMUZxTTNvRTdFK2Fy?=
 =?utf-8?B?cHZ4VFZnbnppQ21weXNTa1NYVmttYzdKbTRHRHRwMExJRHVhemYwdU84NVJl?=
 =?utf-8?B?K0RmRU5FQ0tpVlJSSXVrNzcwdzdDK1IxZ1M2LzBrNmdKdFR5OEwyTlB3WWFV?=
 =?utf-8?B?UUU1SHFhcDVCS0YrYiswSU9zeFBreHpsSVcwR1MrM0lVYjZ3eExVZ29SU3Ew?=
 =?utf-8?B?b28xWXB3Tkw4S3lCMUtqTGFFbGp1Nm1uaGRKWklqb0VmVTNFYjkzcVQ2SGJv?=
 =?utf-8?B?NFFJZVpFbi94bDRBeW9EVzhONllPeGVwL3JhSGMwWnNJeS93WDdVLzA5aWF4?=
 =?utf-8?B?S20wQ2RuOXR2a0xKd0JQUU9DYjJ4MUUvRmNzQkg4NjdWaWhGN3RuMUxwVlp5?=
 =?utf-8?B?QVVTK0t2YjM1RzZqalhRdEtCR0dydWkxVmwwRGVPa1NtbVMxK1Z1QkZ6UWxn?=
 =?utf-8?B?Y1hxSVRqeS9EcGVQT0tyZXB1eTN2TGVTUURGaHJGc2hmZWMzK3lHNUNrbERR?=
 =?utf-8?B?OUpnVWhYbUQyK1VrSHpkNGxZWnVKNDQveVhjcmRXK3ZUYUZXQkhFazh1TVh1?=
 =?utf-8?B?MStRMDhFYmd4OVVDMDJCQnprMU1LODIyK2Q5ZnM0SjBFanpwcWdjSzFHTTBr?=
 =?utf-8?B?d3JGdkxZLzBCVDZPcG1QaVVna09LMDVkUWVSYURHeThGMXJyYjJDOWtCbDNi?=
 =?utf-8?B?TldROTJNTVNZSzBuODc0b29CcWZzQmM3dmI5NldEaDFYREorZ0d0UEIxaVZj?=
 =?utf-8?B?Z1ZxTm54MEs2NWxLVVYyR3FkUU9qVmFXUTlpUG9WaHV2dkdKTXVXT2lsdXpB?=
 =?utf-8?B?S2lIanZlK2lEdmJhVmt1MmRLUnFLdm9GNVVnbXpBeXZqbXFTeGlrTXcxVVlp?=
 =?utf-8?B?cFMvbmNheWQvRytYcmhsNml1QmZneGVwUzc2bnowd3k2VnNLWFQ4MWFjZGVM?=
 =?utf-8?B?MzdyOENKVU4wNy9WWXpJKzQwakk5WjNjQWVJY3NXN3JZcE5vRC9XM0phbDc5?=
 =?utf-8?B?ZStEaWJWZDNyUnlLY3AyTWM3VmtzNzMvMzl3U2ZHSGMwcWdSVTRZVEMycDFU?=
 =?utf-8?B?ek1WMlBUTkpodklSenQzZ09UNzhjenhucmVrOXU0Nk5ZK2lMRktpVjEyZFdi?=
 =?utf-8?B?SFBleVBCOHZ5enhoY1oxbjZMdUV1STFtUGZCRUdrcW9RRDZZYk02VXQ2aGR1?=
 =?utf-8?B?SnEveC9jc0dySlhvamRvMXZ5eGFzMzhpVXJWczR6dzB6MVkwOGdZc1IvZXQ4?=
 =?utf-8?B?VTJQbkVmWE5wRzJoc2c2bXc4aEhaallidUJ4RDJxSUY2eldHSmZobkdlRnpn?=
 =?utf-8?B?emU4Umh2R2dvUnRHQmh3ZUlON0xSL3FoMHZLR2FWeEdIa1FnOFU2ZFE0blN3?=
 =?utf-8?B?RmRocmgrd09uWmxoZFpML3JpL21RNXNyV2JFR1J2ajI1SitXQXBUWlhRbGQy?=
 =?utf-8?B?NW9vWWwrZ2VGV1l5aFNWWXl0Z0kyaE55alltclBUSk1jcFN4a29ZVWhvbjMx?=
 =?utf-8?B?TTZ6bXlnbEZiaEQ4NTRVQkxkajRrdWFWajNaTEFCRTd1a040dHhaclkvdWJG?=
 =?utf-8?B?NURDeGlVKzJScjZvSWR3ZWw0cDFjMFRnQ1dKMCtvcXBJclhqazBpZExkaEhP?=
 =?utf-8?B?d1JNZWpqTHhVYUxYSlFxLzUvQ2ZCMGgyUTlEUFZSRXllWHZpUmFRQ1VPNzh6?=
 =?utf-8?B?OEpwYmtyeng3TnFEWG5kN3hMcDg5S0w2TnM1UlQzdVpCbzQydzAwa1FIOWl3?=
 =?utf-8?B?dGkyQlFtcDgwRGM2TzhBYmgvVFNHNFlsdjZUK29vaTR4L1Y1ZVVrL2lTankw?=
 =?utf-8?B?L1NHVFJUM1dpN0dGTlZSUVlTQlNmYU9wZzQyS0c3R2xZZDk3aFRrWjBCdHE5?=
 =?utf-8?B?cE9jSStQZ0NsMUpzMkpyY0FIcU9RSEFLRFFSR0ZVU09jc05RZ2NGV2NnZ0pr?=
 =?utf-8?Q?MDkjYWxpgAdbaqY3ge3KBuw6Czt9RVMlTgB7LQ2ZAY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4441fe2-298d-4b2b-27cb-08d9ad953fa1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:51:18.0373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8fphftz76mcBWlF7DYUXTzPjhR8wZsklMKEp1sENPx8FvUpA79nHKe5ogaGFvDWw2T//5o8HFJcnsd4nX2sNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 19.11.2021 19:21, Andrew Cooper wrote:
> The unconditional nmi_callback() call in do_nmi() calls dummy_nmi_callback()
> in all cases other than for a few specific and rare tasks (alternative
> patching, microcode loading, etc).
> 
> Indirect calls are expensive under retpoline, so rearrange the logic to use
> NULL as the default, and skip the call entirely in the common case.
> 
> While rearranging the code, fold the exit paths.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


