Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F7457032
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 15:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227966.394431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4Rz-00042k-5Z; Fri, 19 Nov 2021 14:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227966.394431; Fri, 19 Nov 2021 14:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4Rz-0003zi-2C; Fri, 19 Nov 2021 14:01:11 +0000
Received: by outflank-mailman (input) for mailman id 227966;
 Fri, 19 Nov 2021 14:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo4Rx-0003zc-3J
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:01:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b5f5b4-4941-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 15:01:08 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-QRwT4SPKMOK3QMf52QLoKg-1; Fri, 19 Nov 2021 15:01:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 14:01:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 14:01:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:310::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Fri, 19 Nov 2021 14:01:05 +0000
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
X-Inumbo-ID: 24b5f5b4-4941-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637330467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIa1giVcIsvklToGbz5V44TUB6pCg01+BpmrwmOPOoU=;
	b=hpkreI3ZtXbkphTDolqD4bKWb9ZJgPprUaWHjwbcpWKgZXCC00c7d1HiWy7SaGs4Xyzlj8
	rH/QhQZ5z9g6/ZtHHFwyQdxvEA/EYzptFTVYhKUK8K1ZroV9U+H7bIykU+eOexsJYpejdp
	90iDBYKFxgd/uyjtHrRboiHdnN3TkBc=
X-MC-Unique: QRwT4SPKMOK3QMf52QLoKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfwQPKPoyw8Fos+TUdoJ2nNNmXTyLgxhU5EEkPF6o0Kj1/+NIKHueGzogdnLFXuof6GOHLpFjIuOQCFCBPcjgH761tDRZrXS36RHTDcxA59+IroHW58y+a/3j4voAWNwPY9gnwPEbtQwpPpq67v+ZWgio1ODbX+NE391VSv2kcAE7b00DPh3Iq+ZkamdQjiASi2bOa6VIhNUyZmxk6tnd0aCxeE+Io1fbMGHuO/+gujAbAmWZgXtNOMCCRE+ve36NUyFG5mSYo9kRiX4v+8yysvSd+EIELLdVBnNTbbdyyDbDR3Yr+R8/TApsOB5YfSqtbIFd13tyQGX8Dwp88JD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIa1giVcIsvklToGbz5V44TUB6pCg01+BpmrwmOPOoU=;
 b=HtJAkvLOhsSTndLMjDApgx/AjvExYwFnxVzB1+klXR5gj79gx5MuTs3v6BQws9XjwXKIDkF/IjrPydqdW7yhYlOtu3zRJGCBRPYDObxlCvKEu+DckcdK2xqpGOD8VOh0j1CW3PWppO8W2qEe6/hq6DrQX9bvOv3Di805DYCe+gVeytWvWM4vKX3g7kTsPlS0XPexw9PBlW5f0nLr7rsXMVN7MFXVGuSTt3UDWqweussUyM/0GaARfZuZ2oaPB3T9+SMhCCv56+nI9LxMjgr7w/LMfgV24PNIDZjXCvQqsJ3UJnJP8U783MEymBUQDayj0mW2W+RNWtldoVQYcnbojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4be209f-c9e8-9e5b-a4ee-70d1a4f5c442@suse.com>
