Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E242772FACC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 12:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548689.856775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Ni2-0005wH-Lz; Wed, 14 Jun 2023 10:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548689.856775; Wed, 14 Jun 2023 10:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Ni2-0005uP-Ij; Wed, 14 Jun 2023 10:26:38 +0000
Received: by outflank-mailman (input) for mailman id 548689;
 Wed, 14 Jun 2023 10:26:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9Ni1-0005uJ-FL
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 10:26:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f06099fa-0a9d-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 12:26:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8620.eurprd04.prod.outlook.com (2603:10a6:20b:43b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 10:26:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 10:26:33 +0000
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
X-Inumbo-ID: f06099fa-0a9d-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFfTvVnJHh6xxX5uzq9RN/yv1/K0UUjgO5J873BqmdTy0JGccxyGMzl8Y0jMeBHC2BEjKXoHhK97Otcf77w4MeghgsLVabzpt5OPHJbHSKzPJjaVuzbV9egaeMaMY/LYd2lHQRcDxE/orhXNCIGVeNMyvx1EYjD2GvpHxU0Ui0jIQ3P2AoApszMblVIVIM74pdPz2KH9ayaOxrr2XcAvTdv+WE79yT2+gDYroy7DEUZmR3wZwS9yGpR2mtm45iCu5dYONbqsfgnMjVLE1N89q23Gtobni8DgeXIdNv4hSJfhEsZm2pvIWjRWkjRDuBMbjTSbYjkwbGyvehTSVAxlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvunzSABM5VefzDQnaIUOO5ataf1NXi6TrR0B3u7FPM=;
 b=Y4EeubsMsYyvN2R9phD3SulvTzHvJr6Bb/pD+yzk4w1KUsF1oZlZaGHwGhkFlzsv5MrmVx/QdyKEWK3vFXpPqNUY6FAMY5tbSY5U1x1cS3eNIkx+styWX+1KE7Jj87ewk6vYdnut28/jDwgRLzWCQm62jHLWwDP+72Nlj5lDceZfeWcc1q9HSPvfExpUfa7isKi6cUncWxMuxIVDlYuzSOEDpHip3FbffE45QlJsYxoZPVVL/XtpO9rccRK5z2VWDGAbChjqFWhovRse+HY4hu7Em8zR5FfakMCjEL8huc0zy42JjeMsb151+te7gxHuah8GMUHKK/x2dPEQmCHPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvunzSABM5VefzDQnaIUOO5ataf1NXi6TrR0B3u7FPM=;
 b=UhB+gBGWABeRsNEE2o0kJe7D79B23+5zG2tnaDqj2gP6XP4CZnza5OX1yl6R2rt9msyrOfdBd0RFcdvW04anW3Bx9AOXi6tDXcC/aHEJ9MSuol2/rCVytUW29AQLqfQGxragao/fwwEM9yPtaub7hPg8Ey/9TdNskW/wlBSN2ywdrtjuRBQMVHXGOgFC1iCehRPmiHimZQFS68qySdefYr1SMq+C+kpal/K/+MNmm73Q35NLmx6TT1A5a3YnPqsBL7PpBx4X4hE9rbHej/FBVDrh5SLW2D/l30p8aPOQRqQbYmvXfQKfGVmWb9iBtBRuR9pe+6VdeqfUQO7eC0MUtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9e1a755-3417-9554-e96f-a54167926912@suse.com>
Date: Wed, 14 Jun 2023 12:26:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: compat code lacks support for __attribute__
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20230614104234.56835aa9.olaf@aepfle.de>
 <ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
 <20230614120850.6b4d0d32.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614120850.6b4d0d32.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: 464f84d8-f30f-4818-1e3d-08db6cc1d31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jQunePnoil1iA+wHf4W8DpQxeyq0idyPY4RRSSVyfpXEoyA6rRcF4hkAd1EcLl0aU+VLNnyGxwSADl0bddvqcp7Am9qVejUU0YDYgasyLX0zBW5HQuJi4/Mq+FGkL8BxkPKM63gdkAqsQdIJ/IsQaUjoK3Aa3VW4Na10uirGh1y4yi3/SaFRevI1mugOb5sNtD0hafXilncJ19sbKkGEEM58kz+xYeOUXSpIVR3VjVo4V8EqTXGg1QK3CTyjkxrdj3uo+KGA9oUmpbb+9B/1NgaCXTRwN6DNj/onN8ikcV7CyU/7HUkXV+Exw0CBaTIP8axj/1WZaOGpzW4wD/xXcWISTcWr395CKD4FbZEDrCVyIaL+YgPM8a2Vc8Sc5c0P2eWRTvWcUAAeUOCJFkPcFI07HK7S3aTEU1KN82GcstVS0vKND0tIMTw2Kz6v9jQNcJM2b9kPPRszdi6Rb7CzDqHeB+ZBWznXT/NHxu99YpZPXJxFJj1KS0/Ds/2rxFnhkq2BtQsk7/4M1BVN7hpnDpEJP2gwIMx/thBJuUEzhcDy7oiJqbUQ+1ntHqTAxnfZDIVDjJFgJ5tS8OYaXnp2lQ90z1hB8+/PRoj16b2xTc/9V0ebLjnwg3kxFdky1iVNqrwWKLhoF6i4N6zPKXzK+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(5660300002)(186003)(6506007)(2906002)(31686004)(2616005)(41300700001)(6512007)(8936002)(26005)(8676002)(6486002)(316002)(31696002)(53546011)(36756003)(478600001)(38100700002)(86362001)(4326008)(66476007)(66556008)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEdwQVdxZ01PNFh6OVBzUm05MUZHV2VaQWlhUjI5dm1RZCswa0xLOTZNMUpR?=
 =?utf-8?B?QVdPQmFpMEtGYTVCYVl3ay92MUpRNU5Hb1VMd1pvV3BnTFNiWVZONmlwcUJs?=
 =?utf-8?B?UC9QaXp0S2VIWExQNnlWSG1OVjBSdVo5ZzZOTFFKV3AxeFJlcXpucWpkNmFR?=
 =?utf-8?B?YzMzUGtnczNNMmNtUmZrRlNWL3pXeUh3cHZoTW03OXc1M2swRFJrU2JCSUhD?=
 =?utf-8?B?ZWN4S0ozUXNzdTR4Y2NYQ0JNelRuM2w4a3lmZitXVzdUM0xGLytRK3pzeFhp?=
 =?utf-8?B?bHljNk9ON3I0THNzQXZlTzhad2RrdGZLRkR5RWlSWS9zaUtLNGJrOWxiZmhi?=
 =?utf-8?B?bldrMlNvcjg0bStnYVRkT0RZTFpGRmNEYkNJWVRWRkcyQ05mVW5aMWk5ZXRk?=
 =?utf-8?B?T0RQYWFaTFpBUDUrRlR4N2hUMGVEajFYM3o1bXp5VHZTSElFTlM5SGx1cXRs?=
 =?utf-8?B?UGMvOXdPdktCbU9RUzI0R0lmeWtQQUxTMjE5c2JoNmdCaXNYSUQrUkhYZ1NI?=
 =?utf-8?B?czdzK2VxbmxqekxLV01hSWJrZGx1cGpvOG9SZ1YyN1VuMWVKZU0rNnpYdjNJ?=
 =?utf-8?B?MlBHVGU3bDBncDZWc0sxczdQM2VmNUVkYmdEclRXYWt6MnM4NVcza0VNSFl4?=
 =?utf-8?B?WjA3TDFzVFh3QnE1cmEwTVo1WUdSTG1vWXAxVDNhRC9KWVRQQjBGZFVEUTMx?=
 =?utf-8?B?RVkrTmRQSm1ZZUFsZ3k3K3JTcTZqZkdyR1FUQjdISTNGZnJYb2JaQzQ2S05S?=
 =?utf-8?B?bUdlMFpEaEJxVk92Q2R0RnpFRjFNY0hmWGhIK0dFN2swK2JhQkdhZnl2cEIz?=
 =?utf-8?B?b3JXRXJoTmJVNCtWQTBDNS9vYWpIaEJpY3hmZmN3MXZZVzczRWFrUVo4UGlK?=
 =?utf-8?B?WlYxYU5vRCtwVmZTeElkYXR3cmp1QWhqZUhMSFZXNUxoaktyaThpMnpGNkpm?=
 =?utf-8?B?c20vS2xtUU1Wd1QrOG5Kakw2YjVvSERISzV3ZXRkZnRCcExwa3VsWmV5enpM?=
 =?utf-8?B?eWFnZzJ5K2RWNDBVQ08vYllqR3JEd2l2TCtuTzljWmZycnVHWVQxVlRUZTVK?=
 =?utf-8?B?WXQ1ZjBoNDdEaHJ5ZTgvdE1FS2I3ejc3NWF2RHNOMG9uN1grdVdWalA0WTVa?=
 =?utf-8?B?SzhSY2JZUGk5TCtBR3lyU1RFMVNuTnk1aU5rUUJoRmpVREV2Y3F1a04zUENv?=
 =?utf-8?B?WUxXczhDeXZhekJTZ1FOT0VvNXoxeTAxSlovekFERFI1MWRSUFV5YmtQL0pU?=
 =?utf-8?B?eTVobGllSmpJc1NESUdvTzBVSCt6VHhjS01QajhINjMyS0c5MmNoUWQ5eXdS?=
 =?utf-8?B?UnhGQlJPMGFuTXBtTWxidncrVVVQWDF0TGJ2bzF0dkZERFpQeUJHaUJ3SXBZ?=
 =?utf-8?B?N0kxcWk1RUNEUFVIZjVFaXdHYmdDRTNFWHFRWldnakJxV1JMRndncHlaaE1O?=
 =?utf-8?B?SWhsM1ZDbmN2N1JTSjJnM1ZUY245cndEbWdaTE52eDdTSUdQTkN3V2FNZDZR?=
 =?utf-8?B?RDkvMUtHeGhyU1poa1dKZW9oQVh6dDA5YlRHR1FFSWVDK2cwbnI0V3ZaZWF5?=
 =?utf-8?B?UVFGZHdzd05Xcmh0ZkxKMXJRcDZBSERuZjgwaTNzQkRDaWpUM1BEckZvY1NS?=
 =?utf-8?B?NFllaW1OaXluSU9oam1DQm1PZUxlTDk1eXVhU3Z3d0VlL2lZTVV2QXFwNEVL?=
 =?utf-8?B?YmY0MnZMNDdVaXFhQVI5K01LZHAxTG5neFU4NDgwblFvNnpYb21xak5Qazlo?=
 =?utf-8?B?SjFVRE8xeXJQcy9uLzEyMk1DOGxnc0JOZ01QSzVmOGVVNS9ua3VLNDhjRjZB?=
 =?utf-8?B?VkxEdjh2Y3RvMW5ETFFNcTRxa2haVUVoQXZUS2RteVo0dk5US0tmdEtHdUVw?=
 =?utf-8?B?b3NjSmtYclJjNHRVeHMyeGJtYithZXEvTm5wSUxXRkpONE1nbFgvbGI3bEEv?=
 =?utf-8?B?aGd1UFdvQVg4d2NLUWJNNGJXMUQyMmVwSEgvNENLQlFKKy8yODNIZmdwNS8v?=
 =?utf-8?B?RHZqSmNtbnczbnp1eWpPRTd0NWlPSFpDTkUrMngwUTVSeG4razQxSDNxQm1C?=
 =?utf-8?B?c3p5NjY4WHEycGhIcXUwc2xLcUNhUTV4aFl6VEdGcitpb2JKcGhBTGMxdktU?=
 =?utf-8?Q?GUpc/b/ckhamo98fe3TraPhgS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464f84d8-f30f-4818-1e3d-08db6cc1d31a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 10:26:33.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OT8GdGobfO4Taj4uAxTK99LzA9iNLOb2NjeVYL4J1z2vC9lknDJwhtvxF4RV0zYSkEZczQl2uQRhk/Rcp+aRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8620

On 14.06.2023 12:08, Olaf Hering wrote:
> Wed, 14 Jun 2023 11:49:35 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> So perhaps we could arrange for your additions to be excluded
>> from the compat translation machinery?
> 
> Is there maybe a place for headers which are not public,
> but which are visible for tools/ and xen/? I think the trace
> functionality would be a candidate for such local shared headers.

I'm not sure I understand what you're after. The "public" here means
the externally visible interface of the hypervisor. Aiui the header
your thinking of still falls in this category. In how far checking
and translation need to be done for any particular header under
public/ is controlled by xen/include/Makefile. So if you were to
introduce a new header for your specific purpose, all would depend
on what, if anything, you add to that makefile. I don't think we
currently have any header which is entirely unmentioned there, but
with the right justification I don't see why this couldn't change
(or perhaps such a header might simply be added to headers-n, so
it's clear that it wasn't just an oversight that it's not listed
anywhere [else]).

Jan

