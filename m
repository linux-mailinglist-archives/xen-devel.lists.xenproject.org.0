Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530484CBDE5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 13:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283332.482301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkhQ-0004Lt-4M; Thu, 03 Mar 2022 12:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283332.482301; Thu, 03 Mar 2022 12:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkhQ-0004J9-11; Thu, 03 Mar 2022 12:36:52 +0000
Received: by outflank-mailman (input) for mailman id 283332;
 Thu, 03 Mar 2022 12:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPkhP-0004Iz-2e
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 12:36:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98c5c05f-9aee-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 13:36:50 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-G8UCLFkdPl-LajVMbSjxGQ-1; Thu, 03 Mar 2022 13:36:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 12:36:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 12:36:47 +0000
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
X-Inumbo-ID: 98c5c05f-9aee-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646311009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T6cJPg584moZKtnWb8FtLePXUIaYX3/05kQWdyidkqs=;
	b=hlkftmFI8ATsS/eujKU7m1OjgXSr5rJ70ZHMJLsSXpqxV+9Z6rHuIxB9Iqqq4vGs7DmSne
	8wrsdIndVB32qkcxLkNNJit6XNh737NvXdwmyZ02ab81x8mTLqMvz7ojRirHGfSxNfiVoz
	vYKflOV5IH9V5ceOIH+KWOy/E8DdiP0=
X-MC-Unique: G8UCLFkdPl-LajVMbSjxGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klr5uTpWrCgnWXN7XYxXQzcMCb7s8du0G+JAUpn33UwqtzS7nh5qML/YG9a83tduPeRF/u+m7iVb3ee9quMtcwH22Y8MVaLCRtUqQAXIvY4YkXfgzMrtIq0vnHtuD0SEHWESvKa4PlwTfOlNaU/bn7mo1LEcxYCigF9RUQkobptgOIBRSxXXrEBp//ZGMqIqResnmGivd+slIyzIIrbGKakPCBoAG40mV2wUlfbOKYXS4CsHHGmsToIdmAVVC4GCGkNlshD1y7DHOopvIuoyKH1MCMAjF0ZK70uIKDw9V9tZ34uj15/8trEO0v6mtVJ1UqZB8YcwKA8jixD5qobjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6cJPg584moZKtnWb8FtLePXUIaYX3/05kQWdyidkqs=;
 b=WCBzQf1OheN6B2v1htVJOvH81wXkx0iGQ+956HykfyTiVRToBsOIGZF2dH1kpxZVvskA7iriPDjJtDJuUP7mePVl+ZXKJmYxBqdO7klr5Bge/+Kqew72wky8wQfQmuRkoBnhwtNAqo3DOWJcQkS5550aLQDHBM2i6PQ3/Cs9QWrTu42z64rOwNkLIaK761iEL6Hot9t7jeR4ETvpFQP0x7UBUJtw8haTY15GpZ6wVrUDJT33Tg80hNQVOWB6Oeb42GEqLMH8bzV25qDMyonv6GcuEsqFvFaTqct5MQOaejNTP4wjPLhvPqfwUW2OGfypSuwjE1KHnQenM//rzP+Vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <236dcb65-2ab6-7d1b-36b3-ed2d45c1398a@suse.com>
