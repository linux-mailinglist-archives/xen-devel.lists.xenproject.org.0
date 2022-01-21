Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F06495E0B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 11:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259309.447463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArch-0001cG-Cp; Fri, 21 Jan 2022 10:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259309.447463; Fri, 21 Jan 2022 10:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArch-0001Zm-8I; Fri, 21 Jan 2022 10:58:27 +0000
Received: by outflank-mailman (input) for mailman id 259309;
 Fri, 21 Jan 2022 10:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nArcg-0001Zf-Gp
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 10:58:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e69a160-7aa9-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 11:58:25 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-PxJxeivuP9SBPEi-lATilQ-1; Fri, 21 Jan 2022 11:58:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5717.eurprd04.prod.outlook.com (2603:10a6:20b:a6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 10:58:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 10:58:21 +0000
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
X-Inumbo-ID: 0e69a160-7aa9-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642762705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6+ptzKeC/AoCLgxP2EmqYSd9GfGq4dxrqsOG+6vg5U=;
	b=i6J3K4D3Be5h7uZdi8K2s8PPYLmuNdS1w9HCpE+LLWA+mkUuHwAVWWu1OckGxZj0SN5NGt
	O255ePHV4/iJxXqmFrGu+SMS2Tld/jcVEc0ynJ8Rof6bZzni9P1fHrHoa1JkLIze/nArr6
	0wtNL9lY+CCF29q5UxQxQdQrZHJm6Ok=
X-MC-Unique: PxJxeivuP9SBPEi-lATilQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIi8O2vKRuId9g9FRG1NV0rnnlde123t/WhmGNczwyjC9f4gef5HbfW+jb6qrgO9FmYZ599hWXxhdvWFvPxK5e/wbl1VfwdcvYgcMAZso0d7J/aSboQBpmpVu5PMkIiIPgxCZcXlvA+cR8qbah0uFVDvH1qsIvqzz4GPT+49GnBSgX05vkOgNJUcvOJ560JBHDFxs/IHFlwjMl2xW9NI+DRU5Q2IrtRkFl0aoCefxGU6xk5IpJifvuzgA7ONxu9EcMYH4DDhHNQ1Vw3yx+PX6uXYHfYPMamlw+82DD3+L9qMwNZt4//nDeyxkUtasXkWyVx36Fa8H3i14K52GBoinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6+ptzKeC/AoCLgxP2EmqYSd9GfGq4dxrqsOG+6vg5U=;
 b=WSZMqWAoUbhCa8349XLhFkgiwTh7HzBhEJl7O8VxYQ4hNhvHWfW8athayM0NuUGUSmwKt1GfPBcjOAgAQDfurPj5649eSccwKQj1JNr14CrlUDO8ukt8ykNKwSyio++eyrNI7fZcCbpLBV50f7BNGQROtjK6/V6ZsNsh5mGieJGLTEyw0+jcUwVVrADZDbuB7PaWq0Ap2fobS37yXD7t9dYRon5rAl6sEeUARhw4bV8vHRwJVAJSj1ldS1K89v8TPoPH+s+m051CFsHVcoapL+WbE4SWRJmJ+EwaiKm9/qFGcSC4E6gz0nZT6GTT6VOWCemoBAeD/4SouyvdbI8wKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af269b30-314e-2a4b-f5c3-1bca08e59463@suse.com>
Date: Fri, 21 Jan 2022 11:58:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v8 00/47] xen: Build system improvements, now with
 out-of-tree build!
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Connor Davis <connojdavis@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Paul Durrant <paul@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <86033c13-c444-aac1-6043-73ed12c78240@suse.com> <YeqMPs4jghn9V82f@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YeqMPs4jghn9V82f@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0047.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51f61bf9-90ec-4101-957a-08d9dcccefff
X-MS-TrafficTypeDiagnostic: AM6PR04MB5717:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB571794EB7BB1EC77A25C7EADB35B9@AM6PR04MB5717.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ScuYwbPlYHCSqHtQUdQlWsncPLnBWegfLtuW7LtpBxqw7f6UeuM21jUXo2EQTx49ZLhrMbWmp1Y+2TZ8pZsNbPqLtfbYZyZHgJubyKS0Ob9zkUpWKtw9W2KJUC++1tsuSfoLYlWnh3BMwdXhizKWGsJuOKhCBDyBc1xo8AUXqMsn4ryJppjEEmesqNbH7NruqTVRp6kXJqlE65PO/tRu1Gs/XZq6s+0G5KHhFUKVsecOVbVJb5yUn9JyIeDz+go1kuki1l74STaB+Kgk7T3nLtEi+7V0cfPbTpU6ccLn8CiHkTtvApDwYyum5icuiO2y1jsWPmxU/82olpS6YztbUu6GrJyVo/ij+iGBAuTMbF9LU1tbeKErcW5e+bJL/L8Y3ZqzWiH8MobiN+bvW6BE1pRxPCgMDoySsxAgAZXGNyBGCBiuSeEkaQezUk9VZvADQjgvbtDCIrS1VlasMdNLxsakUqxjQciD1/jKF20gie+q2sGyl9LKU3X07HV0qb4lH477NWewn3/Kqdes4AGjZUBy8h/IpeB2NWkZlvUsoTxuu4bPWgD9uOM1xZZ3jaoBmly4VBatuLMc2v0NaPEXGbsIAVFC35/Y6LiCHtipHywXQL4ngqixf+4QubKGwE4u+wIA6o8GFzCK0k6oKd+Z/SJyLiaxqHkhoUgETYFjqiOghx7P40yes1obRKiClk1uxQOXVxijtBMTD8mwVB7HCY5cgY4b/VQkV3HUDGRAdlw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(508600001)(86362001)(6666004)(6486002)(66946007)(66476007)(31696002)(66556008)(2616005)(5660300002)(8676002)(316002)(6512007)(36756003)(53546011)(38100700002)(26005)(186003)(6916009)(31686004)(6506007)(4326008)(2906002)(54906003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lZWllEa3duR2NLeG82NG8xb3YwZGZXaVlpTFoyUUQ4QnVFR0ZRbTFCeHlU?=
 =?utf-8?B?K3RnUXFmMC8ybWhORmNkS0dKNzgzdkNad0JKQUxqWm9iNXczS201UG5sbEQ5?=
 =?utf-8?B?SHljUEZSV21HbkU1R3d0SWxUUlRUMndNc3NBbHorRjNFaUlpbm9IQ3pja1Q0?=
 =?utf-8?B?OWcySVIrSm1Jd3BxN3R1UVp3UEh5TWh0c1hYM1Z2ZGZDcXRpcnNhTzMxRnNN?=
 =?utf-8?B?YkxQZ1pwMDNPUkxlbkVCRUQrN0trODlMSW83MDU3enRjY0ZLS3VLTVY3aXFv?=
 =?utf-8?B?RGt2L05qTm5XZk9yVmZJOHJ2N2VYbHJ5a3kxY29QTVdxZngwc0xsZFVpYm9u?=
 =?utf-8?B?VFdJKy9CTlJyYjllNU1GWm9WS0w0TXdpRm50b1VJbm1kSzhwSEN0MGZERTAz?=
 =?utf-8?B?enZxVXY0cjNLeTI2bTFXZUNqZFRHUEszZ2ZXTTlxVjkzRU9hMmhWMlFrZlFX?=
 =?utf-8?B?OGV2WVJHUFRjT0pZWm11SlIxY09sZG1aUmRNOEZycUdpeWwvT1FOM3NFQzYy?=
 =?utf-8?B?RXlYTjYzYnBlVCsrcE5oUUJ1S2I0NVlqK1RvcWdGMVRFTGJMRHIvdzN1TXpV?=
 =?utf-8?B?UWROUEdiWldPYUljbUoxVzBPS2tuRVNjNWgzTmZsNHNBWTlsVjArcHp3K1Av?=
 =?utf-8?B?OTdtWHhLTkRRWWFtcU50aW0wbUFSWm4yakJwYU9Md1ZSeEtJd2huMkgzSms3?=
 =?utf-8?B?M2Z4QWYxcy95WkxpMit6UWVYc05maDVsM1FJbFNGZVBlMXd2M0xsOXhyYWtl?=
 =?utf-8?B?b0gyY1N4TzN3N1hHZWZaT2xMOXBZdWJBaUU3RndESjRSWlNCNkFlWmdQMUtB?=
 =?utf-8?B?SDM2WjZYRjdrQWJHb2xaWjE5Q1lXYWI0WllpMEJ5MER1Wm9DbE9Zd3FJZUR3?=
 =?utf-8?B?bnVWYXdKdlRkbmhiRWo0QmkzQVlrbitNNHpBUkg3Z1JXRS85MHM3bFRGWVNR?=
 =?utf-8?B?VXZIR3lieEZTR2paVHI1Q3g0cmJERXVXczdFdi9SK211VTMwbGJOZDZiSnBV?=
 =?utf-8?B?QmxZUnA1L3pMUEorQVorWVF6YzBxanhYM2d0Mmt1d0VwNWs4SHVWRmhQNXo3?=
 =?utf-8?B?c0kxeTR3Q0M2bE9RSFBuUW9QUGRadEcycmE3ejF6Y3FCT2xjVnlTN1VKNkc4?=
 =?utf-8?B?UlRCOE01NHltY0tlYys2VDBYWFU3NnQ0QVpFZUdYaHNxMUErYmZDNWNwK2N4?=
 =?utf-8?B?TTVIVXNQVGovNWFMY0p5Ui9TZnJPelp5MDNGK0NjOGRNY215SHNqNjYvUEo3?=
 =?utf-8?B?QlUwV0IzNGNqYjFaK2RtY1BMa2JCckd4aFQ3QzJEK3dGYXpRdzFPWVNBQlpj?=
 =?utf-8?B?YTk3bldvWjduNUQybXFDbDlIMjFYL2N0OXhMMm5saG0zQjlldWtHalg2cWRX?=
 =?utf-8?B?Q1lXTFhBbDZTRGprd1lXZWtNbll5V2VQWSt4REJmRFNGd1FEellqM3RtRERR?=
 =?utf-8?B?czUwb3V2OXpLYW9MUEY5Yk9UdVdvTThOMjVNTTdsckhQSVVoYzgyWC9TTVFN?=
 =?utf-8?B?VW5SWDFtS2lZZE9yK1ZUU25UNk5wa3FXOUFEdjEyQ3RwZTB0WXNJSjZWQ1NY?=
 =?utf-8?B?dlNOY2dPVHBqUUw4cERJa3duamFyVlVZOExpZTIzMElwak5CWC95TWVPS0RN?=
 =?utf-8?B?ak5jZ2tCcWdVTjBwNExLSnVpVEowODArU3BTSDhyTkZITDFZNXFtU0Fta1dD?=
 =?utf-8?B?TEI4N1JwTVJ0cmZsb2VjN1dlaFdQMUFsYjdOQ1kzUDRKOThKSDhua2xZRDkx?=
 =?utf-8?B?US9hNDIzbHc3Q0dNaVFGdzdxWmhabzFtc2d6bWp1VzNsT0tWUTFWbTArZVdL?=
 =?utf-8?B?b3d5Sk55cFhiakFiQ2d2QUs1WHpCdHBZSHVnODFHa01FMWUwd1NFN1lXTkkr?=
 =?utf-8?B?RFlDNlJUeTAyMXFVaWx3aHk2U04xc2s3VTVvQUZIYnZ2RE9RTWhtRGVLczNF?=
 =?utf-8?B?QnhjSTJlaTV1Q1VOaFc0VXR6LzZFK3h4S0dPOWQ3QzBIbWprUzMyeHg0WEtE?=
 =?utf-8?B?dUxsWURRUHh4TkE4ckZWeW9ZZ0RQcVlCZ0dkRDlkR3NYOGFBUEdURXZMUDBF?=
 =?utf-8?B?Z0d2cXZxOFVOSkp3MENmK3QrcThmcDRDNlNTNFNRNk9kamdIMHdXVDZBamZh?=
 =?utf-8?B?c0JzOXNoOVQyenNaK1ZkVXZtbStZeG5NbkZkZTFjM1dmVFZGYUVVR2dXbmps?=
 =?utf-8?Q?j3gspbA+IzWTtRHPYvY7kMA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f61bf9-90ec-4101-957a-08d9dcccefff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 10:58:21.0667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I+DeCZuprX3EtncTzBh4srI0k3DrVE3OXHzhlH9gVUjxHTkS2mX731d5icirSpVo2N6vmq+xDquQvP32bTTzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5717

On 21.01.2022 11:34, Anthony PERARD wrote:
> On Fri, Jan 21, 2022 at 07:59:40AM +0100, Jan Beulich wrote:
>> One more question: With an out-of-tree build, where do I put the
>> (build flavor specific) ./.config (not xen/.config)? I'm using this
>> extensively for cross builds and to override tool chain components
>> (to avoid having to remember to always specify the right combination
>> for a certain flavor on the command line).
> 
> You mean the optional ".config" that "Config.mk" includes? This file is
> still included as "$(XEN_ROOT)/.config", and XEN_ROOT is set to be the
> source tree.

It being taken from the source tree is precisely the issue.

> Maybe you could abuse a file named "xen-version" which is included near
> the top of "xen/Makefile" instead.

I don't think that would work. The settings from ./.config are
needed ahead of

include $(XEN_ROOT)/config/$(XEN_OS).mk
include $(XEN_ROOT)/config/$(XEN_TARGET_ARCH).mk

which come later in Config.mk, at least when e.g. config/StdGNU.mk
properly used ?= . Plus obviously for the 2nd of the lines above
to use the right file, XEN_TARGET_ARCH already needs to be set to
its designated value (same would of course be true for XEN_OS, if
one was to override that).

Jan


