Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF23492959
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 16:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258596.445533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9q1l-0005Io-7P; Tue, 18 Jan 2022 15:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258596.445533; Tue, 18 Jan 2022 15:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9q1l-0005GE-3h; Tue, 18 Jan 2022 15:04:05 +0000
Received: by outflank-mailman (input) for mailman id 258596;
 Tue, 18 Jan 2022 15:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9q1i-0005G8-Uj
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 15:04:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dea47917-786f-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 16:04:01 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-qEF06yAePLGGLuEYbn7cbQ-2; Tue, 18 Jan 2022 16:04:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7932.eurprd04.prod.outlook.com (2603:10a6:10:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 15:03:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 15:03:58 +0000
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
X-Inumbo-ID: dea47917-786f-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642518241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v71U7bKeX34bVzkLSSSx/pXCeCSUsgtz4pi0lrhww9U=;
	b=Pk7aJmivoSXOSecGGpMYisNVbA1RbTcJef5LU6H/aHXji7VPcVZK+o1txiuy7V+1qZ+cE5
	yDsMpOQFuMVkfCNXHOrGu0ZgHl2p1MMlwWpHfwHQEOY7ewiz1TatQszLC9zwn0TiMHcxfh
	3BhUyrVCPN4e/tLj+HP6Cid8B8TVdTQ=
X-MC-Unique: qEF06yAePLGGLuEYbn7cbQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVgyraamcb/eoMvaGOVA41A+FuW0ETxmcp2l9tNs295SZI721ZHS0541xbQjzf8ECOWJNSlVgwl/2ijf5ItvcNQS9vILBVuvJcESUTWnJqYxVamhfdfRy0XBIU4Fx40Zt3gUSC8H09QADL9msZld0e6Rxoxx4UPa6Z35ongGyQOuPow3cXSz80DLOclrn0kxJwZ4Lc2WrKzCuKE5f0N+KUCyU0jzfVkW8+QsuYReqM/sygVhaWKU3EYzx78k2tGpu82XJqtLi4amr1iwhnv2Vx8Kv/RV13KvWMbSxY5jh+9XQ12OjxKtULst0RhNlNj9BPec26oWtvC7b/SsWzewIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v71U7bKeX34bVzkLSSSx/pXCeCSUsgtz4pi0lrhww9U=;
 b=GwBXh+Vp5aZftHUPWBDH+SnTvPfEVlqePpd/yStlIm7ntg5SHTdDkiezNRnAuxRCiQjOjSPWpYWzSIuSFA44x2cwAJSXMq5dll0LpMoD8I66PCdmGjgaYDChFs0e7Fr8O09Dl/NvtbvvRlfTgblV5gzs4FZksLnBl0VasYvhr8eWwRXrsci8psQ66nWAH0WxFjZiRecFHorxSjMnIqWkX4PEJydibC46AA6KBVLmNnX5hpQGg+QWOHHJSXdD0maoIz/cRNaGIB3c2FjhrpKCjxFcGRbksl8Ehj/cZE0IHsTwuOAJCb0HbHATwKYJdQxvvMgP2LCurxOEQP5PqIi+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ea5815b-df22-7884-d28b-bdcc1741e349@suse.com>
Date: Tue, 18 Jan 2022 16:03:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: statistical time calibration
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28860d53-c8bf-4ca5-2b12-08d9da93c0d6
X-MS-TrafficTypeDiagnostic: DBBPR04MB7932:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB79321B12A7F77779EEDE2D7EB3589@DBBPR04MB7932.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zUshmnI6BoZ+X3MCzdiMaA0L7oWx9Mxti811qaP7gYIH0+PIKvWYDtLD3Hag8yu9dxUg/5cyTGwGKOl0tl1SQG48VNjTh6Ce5Zi/pzNYH80He9RPwTRyKyV20M9QjC/Z4S6swMZU+Ikx4f24XrVJ6GTKEfLP2slucWMxVCLGBf74ZNrReT9dj2TPANbcMcsVKxE52GBe5KZKSjDDrgBmEonA1XJkdHYbCrL9N98nLea0XCuj3ufw9McCTExSTNm6gbVMcT9ONare1q42jXdxdXYzxE3d2wEO4vNxYGPVbV/fLsglOOs7dJxZPNQ3c8uiY6hGPysdTpQFsDGwYsmDLxtCuSz2Z8QF7Fdf50onTE8F9IU07Fbwwybr7bAEJj+mjwFVk9BNWSge5TU5L59VfFEfOGuUfmWUVjR/dubbcSzAT2C485RyxtKKxOHXXtVhPlt3TipBLMS7qrcmVCiulJP30QdGf7ONQ2QU9HqUOztMVzwavmoqkfqNdglFqpS6RIdn7HbzwgxL0U8HG4W8s6dRgBazDAy2vgl54LtcMItdl3C8E0RbPk6uVY9mZ9/Fjdb4uFI0SQHxv5wtgppxdfWakuAUXIOf8rrsUv8BjmulWNtvQLEZ1yxIzLjZZyDJmc9eKiujShkkwzEys1UeO95m8dG25gLGDYDhtx9bMDrKpFhA6cXLiVFcA8gdiejZlkQbBdPZdOeNg1Ic3KWNq6uAXYzCNwQKWidYL1XQAKoTD4oztObcP1krv5BJ/mu+ud2oFebs5nxi1WuQIu2sC7VLyCshGf70NVAsCm/IPbkmFzTcuy2MUmQq7JBcBFYcSZ9seoNne03sMQ7+wkJn+HTKAfAFGVMTXiIvLKoji/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(6506007)(38100700002)(66946007)(6916009)(26005)(2616005)(86362001)(8936002)(66476007)(6512007)(66556008)(54906003)(8676002)(31696002)(6486002)(966005)(83380400001)(508600001)(7116003)(2906002)(4326008)(31686004)(186003)(36756003)(316002)(3480700007)(133083001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTV4dU9Ud05FWTAvTEM2VGo2S3dlcEh2amZOS0owTlduOHB4L3YwYXE1M1Nz?=
 =?utf-8?B?Um5vcmRXcFEzUjlYZ3FzcEtjRG1lUWJGUzdObDFpdTUybFhUd0M1c1J6UDRo?=
 =?utf-8?B?RzZvU2xUZmFjMGY4emlNYXM0OGI2VDU1K0lQRnNYaG1BR0NvZHQrV0lLNnZC?=
 =?utf-8?B?UUg4dWt3TG9GR3ZlWWRFYzZhNnVLejVTUFRBRlZ4OXBXY3puUWtiNkxzb0xi?=
 =?utf-8?B?SUVTWVh0OXc0Z0MraW1yRkVoNUlOQVVELzhKcXlsRHVheURhTGdveGJUTTRz?=
 =?utf-8?B?K05SVkllMHhZeVJ0TmNDOXJkOFBHYm11MFgyaGF6RndvVFo3c0tDakRBeGpt?=
 =?utf-8?B?UndXZmFNK09HeVJZcmFBODRSVERTVTc4RVNxUTRHLzlPZ3ZsenJOb2RpYjRq?=
 =?utf-8?B?Ny9FaEJnazVUWlR5Si8yK1k1WUV2alRTM2gvSzBObDZXRUl3WmFiNzVTUmdQ?=
 =?utf-8?B?cXNXTWNrY09IQ3Z4Z1NhVXpGVlpvNHRMRlcxNnMyOWFNT2N1TkF1SEpoYmZl?=
 =?utf-8?B?R2JxQUVnQzd1cnJuKzV4VnR4dWlPZFVEVzUvYlpUT2Rva2pYUWVlZkZQMFg1?=
 =?utf-8?B?UDdMM3FJWDRJbFA0ZXF6OWZTUVJKM3JRbE04VSswVEZ4amlvQmZlb05rN3h3?=
 =?utf-8?B?YjFza2VHcU5pN1h2dExKaXBwN0lVc09HVTM1Q3hwU1ZoZlcxclc5RWtOTUZR?=
 =?utf-8?B?VVFDVHhldEs4dWRiVUZPRktuaGFDVFlVRHlBZ0hrdUpnUklTWkFtRklxcnds?=
 =?utf-8?B?U1BrNkdkM2lsMWhuYjFRMjgwZFBYTEhYV2N0eGJvanozWkJsUHg5V0poZVVh?=
 =?utf-8?B?Ym5zcWhQbW1wb2tleEhERmIxVkViWFBqdFgvRHFIcjFQTkd4WkFIUFZmNEx1?=
 =?utf-8?B?VWRhVjJUbjFvWVRKNTBweGlWS1RQb3NWV2hXTmlxTExneCs1MmJQOWpuS0dj?=
 =?utf-8?B?dTg3cmdPMHBaQ2ZvOWFQVGlMOXA3aVVrcVNCNmVERkQ5RElreFRPR0JZM3E1?=
 =?utf-8?B?SHQzazVjakJkV1cva0x5My85SDRyZHE4VjFod2JKUVlXRXlaSjRBaTRlSnRt?=
 =?utf-8?B?SVhMTVB0SE9LcW1uWitEWkUwQUVpaUhUK0U5L0d2a3hBc0pIU1EwUkhEQnhp?=
 =?utf-8?B?NFllY1NuWUx5d0ZDOVR6bitmK2FXMiszOVlKdWkrUzJlUklxSmNYQ01EalBK?=
 =?utf-8?B?b0FDODNTQ2ovWmRaTm94L3FqWjhGUXZ6TkhhUHlkeTF6amgxVERDbDhmY3Er?=
 =?utf-8?B?S29pZm1aUllDTDhPR1gwZVNYdUNOa3ZVeVVNZHI0eCtXU0J6YkhvS2pFQlVG?=
 =?utf-8?B?NnZWS1o3R0RhTW92SHR4OUVCR2c2Q3BOZkw2dWo5enVKYmhaMXM3VG9TNzdj?=
 =?utf-8?B?QXhBSStQQ3o0RmVabVlRdXZYaklBb200b3VwTlEwZzY1U3J4eTU5VFJDOGtE?=
 =?utf-8?B?UnV6WmoyWlpzdGxRT3ovam9hMzZpTS8yY044b3g0QWRIZ2MvY2c0TkJadXZC?=
 =?utf-8?B?aE9PaEtMSkZnSGpiWEZZVDExSGRWRUZMOHdjL2JWeVlmMGdNbTBQOWFrcmlU?=
 =?utf-8?B?YTlRU0hXTmN1VStuVVNFaytzLy94N29wSTJuaHRpVjZOSGhjei84Y0kzTWp0?=
 =?utf-8?B?QWdFSzl5ajVtelJySG43TVhkUUxoU2xEVUZZdzFmd0lCc3ptd3BROEM0bmhW?=
 =?utf-8?B?bE9YMGtZelZhR0R1TzBjREFqQlRTbzdML2RqM2N6Wmg0akN3aDdEY28vN0hO?=
 =?utf-8?B?TlZIYWhYcU94SnU1cmYwSElRcHI4R3hLTDJOYzdqTXFoK2N0c1U1alY4d3Fv?=
 =?utf-8?B?OGRveURFaTVuSTRlblBNQnQxbjZtSHdZUWw3RFV1MVpkdldBbGxXc1Z6UFh0?=
 =?utf-8?B?UkhjZXpWOHRiSDc1Qk1wRWIzaDE1c053djh3Y0lYeFAvWXJET3BJcFdZaVJn?=
 =?utf-8?B?TUt2WExvb1Q1SDNDSzZnVDV3UnpJaGlLWkRqTHp6WXFaSFFQbnloSFpGaG5S?=
 =?utf-8?B?aFUyNEE2ZUlUdjhmcXNSVHM1OU1LcnllWmVveDhOZ2gwNFJuM05oM2FnT1Nx?=
 =?utf-8?B?TmdULzFTVGg1UGtjd2I1UUR5Q3MvUHJJWDhYemdKUmprUmcrRGpxc2VzWTJo?=
 =?utf-8?B?UEtzUFVXcUEzdXBia29PQ01hZFQrQkZtS1ZiL3VvMDdWVDMxazJlL2N3dDhs?=
 =?utf-8?Q?greafWQygtI0t4dYHOG2OrY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28860d53-c8bf-4ca5-2b12-08d9da93c0d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 15:03:58.2203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD3CGIHgdLu7DIaPdx0J7wTWSgfoP+KCo055J8iGLZnD7VVWeBFPxFzx7nNxTcdF6SVhMl9flkE9LPR6AU1+FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7932

Hello,

Roger pointer me to a FreeBSD commit [1] introducing such there. While
we don't start at 2000ms (but rather at 50), this still looked interesting
enough to take a closer look. I think I've mostly understood the idea and
implementation now, with the exception of three things:

1) When deciding whether to increment "passes", both variance values have
an arbitrary value of 4 added to them. There's a sentence about this in
the earlier (big) comment, but it lacks any justification as to the chosen
value. What's worse, variance is not a plain number, but a quantity in the
same units as the base values. Since typically both clocks will run at
very difference frequencies, using the same (constant) value here has much
more of an effect on the lower frequency clock's value than on the higher
frequency one's.

2) The second of the "important formulas" is nothing I could recall or was
able to look up. All I could find are somewhat similar, but still
sufficiently different ones. Perhaps my "introductory statistics" have
meanwhile been too long ago ... (In this context I'd like to also mention
that it took me quite a while to prove to myself that the degenerate case
of, in particular, the first iteration wouldn't lead to an early exit
from the function.)

3) At the bottom of the loop there is some delaying logic, leading to
later data points coming in closer succession than earlier ones. I'm
afraid I don't understand the "theoretical risk of aliasing", and hence
I'm seeing more risks than benefits from this construct.

Beyond that there are implementation aspects that I'm not happy with,
like aforementioned delay loop not dealing with a TSC which did start
from a large "negative" value, and which hence would eventually wrap. Nor
is the SMI (or other long latency events) aspect being taken care of. But
any such concern could of course be dealt with as we port over this
logic, if we decided we want to go that route.

My main concern is with the goal of reaching accuracy of 1PPM, and the
loop ending only after a full second (if I got that right) if that
accuracy cannot be reached. Afaict there's no guarantee that 1PPM is
reachable. My recent observations suggest that with HPET that's
feasible (but only barely), but with PMTMR it might be more like 3 or
more.

The other slight concern I have, as previously voiced on IRC, is the use
of floating point here.

Jan

[1] https://cgit.freebsd.org/src/commit/?id=c2705ceaeb09d8579661097fd358ffb5defb5624


