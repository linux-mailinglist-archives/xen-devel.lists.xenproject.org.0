Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE641120A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 11:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190494.340313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFrZ-0002G2-U5; Mon, 20 Sep 2021 09:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190494.340313; Mon, 20 Sep 2021 09:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFrZ-0002Dq-QK; Mon, 20 Sep 2021 09:45:25 +0000
Received: by outflank-mailman (input) for mailman id 190494;
 Mon, 20 Sep 2021 09:45:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSFrY-0002Dk-Cu
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 09:45:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfb67704-a133-457f-9a29-3a3eff9e6deb;
 Mon, 20 Sep 2021 09:45:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-kkjp7ZiANfmSWetVR3QDsQ-1; Mon, 20 Sep 2021 11:45:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 20 Sep
 2021 09:45:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 09:45:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 09:45:19 +0000
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
X-Inumbo-ID: bfb67704-a133-457f-9a29-3a3eff9e6deb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632131122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D6JHYbDQM88nV390LQ//+KbJwGL2McjgWmKGEXAilAA=;
	b=OJNnqb/jSeQtylqS+rVnRZ++ptewQFrRIPWS5TF0CG8iakqKq+DjRTB5w4kZEElJHZyfuY
	L6uwvi/WYqameIa94DSR78C7LZrDEQ3ScPByofn/7WZ7utLkPPuNLIV/0LQ4DrnVB4dHMo
	ix0HFTKV48jh0z6Gb+N3zBqK0G/74Ms=
X-MC-Unique: kkjp7ZiANfmSWetVR3QDsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NA8Z8cSHf1gv189oOMzLSDDBwkW6wygaaVTn25qh0T3Lo3gNiZtR2FI5tQuDjxbBAPcqQ0wcA+wpTZMktME0bq9g3fNVGy/BeET/ixO78z4liCFbZDh3SpZEcq2D+ggtxSXjhJ63mC8a+z6+o+GK0QX4OKxCvyo3KHCV+hQ5JFLDqlv9RFU7Gbrdvv1A/huJaKBZqDkKnXf/c7HtbcOkGtyx2QnU3PvKLyZTuZ/0IB+WnTD0ep8sSetlN77Ka9BrpTwzsfO4/hBJW45Q0JRsFPsSUDpO7VNEAgkawd962tAgxOYUjNNGFydUoUYSRyxZySsUf/fe+9BBlKsmYxVAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=D6JHYbDQM88nV390LQ//+KbJwGL2McjgWmKGEXAilAA=;
 b=YBJPzjdng1S75UsGLiapP0hIaAaPpmOxN/zixxZ9FW6syLNTrGRlIYpWDtlJoVR0pIOAzCWti8+6AT1L5hsFxm8NlzY4Z2j9OzA0RKFZYuiag5YcLNsI7ISrQzFDmTyb628uXS5UT78GSuWSWNp2KyBHO/qYpXc/uN+EU/NdkJUcNAeHJ86xzcyWCsOzePBDhNmLCJMZCd41btnAdPA/PfHjWFo1VoW3G9dVWLZ+9Vnobg4dQiD+lVstD5cy/uPVsAwpZD5Pgycnlre8GnahUBmhzIqGpFzhKDR9E+7z7c/2mTLPlb8vKK8V3jc/P2jz2CN694zJfQRLEXb1BIBIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: xc_dom_alloc_segment() zero-filling its output
