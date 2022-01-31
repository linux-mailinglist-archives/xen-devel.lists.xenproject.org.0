Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960D4A3EE0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 09:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262797.455167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESR0-0003QQ-BW; Mon, 31 Jan 2022 08:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262797.455167; Mon, 31 Jan 2022 08:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESR0-0003NK-7H; Mon, 31 Jan 2022 08:53:14 +0000
Received: by outflank-mailman (input) for mailman id 262797;
 Mon, 31 Jan 2022 08:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nESQz-0003NE-7m
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 08:53:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3803d823-8273-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 09:53:11 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-qr0idivbMryOWbhJz8Kpcg-1; Mon, 31 Jan 2022 09:53:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4730.eurprd04.prod.outlook.com (2603:10a6:10:1c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 08:53:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 08:53:08 +0000
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
X-Inumbo-ID: 3803d823-8273-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643619191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uUzAP9JVzF5H5p9YakG9eno+1QeuPEvTuoxESP2eKw8=;
	b=HzfRoI/eYxRB03vYkOoQRcS5/IEONV6oJDOhCRA/MGwlVSuTQX/MIJufzKr2XstMaF8MvB
	7pXzDJ6FV5K1vTHALPwJvmdtgEyw53mtaFunPctFg+rC4N3lzAa00vVyHz5qiKZhpBZgCO
	m+LJo/XbZQTVqKuywOoDIW5XZa2mzHc=
X-MC-Unique: qr0idivbMryOWbhJz8Kpcg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVRqEtdq/xnxWvOOPWeiv5PXPqUvqiGQPhAyxgcwDlEYT6yTDW2kfzIrkI/PyL3ByJOHe/al2q41EwM0pmFv6/Od1vQAM6ePQgyXVlq7Gu1l2WG3LfJPWJz/1BUjzN/EuxjImNc+tvkqKkdkYBdUDiTr9G0KuB+ve7Him1W6mr49RBHjKEEHJxPo6SEp8JJlZopUXi5fjf+hMSjoUob1sKG1f39iBjPO9x6nXJ7cgW3ZqC3HWzGmQ/8epxhp0lgpxkvWF68jwNtQp0toO45C69xe5PJZB4pWHCNifdmn3NYMUtupl7k4p9Bwix67f2OJatVJTiiLN8K1FdOdfpdfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUzAP9JVzF5H5p9YakG9eno+1QeuPEvTuoxESP2eKw8=;
 b=hlp7/3P7PU3Q6GqZzzVd48GE0R24WA05e2fvDLYmY6SB1aLQhtiY7s3zDAKgftjLOslw5kdrZ0i0PsTZbyIgyV8wrR+TKu0BtKHE3zEPimaPVBSOip7mHwSQ+Np1kHps0sL2wQhfK1d4M6Qc5hSpCUy/YYNk4UGgYI+zv3r/pjVje7Nil+upykrvgR2UuWib+QmiobEnPLxsr2HbeDB5omHzUW2pBhDAi8ODYnhm0ijquW9+YD6P7T+uk3hmm2AiaLTkQgH7gO4hA2R2uwhRdngNoFbYPJW8rBMWpFwei+QFARuEbw3sQjYkZukPaapEDdvDQ2bkBkSAe00xaFARoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93ecc4cb-f868-2c87-ef79-c1e6a03a891a@suse.com>
Date: Mon, 31 Jan 2022 09:53:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] x86/altp2m: p2m_altp2m_propagate_change() should honor
 present page order
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <2c421077-81c2-a45e-f7c3-9827d3cb1abf@suse.com>
 <CABfawhk0qDnOdO9DOKLPPNW=FtpGSJvJQAzmKRxxdkwjfeGSYA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhk0qDnOdO9DOKLPPNW=FtpGSJvJQAzmKRxxdkwjfeGSYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b05e660-b3e2-4cc5-57b5-08d9e4971a4b