Date: Fri, 19 Nov 2021 15:01:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] x86/dom0: Fix command line parsing issues with
 dom0_nodes=
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jane Malalane <jane.malalane@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119134416.1110-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211119134416.1110-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cbddf40-d066-4d09-7f76-08d9ab6507b1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB419179AEA48B68DF078866A5B39C9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z4Q/k5sEEiWdM4lnS0oJ2aY3GvuL/jDhL+GPu7bLjstydGNTCMmyzM+lTUm1i85lLGZCH8uDgYGRlCR7VYzP4e6z13uVgl+4Cof1TN/XUUfV0knVGtSTstHZE5r9KZl3S1tbK5CLnG9Bshinqbkj6HL/Lmea3l37ExS4s/kBsWusMR3JqYHNCplpEtMCdjlOO3yRFmI/nxPCS/U+vdZ+/iETPRZIN4c9gDstiC3vUvusSD4BUDoReuu5LjBRk/bZUDSjGbWBCuXAD6L3WpOqxRo0fpPeTmbXERjf9QnHC7Etn29YAN993WzxDUFj/mno+YC9+NlQNdeIRKZxnSJcUbDO6jLiyEKBGXTnouy8U2gZMhm3CpY+UaMH2WAfDD+9/KdXIHXIeS5Y31wqz6lfVfbKGWrJdcefHxNsASdtbiebw5klQD+fwEtkBD7rODpvW6dbzpVtjuC3k58QCjckvz9upxbsRptdy1QBvrohXrNsSrWpFyoM05Zwvig77AKKIzRhONH2ObjzY6vxNAscxXw3bDD/nHu6IVwxwMoXYjELftpzCL5PfMUYdQ4Wcbrl4UUZzjjGLMy2B78Eu1dOlWKHKpCDN77BHExIUnGnXZxjWBvpbdP3hndeOIFiAZuSJdNY/Y6Sb4hBEbDZLVSNdg79OluSfiqtq42nUZTKfx3IjndXg1RiHUbq39pyc++mkI2vcJE8blnYDnl0/0tG9dqos5edpTrtvoWZUlPkW9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(186003)(66946007)(2906002)(66476007)(31696002)(86362001)(66556008)(8936002)(16576012)(38100700002)(53546011)(316002)(54906003)(5660300002)(36756003)(31686004)(4744005)(508600001)(26005)(8676002)(6916009)(956004)(4326008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE13VHZOclYraCtnZ3FEblFLUGp5dEJSdG9ld3h2eUxIL2VmSVpxbjdaZlFz?=
 =?utf-8?B?b0JyWlA1QzM5MTl6R1A2WnkvckFnK0I0ODJPUkxtTXdUdDN4YWFJRmdta2Zo?=
 =?utf-8?B?d3doUE9IeU4xZjJWTFZzb2YrbUhjaEFvN2s5UDZkRjVNYnpoaWljTW9MTmdI?=
 =?utf-8?B?QVBoNEZjTS9QMmJWWkVtTmJmRHFUVnZ1ZXdhc1IvTHpBa3ZjRWpITkdmckQ0?=
 =?utf-8?B?RVFoLzY5cjBCblFOUXhRUkVyMGV3UDk0Q01xVlZsWkxiTUtiME4rZlZHcFhS?=
 =?utf-8?B?Wnp0TjVtRGVMM2JuSG50R3p4OFk1RUNtUW5KT05RcHcvWUdQZDZPNXphWkhT?=
 =?utf-8?B?RmZ0NlhVQlExQlVDQWlrNXc3MzIxOFV2bDcvRE9NYTMzaERNaE03OVdsSmJE?=
 =?utf-8?B?ekppaUZSalIxLzJUeVI3VlpCWkxIeWNoVmhoNDVEbkw4L3lYRWowb29QMFhl?=
 =?utf-8?B?UFZ0TDU2ck9BQ1FnQnUzTjhmcXdQSUdjNkd6dWFGU29Id1ZvY215a1MzMTJX?=
 =?utf-8?B?cmV1L09odjZPekNJcjJrMkhMYTZ0MVlUaGxYc3UzeFlIeFdDRk5XU0xydkhv?=
 =?utf-8?B?TkpNLzI5TW9RMDl1aXc3YlVwcmk4dmxYeGJqTVNEeWc2NDY1aUFrclZCQ1FE?=
 =?utf-8?B?RTJSVmFGdSsyajNoQ1FVdU5FclhzK0l3bWN0c0p5eWRwQVRGdGR1NUg5Y3cr?=
 =?utf-8?B?TGp1RllsMTlIRzFkMjBBRkFtUFVxTnVzU1JQVHhLMzFpanhpa0pjQ2RlTXBL?=
 =?utf-8?B?cmFqMTBmVXVHSjY2eFAyMElqczgwM21PZFJYYU0vNm5nMVRoRFc1OEc1WXgx?=
 =?utf-8?B?emdFazNNY2VGZjRvQmFZa2xhUm1LTDNVV3FKTUZtUzdsVWRjQUJSZy8reUd0?=
 =?utf-8?B?cjJDbWEvb29QcHU4c0g0Vy9VWVJ4dDFpdXF0L2xqS09EUDJQYjVTYkN6SGNw?=
 =?utf-8?B?L2p6QUpKaEIwZ1Jta0lCWmdOWUdDWFJQTk9aMFpOSGpnclJoZEV6SStGcjQ4?=
 =?utf-8?B?R0dHdDlrQm04Nm51cTlJVDNpSmFOUkVpb1hWbnBDd0k0QUhHRmVPdmpvTXZR?=
 =?utf-8?B?akJFU3kzNTJwc0p4NWtmYmp5QXdMWmhrL0JjSW1OL2ZYNTg5TWM0Q0xUbUxT?=
 =?utf-8?B?RlVUbU05YzlscWlneXl1b0Z5Rld5dEFkd2loQXRIakJFamNYVkZLVFh0Vld3?=
 =?utf-8?B?aTZqM0U1Qm9pT2hZREQyd0VFUTRqdFJYV0ZEbENQdmhINnhHbXZQVVJjeVZ0?=
 =?utf-8?B?N3ZZbFhIRGMzQlU2WHBFby9Ma0hvMVdqbGZhTU5lKzdmVWJnRUU4RjByRERK?=
 =?utf-8?B?dVJ4S1phNnNzLzZnYVBoNHdUdmtPZjZicUNsRkJUa2ZMcGkyazY5a0UxT2NS?=
 =?utf-8?B?OW92Qnd2MThPQjdTTm9KQXp2ZVRCL1BEZDJvQmxqUHV6UWE4RnhPWnBacW1h?=
 =?utf-8?B?YWxxdEYycmxKczNTeWNxbld3TDhjaGZOeGpnUjVzeU1adytqUUZIMDlsSnUv?=
 =?utf-8?B?ZmkvNzBuT1JJdSsyUU9sUXJpTnJ0c25WaTF4K2I2UEsvNHRyTVJNWGNMT3NK?=
 =?utf-8?B?SmhtRXdnUjZlU3ovdTRyVHdKNC9CMFFOMzBJMkU0UjRCL2N4QlI3SlRDNXo3?=
 =?utf-8?B?bzVJL2srL1piZmh6cDVNaXB1dUZsYjFITDY2Q05UWkJqZm54U1g5aXMwNEwz?=
 =?utf-8?B?QUkxY0hmc2laZjhGRTZFNHY5d0ZiUkpvd0lWdlZIeC91UjgyakJjYUQ0RnZy?=
 =?utf-8?B?cWpKSThlNVhPWEFLbzQ3czlUSVNjTUZTdXpzbFd5WVgyZGc2V1dWSFpjNGQr?=
 =?utf-8?B?aU5Nc0xvSDlVL3l3K2g0b0JzV2RMbmc4dFdkSHAweFdsc1VqV245cUtvNHBj?=
 =?utf-8?B?VUd6bzNzSHVTaFI5a0pOMzhtU09DVE9SZWJjOW5ETGJOcDF0eVJvKy9qcldY?=
 =?utf-8?B?YmVNdytLbXJhditway9keFE3OFRzdFBLMjhiZ3Q1RlBOb1lBdVpsS1lETnd5?=
 =?utf-8?B?MGFBRzRMYis5Z0J6K1UwMitWVlJ6N29UQnJod0Y3aWdGZHkvd2pjK0FkSWNM?=
 =?utf-8?B?Y3dKMTc3dVFZOGNTU1Jzb0x3RjBjZVRkZi8xMm9BaXJJWWQ0NC9Rd1c1aitM?=
 =?utf-8?B?WlhLaEpNWEY4eHdPcHBadisyOTBXQUdQdFFHWE90ZXUwb1VBV1hYTlM2cDNm?=
 =?utf-8?Q?4fuzmQcOwDdy/8OX8q8Hi/E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbddf40-d066-4d09-7f76-08d9ab6507b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 14:01:06.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uL5Cv4No8UrDGbaRcGgn9+QHD4qU21Qmcz/IpHiIZYF6IDDUcearw0bj0iYxmcMCjWuw2EwsKM+lDFfd2C1twA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 19.11.2021 14:44, Andrew Cooper wrote:
> This is a simple comma separated list, so use the normal form.
> 
>  * Don't cease processing subsequent elements on an error
>  * Do report -EINVAL for things like `dom0_nodes=4foo`
>  * Don't opencode the cmdline_strcmp() helper
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I guess you will want this backported?

Jan