Message-ID: <e02357ce-54d7-e7ff-109f-681f46944732@suse.com>
Date: Mon, 20 Sep 2021 11:45:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4704727c-023f-47c4-094c-08d97c1b5c12
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23331BD6F637812A1BDD772BB3A09@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JLXgc02mP9IDSzSns0I7r0LA72FmvT87Q/FgjWps6vmtssmsgR5DLTwXeYZPhMHqL9XdIjClYOfiVlOVCoP2rZfgnY8wvUv8ma6Hgfi+iruvH7ux62rexiWxQ9QjL01G3S59dRlndDKRqFLeng9IqFCBaHDkd5Ug/GqotHODKLYDsJiihgSgn944KCWsgO2QT5lP26o/YqDswcBv2UOk5Pa5/gKZ16MOw3/17AmnQFottdChFUsdJxD43z+l/4PK4+tI6/ugpBBhCbtJU7qPerxSJKuPwNwUkvk1MWdleO+twVu8SOQic1dV/OUxhfASkPnoKKSYsK7y/P2mj9S7dYdna2hOYf3yOSKbHoAw2AgpE6eaqe2K6a5AFsojoBeKoOzNDTYr6vj0lF7uHXvIvwndEdJ7EsTGOz05Jgk90F4GnbYETG/Kh1PeE4BA+gqzZQk+ystjUQMIWA1d5o779dvjxTmbdwi7UIpMPPzaM9nub+TJygSu+lKrO29Smu1X3736WXJ5I3dboZqlT0hKn9uaAYGB07/X1hdOS1NYH6P75cgRBD4vHH3Adh9ccPG8YiTqLN/VnbYZTInr4kNxqZbYbcX7+TG5kt3ZXcDab4mh70avT8VP3WC0oR+KxHEe/TU5WOxchOtP4OT1MEPyIIoCBcZBcVdHRAe8xCLv56JSjKSv1n7WsMRWm/yGruqgM/eMCYORY3mNSVMEszoeysCabZGcLbRWfUSeUoJvwzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(136003)(396003)(366004)(31696002)(26005)(4326008)(316002)(4744005)(956004)(2616005)(66946007)(66476007)(16576012)(38100700002)(8936002)(6486002)(31686004)(478600001)(5660300002)(2906002)(86362001)(8676002)(36756003)(66556008)(6916009)(54906003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjZ0SHV4eFFUVXhrc0ErUXh2VnpSdVEySUVHcVQ4S0ZQTzVJSzBMV1ZOMnJE?=
 =?utf-8?B?OVFaNkJHZm00ZS9objZlQTRtWEtSU3VCKzg5Y1pLZkZzVmM3ZVFNWXRJRUsw?=
 =?utf-8?B?c3YzUm4zZUk5YUErdkNST014dXpTbytISmY1eFBBWWtQVnYzczJPdEM5TjdF?=
 =?utf-8?B?eGVKWFFoODRPSFNrKzBLZVBWNnlMZGFSUXRWUWcxY1J2YnBRWFlML1NCblp3?=
 =?utf-8?B?SVFjV1kzN0tOR0o1MmI2aGFzUFBJSjJQU0pTVFZDZFowRCtvbTlKc3ltMjNl?=
 =?utf-8?B?WjhienUrMU1yN1grS2VJUVlnbndWVC9oL3dDcWdnSlAzNnJUUGtjek9ybkQ2?=
 =?utf-8?B?dzFIT1F2NHR4aTZMZFZrRXQ3UE02TlNCMUVEVDgxaC9ldzM2VnY0cTd5VHIx?=
 =?utf-8?B?bVA0c2J0Ukc1bmg5ZjJIdjE0SjhLMXBhbUNVWFRjbW9Bb3VFWDBDdnlRUGtE?=
 =?utf-8?B?eDJJdUlPOE5jQkFPQytFeUNvRXBqditsUjErZ0g5WkFOU2VXcmQ2eHJtb3No?=
 =?utf-8?B?VEJxcmlTVzM5bHdjVTMxRDF2SXphVTQxNWN5YmdSZHE0N0ozaXkxRTZObGpz?=
 =?utf-8?B?SzMxT2dCcWtSUVJtRUh1TGlJQ2F6Rmd5cmdUaWRTZUMwVERUWjQvMUlZUHBV?=
 =?utf-8?B?ajJTRk5tNkhPWHZvTWdQWHErTXBVR2hxVTNiWFZhU2xUZnJoUmk2YnlwKzdo?=
 =?utf-8?B?eTJBQXhQZmhTUjRxbTZwOHU2UXhoMi9idkhzRUZJTC8vaHJ1cW1tNkRVQ0pn?=
 =?utf-8?B?bElGUnJOUFRTTmMrU3VNbXdCcm9DN2l2S0tPZzA2RkZ6eUhmZlM1Q1M1aHVx?=
 =?utf-8?B?dTlWakxPeXA1L2dPL1VGSHllRFRsZ0taYW5CdGFsZ2tjT1oxMENkcUY1Vjcy?=
 =?utf-8?B?STN1NE9aL1hVSytzU2g3eW1SQkFpaDFqbzV2bzFkeGJucElsZVJibStFV1BD?=
 =?utf-8?B?V1FBVmFYUVJCWDZoby8xYkxpR3UzS09WWGZ4bGx1K2NQK01YNkpqSEZGUkZC?=
 =?utf-8?B?bzR4YlRySVhoa1hNVWxGRFc3ZDI3Q2pBY2tCRVBkMW5PdElYSnNNV1RFbkxm?=
 =?utf-8?B?dlFOM1N1TzE5emlHaFVORjh4VklvSHBCd0tQWEFtdkgyd1ZrN09TOFBGdXBa?=
 =?utf-8?B?cy8vVUFVNGJvMkhpTlVtK2ZWQUxTZ3A0NEdvLzlSL0YzZ25hQ0pVa2g2VERR?=
 =?utf-8?B?VHdCYjJISnJueC80VnJoLzA3Yk1jZXdPNzJ3Y1RwMXhXNisxbDVCVjhENnJt?=
 =?utf-8?B?MHREVW8zMzIrK2lyT2NFM1lKOUFPVDhoMko5RkMvZDd1NTk2WWxLcWNuNmp5?=
 =?utf-8?B?WGN5RnlMeVB3Z1l4T1lXYkQrcUVpNWVMWjN6YlhIU3ZYSloxNW4ydXBtRFZ2?=
 =?utf-8?B?WFV2NTgxa2R0NVpXQytTenJsa0JJcDBMMUdzay9XVks4YWVCK081S3pzbXRq?=
 =?utf-8?B?dFBWWDZSdGRMY2tOQ2FiNi9TNzBnZU9USG9mK2RNb20ySm5JYlZDbFgvVnVI?=
 =?utf-8?B?bWhMMk1sZjhIMDRXTFVKbWZxZ2prcXFDa2ZXNkwwcGw2RTF0WDNxaTZUMWJz?=
 =?utf-8?B?d1J3b3ppbnhVeUNTLzB6bE1XZWFpcHR0UytiVHhNUkRXRGJUT00wL2FQaVpp?=
 =?utf-8?B?Kzc1QnI3QjNxVEFBWkZLZDRURmt1Y3YxTVBneFRyTFd0VVExeEY4K1lmTjR2?=
 =?utf-8?B?cHEvZElGZ2VMayt1N3lXaUI1WGVwcUo0d3R1all6YkNrVE15ZUhjU0h2Z1dZ?=
 =?utf-8?Q?Y9H1fQuYtME6hP8nMZN7prs1bV3Yiz3/VDOgYae?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4704727c-023f-47c4-094c-08d97c1b5c12
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 09:45:20.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSn+9FumHWYYoR2Y59mILeg864EJOyRkoctmCL+YfY6OwU3ib8EnwaD5pTGrtkEQ9WHGTgA4lTIbxHD8AvaR9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

Hello,

originally I was puzzled to find that libxenguest's setting up of
struct hvm_start_info didn't have any explicit clearing of reserved
fields. Turns out the memory gets zeroed right after allocation.
Isn't this a waste of bandwidth particularly when considering the
kernel, initrd, or P2M segments, which may be large and which are
going to get filled with actual (non-zero) data anyway?

Thanks, Jan