Date: Thu, 3 Mar 2022 13:36:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] evtchn/hvm: do not allow binding PIRQs unless
 supported
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220303103057.49181-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edad2be4-aa13-47c1-c4f0-08d9fd127b40
X-MS-TrafficTypeDiagnostic: AM8PR04MB7812:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB78126CB49D50F4290D34F2FDB3049@AM8PR04MB7812.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wtDJpphz9ACBmzYvU1Xv0+rYSYEyihXKRs1byWTOoMHp5vq/r+QWcZJkoj1HzGQ2vGorPPeslYxX2vsbDWXBXY+Kr5eeA75YqUCbdHTpXhGMB+LSTMKSzE3N/j7143HCVfCUd1ifb4dnDHoYYLxojNYJulUJkmZWXjci696MqN/ZmyxoT9lKc7MQoH/rud24iqdw+MY4cqAtohdyiG5eculsNw+CDaoWHNSiN+AFAccNE1yHTFYDSPRXV2o3zPhbsCXofEsYZdaBKavwNork+EwVr4EvIfkt7U7ZXoe2uj34EL8d1BeUrEn59HVKV+Zj4Fi5hkl3NrrpW3RTPSJNVPOELhVcLPyDCN4bkEeLv9QU7q/fB1VCZj3XKA1+axhTAcSyR+VH5xGumx71ShrTw8adv50F9Vp7Fbm709WX6RRQqIn/UOlrWRII7OP7HLeYluReCcfcDvrnVosnGcaR3DfDKOOk7armq532rgFV9+oaLZdKgXRYCUsM1yZgb3VKbNUEI2MA4ySHrclspCW9aMbh6bQXg3XFqydbemjKdi8+YgGVPdoG4Boor7DU/PVfEnvvORhF5OzMriGR+zvW2Odj5rbjC85K9QzREoH+L3KV8h09MYgsN2ZHXyu0Skvw4QLj+WbSWRYu6cUiJavIAePHmDXV5pzbwez0NJ0d1/D2KRw3b5fu1uan+53rqnglpP1fhwnnYYOkH1LRUe77Fxl0VFogUnsAT6EUNduWrBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(31696002)(86362001)(54906003)(6916009)(316002)(6506007)(6486002)(6512007)(2616005)(508600001)(8936002)(4744005)(5660300002)(2906002)(26005)(66946007)(66476007)(66556008)(186003)(38100700002)(31686004)(36756003)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3lBVS9vMFpYZURhZmlqMTdLWXFSenZieGpYdXZKOVF2VkltU25tam1mOHBx?=
 =?utf-8?B?RjdIeU9sVzd0QUZ1UHkxWGdaSTdXMjhsajBpTGhVRmtGdW5DWFNBRFhJU1ZI?=
 =?utf-8?B?RWk2U2xlY2VBR3ZuQWYreDJ3c1dZcDBlVC90aXJTYkdIVEd1V2pGblgvb29a?=
 =?utf-8?B?M092SjRJWjVmdDBZeHkyMjVQdTd6YnZWdGRudmhrblpVTFBHU1ZmUnhLdkVx?=
 =?utf-8?B?M2RNWXpNQWtyallvdHNWWGdwbnZmVHZKUWRjVnYzZEZpa2xyU2dKblIwZytQ?=
 =?utf-8?B?Y0VlcFdGaGpxQmNyV3ZBekQ2NUNvY2RRVW82djVNaC8zZEF2QTZDNGZEdHhH?=
 =?utf-8?B?b0lkcXE4dGczNXBFUTNaYUI2ODkrVFRrUjg1ZU9oVjRQb2RXU0pCczZoWkNw?=
 =?utf-8?B?RWt6M1Zlamo4OWVmWENvYVRobDRhRzF4Y2JYZDlqa1AyN29KcXc5VmZ4VUZh?=
 =?utf-8?B?bjRUT09UZ2xCd0pQSzE2RE01TWxXcFdXQkhaRE5JN3J0c2V5UkNVRFFMcXVQ?=
 =?utf-8?B?T0pmN3pxcFBqdFR2cXlycVp4eUh5TDdKM3V4dkxWRGx1M0xXZ0FPRmI1K212?=
 =?utf-8?B?blY5cHg2VGowbVVvcXJQa1FHMEpOY3J6MDA2R0IvdStUK2hsNDVVZDBRMi9h?=
 =?utf-8?B?K3pjanZ3Q0JrMEVFRHR1QjV0ZDNJYkZNOW1EclpSZ09pR3VEL0dXL2dnNWFp?=
 =?utf-8?B?TjRZZFVtcXpaQ2RSM2luOEt2eHhKTUNLSnFocW1qR2c1OVR3V05pR0RhcEFH?=
 =?utf-8?B?Mm94aG5RVjRodDNQK3dWUTJWaHU2UytlVDFOSVI4UUdRcjNjNGRHUWtJMVo3?=
 =?utf-8?B?Wk93WUdmUXZodEZ3T0FCd00rcDZ3ZDFtZGc3amJuQnJ3MHZQdm03UmFwVWRJ?=
 =?utf-8?B?bytrREppaENwd295SWpWaHp2MUpjU3I0aS90YlFscC9hT3N2bit3YUl2VFpX?=
 =?utf-8?B?RGhYakFDclV6d0NyQ1hoakc2aURQTUllSS84b1hvYVhKdjJMNC9sQ1Rtb3FO?=
 =?utf-8?B?QzBqREZweHJNT2thaTRwMVA3MVBoMlRQMnk4T284TVhwdlNub2RhcUc5MEZ1?=
 =?utf-8?B?R29YUnRXMTZ3Nk93WGtrUWFVTjhubTZzY1FTbG5NSXBlRTVTaEVCNU5NWFp1?=
 =?utf-8?B?UDVIVlJnSmVtaGpXNExWWUVkWFRFWVdsTy80TTJtQk1SMnN6Q1YvVVZYMFJ0?=
 =?utf-8?B?VFB4blVqaWdqUGhNVUtLcnUvZjFRd1dvTTE3eEYwcVR3K3o2ZEZtdkVkMWEz?=
 =?utf-8?B?SWpralBGTnNNeTVLcTJsTnN3dmtCaXFoSW8wbkJpTVdqMEd4Y05QclBXeFZG?=
 =?utf-8?B?VnllNjloNzZhRXRBU0tiUG4vU09icUhYS01DdU5NY2hTR1VSMEY5ZWZqNm94?=
 =?utf-8?B?bHVTWHU5QTFsVzgyRmI1bUtoYzZCQ1pkUmUwakJ6UFQxTXk4aFRZZ3RVa2dW?=
 =?utf-8?B?d1hJMFozQXZGdzlqS0JSTmJpdFVyYVBCY2pzY3dLdlNPaE9OeTJEcFkrTWNS?=
 =?utf-8?B?cUwvZnE3aUVSWXZKZlREVjhrbDNMMm5BSDh3SVlLbTM2TE5DWlV4eVIrQy9Q?=
 =?utf-8?B?S0VIVi8rcDdEN3Z1RzJPdEpkSlVoSmtsMlQrTllFblBoV2NGQlArbjFBWXRF?=
 =?utf-8?B?dGRJQlVSdkZYc3BJUVVJbnZKUUdLV2RjQW85YnQ2TkFuMThyUnk1MWtnN1JL?=
 =?utf-8?B?RzBEWFpNSWUydi9lR2RiSTJ4RVBuQytDTEt0c0xyeFlVaDVrN3UxbzluTzRo?=
 =?utf-8?B?R3BpNW82dDZqR1o5WUliQm42V3cvTVEzZHBIZm5EMTdhNFNEaTVJU2Zwcngr?=
 =?utf-8?B?Wkg5YXA0WVdjNVRWNnhaRU9IbXBMckcreStKaTVFV0JLTm1PcWNnVURvVWdW?=
 =?utf-8?B?bFkvYWxiN1BrNVVuOGtxNjMrRG5IbndWaXNMQmYrY0FOZTlHYUNQR3RFTElt?=
 =?utf-8?B?N0tRdHNWc1hrRFdaUnFWV3htdy92a0FRL2F5Vk14VTdGWnVYWUpXVlpCZloy?=
 =?utf-8?B?NjhYcUNDbnIyUzJCd3BXVnN2dmJWT2c3VHQzbXZmN3p1ZXBsKzlhSUZxVXZT?=
 =?utf-8?B?eUpVU2RqTFVEOHVxYnhWbVhoWGpReVM1SFF6NUpZS0JJbDRqSmlkU0R3WUsv?=
 =?utf-8?B?Ri8xaXYxWHN0Mld1ZFVQVXRuZnIvcGJNSWhRV1lRMjBmMHoyMlN6QVUvQ09W?=
 =?utf-8?Q?WyV6KbWsOj9Kx1Q/N6f+Uiw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edad2be4-aa13-47c1-c4f0-08d9fd127b40
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 12:36:46.9498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99PGVW4a/KnXxw/yDzN9N/56dL/GFo6Ih9DuRXzCBQxsAd76eD9q9bLSN9kDwP+c9qwNEB4H1pQtGnQc41uN2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812

On 03.03.2022 11:30, Roger Pau Monne wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -556,6 +556,9 @@ static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
>      int            port = 0, rc;
>      unsigned int   pirq = bind->pirq;
>  
> +    if ( is_hvm_domain(d) && !has_pirq(d) )

Arm doesn't have has_pirq(), so some further conditional will be needed,
or has_pirq() needs adding there.

Doesn't this want further accompanying with adjustments to the checks in
physdev_{,un}map_pirq()?

> +        return -ENOSYS;

-EOPNOTSUPP please.

Jan