X-MS-TrafficTypeDiagnostic: DB7PR04MB4730:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4730EAC89AF1F1E8904C9E29B3259@DB7PR04MB4730.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fWl8CWPz262LIaplRB5Rg+ZCuILzFqzVdhj7TWeEKCKPdQT8e4Nwz4kbRTW94Odo2CowoxcwN8p33jNGVjip/ftXWHtEcCXjMw4XdAJzkJ+k7n9AVG+hALssqX2NUX4uQXaVxRt8twwjv+CbOGYEai4BVFUeKfTmnuFN4cDABr8plRzC+9oUGZqYxAhIXVrD2sXJSzq723eTR0FB71ACaI0DE4GKfgxywCfW/UZkffdRe/oMtncLi2VimGVu5reU16HZc12sxdCHfPhnnps819Y0lw1P8mEndik1oLFZnrAbCWeJTvrrdPcKCUZVm91GZSlWmKFEV2jnQogQ+pWQwrDBXzTzYjpHB+KvsrG1j+kU+zJO/Xj7DrmUEtRUiQhjQqPBdIo1PVWi1wDYvlH9gQ1w6QLHaqW/9pbn+xRXb6kjQe6HI193O21YOjtD8vbbeajA2mjkSzO1QxkJHx8CGg4QgAZkexHnKiRunD0eg42GYQdpLLQQhtVMupztCJUrnRm7GgpnqSpvqvKB6nmlh9yLZj3/WjqwrrE+I3fKiuyR9or5EafbcBl80qdr1O/Nl4/wnnWhaYLCndn5Hqpq1/ydFb+/ZVkVEymnxbXpKflsWik5+E6b6fvWulQizd2z+riFbPMPbs72LSzfRqZU+rAVijVUta28hYEmLSVqK4aMORLW5O0Fdd6y41meNWn6nmbqwmAKi3E+iSeP9GHy+mdRU4Vxbrt1tWPwHD2v6E4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(83380400001)(66946007)(66556008)(66476007)(53546011)(2906002)(5660300002)(4744005)(31686004)(4326008)(8936002)(8676002)(6506007)(6486002)(54906003)(6916009)(31696002)(36756003)(6512007)(38100700002)(508600001)(26005)(186003)(2616005)(316002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTUwUVJuaGtYcFBMSXhPdTJiQUlmdEJoK1JYMFJzQlFNQVliMERTQUYzc25h?=
 =?utf-8?B?UXBZbGtkNlY5TVBRY3dodHlsRlJiVDM5OUZtVVB4ZmE0UkNadWVwRTVXRlNB?=
 =?utf-8?B?VU5GODlTeHhZUGRUQ0RYbzVpRnVDVzY1b0pVR3ZCV3VzUDUrNWVFdXQyZjgv?=
 =?utf-8?B?b2JFRCtVdmxSSURIM2IzWFoxbVkzbWpWRjdVWGc3ZGhuNEdQenc4Vi9QSkk2?=
 =?utf-8?B?N2NZSnk2Mk9UN09DczZqS0hzVkVFOTZmUmoxK1V4bkUwUDVJQVpVVUdobEFX?=
 =?utf-8?B?YWFxS3crbWhPR1lyWjNBcTRPM0NuSVo1UjcrMVhHN1g5eUtnd09XQlBnOUt4?=
 =?utf-8?B?Y3JRYk5ZcW5iVyt5VmNndjQrdVVhRXR1dFBPekFlaUpEU1pzYzF6bzZycGkx?=
 =?utf-8?B?U1BlNS85cU5WSlpGSTc2cGFkWDJBUEh3Nmwybi9GWHNrTy9IVUwwK3NKcDVz?=
 =?utf-8?B?VGxGSGJSMndqUGY2TXlWM2kwQ0pOZlVVeWJveXp4aTJKU1JoN3Y3cnAxeCt0?=
 =?utf-8?B?VUxwQWsrbGh0NnJJWE1xaWh1R2ViWHdBdzBqME0wSE9TTmVoazdnMEp0YnZJ?=
 =?utf-8?B?V1JMZ2ZnM1hLellFdUFzMXpmRW56cHE5cy9kak1IZVFTSG02R01QRDduUHdr?=
 =?utf-8?B?UjcrTnkvR3hwSm45SG9oZG9vNWZXczdOM3h5Q2ErdTk0cFpOTGo2NGk2Zzg5?=
 =?utf-8?B?RnM0TTlUcEYvNUU0YnZNZkJkcDl2SXRwNlRDaXM5MkJMZ0kxcnFlK0dGU2dJ?=
 =?utf-8?B?M1c5WFd0d0Vwd1BEd2VMMERwblh1M1B4cjFZWGpxeGo5eUxoanhFRlNyOUdN?=
 =?utf-8?B?dFEzdXlZNzRNQ25QajlqSlRyZWdsYUU4UFU5TWgzVnNqYnExVXJac1haT1Rv?=
 =?utf-8?B?Ri9Ea2c5T244NlI4amtBWHZCZ2M1WnA4ZEpneU95VjZvMGVPeEdZRS95UEdH?=
 =?utf-8?B?aUVPbm43V1I5UTNFTGxCNmwrVlh3THZTSHJFM2dXUDBXVVQrT0RZOGUyQzRl?=
 =?utf-8?B?YlpjZDRzb1dIWWF2NnQ2VUFSbUJrbFlveDJrVjgzUGI5QkliRkltb0l1SXBP?=
 =?utf-8?B?SC9QYWFxcHFUazJSZm05cmF1N1VGN2oxSTlaTHV0RjZzWE5uSTRONVliU2RQ?=
 =?utf-8?B?V0lGam11SkJYRnJ3UkYybkYvR3prUjVIWTZjRkh3TVIyalR0M21IUGx2WEps?=
 =?utf-8?B?dDRLYVgzQmJGcUJoNWJKYnJqME5ySW03V0FJT3hJN1hRTTM0eGwxYjRiR3VG?=
 =?utf-8?B?RVlQR0FpZTI5R2VRanRNSTVidk5wNnhtSncyL0VVNmMvdjc1ampSdE85YVlQ?=
 =?utf-8?B?dVlSSFAzWW9pVUo4ZFdKTjkxalNUK29EQzAyZFJrb3VXYjJhSzZXakRsQlBO?=
 =?utf-8?B?a3RML1BPdXJudjdqTldmUldtWHpQR1g4M21YenVnZGRjNlMvbXN3R2hXTnZX?=
 =?utf-8?B?aC9ibk1pbnpocXQ5eGhKamN3OUU2VW43eGNqMm82S05aVzNFaTkzU25ub0JT?=
 =?utf-8?B?Yng1aklPdUJTM0hwcFhFQ2JxTnJjUHZyV01RMUplNUZOMUtLdjFpT0dJbHM0?=
 =?utf-8?B?MlVaQUlNSEhFd0lJakNMMFNaR1J4MzZabW50NG1HZkc4SWx3OWdiRnpBS2Yy?=
 =?utf-8?B?Z1U0K1kwSlFPaURaanBoZmtlcGUyZ3M0UnRRYnFwdE9ncGE1UEF2dDVXVlZL?=
 =?utf-8?B?S2FNblBNdnZQTVFBc3Fmck4rdys0d2lSd0w1MFFDUXEwZk9OSURqdm4wbUhR?=
 =?utf-8?B?U04yalJzSUhxZlg2TUdwdDE5SnM0d3JSanhvdFJEWktJVFZPQStEVWVaSHBx?=
 =?utf-8?B?MUpJa0RXZE9QQUF4dk82MTlwTmR6Si9YRm1OMmtaVHpFbEJ2MEtuT3NYV3Zv?=
 =?utf-8?B?QXF0OGcvVVJhY2VpbCswWEdmZS90ZDM4VUZoc3U0ZExOQkx6YnhRVS9SZkla?=
 =?utf-8?B?TGJ5Zk11SkdEMDM4SHNJSytlcnJTRkVLbXhZUVUvTXEySVZOeC9YODFYdU4y?=
 =?utf-8?B?MCtBbVl3YjVGakNsM2ZYTTFKa3lTWmtQMHIyTm1sV3NrV3kwV0c3bXI4WXFp?=
 =?utf-8?B?YXBHTFRlS2ROUWo5cjVvb285RlBJSU5IYnNkZ1crcjRYOGNncGpPYjM2UjF5?=
 =?utf-8?B?UWxDeWJuajN5TE5vVmJiUmVwNVFPK2MvUXpIN25GODdTbXBEalc2alAyNWdK?=
 =?utf-8?Q?3FvAg/WotvqTSBAXI12Y3aw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b05e660-b3e2-4cc5-57b5-08d9e4971a4b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 08:53:08.4163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prCjKch3usCe8tYIm0dPiJwPzdXDuLDsj8UgXJk8ZoL1RnaIa8LaLiHni8WpoNC9G5KoHTPiSBWuV897p5JwHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4730

On 28.01.2022 17:49, Tamas K Lengyel wrote:
> On Thu, Jan 27, 2022 at 10:07 AM Jan Beulich <jbeulich@suse.com> wrote:
>> @@ -2549,15 +2546,16 @@ int p2m_altp2m_propagate_change(struct d
>>
>>      for ( i = 0; i < MAX_ALTP2M; i++ )
>>      {
>> +        p2m_type_t t;
>> +        p2m_access_t a;
>> +
>>          if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
>>              continue;
>>
>>          p2m = d->arch.altp2m_p2m[i];
>> -        m = get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0, NULL);
>>
>>          /* Check for a dropped page that may impact this altp2m */
>> -        if ( mfn_eq(mfn, INVALID_MFN) &&
>> -             gfn_x(gfn) >= p2m->min_remapped_gfn &&
>> +        if ( gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
>>               gfn_x(gfn) <= p2m->max_remapped_gfn )
> 
> Why are you dropping the mfn_eq(mfn, INVALID_MFN) check here?

Thanks for spotting - this is a mistake in the v3 rework.

Jan


