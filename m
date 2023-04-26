Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F846EF05B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526580.818437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pragE-0000Se-V3; Wed, 26 Apr 2023 08:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526580.818437; Wed, 26 Apr 2023 08:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pragE-0000Q3-SH; Wed, 26 Apr 2023 08:39:14 +0000
Received: by outflank-mailman (input) for mailman id 526580;
 Wed, 26 Apr 2023 08:39:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pragE-0000Px-CW
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:39:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1fb7e7b-e40d-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 10:39:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 08:39:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 08:39:11 +0000
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
X-Inumbo-ID: d1fb7e7b-e40d-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGlv30dhuPn0huxAgqoiMdrQ+0PpWjFL0Ep+BN05Lbswe+GzNkeLHVl3O4k1BnwERNYLhhH7YMVPlNi7unkdy7FHkXUy8WRYTDI413Fc4lSz9kQ8P/FEIuqwZCMyNJVd5T+CWCSdYnf8XVxN/+m5lAYN7YTgHGOW4D28pi9O0le00iVb771MtnV9qbE839DVLzYtZKy/MIuOPEo90o1DLY7MZB5egBDiXdxCg+aLtnrcF6c40hIKWLGBvmvrifQ8whDQNHEW5AOEY87vMQ7Yh9moyauWfsiyCij2TR7q4lefc5wcinNUr3MXJdtzd+N94/IR2dwK5ADbgNwJH8acJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4eGMJQwvz7A42R68EwbdgpDYYbgEq5y8U1rWzi1CxQ=;
 b=RHZKa06Xd/0T9iLly6MNeysIwNw8UTwfy+cIW4BOkpCR+m7XWyGCFvua6x5joX+suEBxd2TSnrMa5VoeWF6u6xpDZgkHaK5P8qE1R82sODQmus2wfcd3WrRAlJp8tXdj9uSMFfHSmVlPUdKeyVxD0ldDERlWYPi1awkdf5Dibe9hUufJarNMIkExmo4G3Aa0oBXBrYq0GDo4mbUEhVgpSaIT3BZrlcZqL3SQw8lhLmqQws1aUvYJ3pU+TJvkv6EwtVY88sgvCeMrXQ5ZV5idMdZSWec5kEbvSqyx9bVPEs21r1uNy6qUCia2+NMgjwPSTat9LfLt6AQg8LupfO+8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4eGMJQwvz7A42R68EwbdgpDYYbgEq5y8U1rWzi1CxQ=;
 b=CU225G2Pj5KLNynQQFEtTUah2gm7Rpb8aor/ych4TCPAdQ2PrX9EFccml+SF+MeADRwITV4jQS10qJH09Qyjby7AePcPf4Jzjrefg4mj2hgRpsFrDNUtE7Y7XEufnlQrOwiSdbYkxlnupiEuy32/VjIcEZhxCgMhlK9rUCEdB7q6gcpP4l6DJ4/vw/5orv9XJhX6fIw9LMwWz9A3XP+hKP8K6A8uG2SbLdyi4KrlGJRGytw7nbOqmFpLWEzoYoAo3hxLXtQMqkiB1/2rG7ffvLftaajyDtpY3zLnjIz60lvtGzqtGuDR9Gtq6UEAWMHEAMi5IgdK2fGRepVSsspDPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1085873c-13dd-aae4-55f2-9d69635b37be@suse.com>
Date: Wed, 26 Apr 2023 10:39:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] libxl: device_backend_callback() print rc on error
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230425194622.114869-1-jandryuk@gmail.com>
 <20230425194622.114869-2-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230425194622.114869-2-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c2f0d1-dcf3-4d61-3f8c-08db4631b54c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NQ0Lk3Gjmc6SSbgPv5gzEVaYVgILLbTpt+RKJjU9yLRpAoT/l0tLkxFaBbrZdJEY9OrIwrF/kRxPiG0DuyZRCNHmlSosBpDAbI8te5zIkKtIGxbkro5nz55xMejpzS+aq3tzBSHVkZBfNqIN/KkBd8S1T6LS8UXnvKySY9u17Cpj8EFD0KIX/jfje5keuuISQojh9K44C7z2W1UNSWUMw3NOt8Oau0KT4kjkE/RTC1FUxyRl4xU37dXAmNfgtqofmDW3Drn6jXfzTYESRSYGEemildK4nsxcBm1chfaXpLfhuJ0L5qsvSqaY8/Pk64Hm5fIZQOmbVhNjrscS/57H2rB4VNkVoHlWs68OkUwG0opBpmJpQ77UR76/RWKGcBTGgpbRB0+8z/qoI2VleRknhoqc32L9taONpYu6+KUZgP5zR3EDRiADCgdtlJSJVkqRhha6heGQvVzu2f3xr5seM/foSDkc0gYVoYzO3srpS1DeoL50/Q0BxXzCQnEVbuh5D4hc6zMT6rl87404D6Pbq8d41Ia+nEay+0F8FkdY06LisLtFheUTLRgAtOLrdu/U0Rk6YWKmReJ65lg6HQ7zxIY69KUh9YTjmK0IhqnIs2/7BR8XWUUEpT0/+Xw3gPcyvgSaS2sM8X6PQ+ZXHTKgeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199021)(66556008)(66946007)(66476007)(316002)(4326008)(6916009)(54906003)(5660300002)(41300700001)(8936002)(8676002)(4744005)(2906002)(186003)(38100700002)(53546011)(31696002)(6512007)(6506007)(26005)(83380400001)(86362001)(31686004)(36756003)(2616005)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW1RNXRJVVNOWStNcG5oSm90Yk9ieXM5ZytkOG94cGk0YlpPK0txS0ZsQzZu?=
 =?utf-8?B?RzNaMFoxc2wycDBhME5KUXZYT05QbUxkdis0NTJ3Nmk0UlA3ekozUm94Rkgx?=
 =?utf-8?B?WWk3bUUrcHd0QUlhYllxWDl4aHRmQ1NYZExTY1FFUmdsVmM5VnBaekdBeUdh?=
 =?utf-8?B?amZuQ2RQcVRZdzFhdVhkbngwMi9ZTGR3RWF2eFQ4b29TRThNSVlSSkRVZWps?=
 =?utf-8?B?bkhpQlkzUkFXczcyeTFvKzBqcmZRb0srWEg2aDBZVGphMUxRQnY4R2pydUQ4?=
 =?utf-8?B?dENaUVRDWXlJaTd0ZGxPaTZsZFZMY0VyWnhMNWQ3WEpjUXhKS0J2TXdiYWFD?=
 =?utf-8?B?d1ZZWStWWDdORiszMEt4ZG96UFYzYXJXbjdxWHMvWjNtYkFCclF0bTZwbDVm?=
 =?utf-8?B?djlSdlU4QXdWQnNiWWFMZDRxV1puUzhoeTVqd2U2Z1VnNXpwbnVWL1RuUVY1?=
 =?utf-8?B?eVlwbDJjMjdJR1FBeElWTk0vTXk3UWt5Znk5RXh4SXRJTExRMC9GWmhDcFRu?=
 =?utf-8?B?MjdzYW1PNEFTMWFnUjN1TkxreVIvSVNaR1JEWnZJMkw5K2xKeGNXU1BXaFNU?=
 =?utf-8?B?TTBOQWlSeUVCeGNDbXVvY1V6UU1laldmTHlOVjQrWFF3encvSytjMC9HNnN5?=
 =?utf-8?B?UkJmcWh3VURUUUtGaG4xMlFWdEJlU29JTktIUVVOWktSaVFxa1NETEFna2lH?=
 =?utf-8?B?UXNhSUlsZjlIak1rbEk5TkRmRStSd0lWbE0xWXd6YW02ZVF3Y01hV1BNRklV?=
 =?utf-8?B?ZnB6K1MvdStPOXNQYUFCNEc3alpoNGtQTTFBSVN3YjZiNTVLTEhCazQzZkc4?=
 =?utf-8?B?K3BNWStCaG0reW0wNDBFdUtmWHA0QnRaUnEvc2RUbkQxWUV1S05vUzJ3dTZE?=
 =?utf-8?B?dkhuaEJ6M2M4a1NqZEJIRlJKR0tJNXhjNGVyKzJyc1RuSERnczRrcUFhaGYz?=
 =?utf-8?B?dUQwS1dsY1pyRTNZYWozZzVFSXVxb3h3d0JaTG9OWFo5WVl6VTgwY29WdjQr?=
 =?utf-8?B?cnhGWlluUVJBYyt1Y0g2bXUrL0NqRVhlSU0raUc4bWhjbm5UYjE4Z056MURt?=
 =?utf-8?B?bnA0Nmppcm1RYlRYbC93ajFJdERlQ1NHc0NYSEQyTVN1aTBjd2FjcVQvK3Fv?=
 =?utf-8?B?KzRKMWJFZVBnZngybkRPOXcwMVFFVG1JcVB6a2kyemJSaUs0eEZYTGdHVGI0?=
 =?utf-8?B?cjNGdURYSjlwZVpvSCszbUt6NEszYk5MZURNeEtFQkMxajR2Y3pDNnpXV29X?=
 =?utf-8?B?eFFESHNpUXlGT2NrWHV5VHczQktUQ0d3SzF4VThYV1JJWkFvdXVvSHgwemRG?=
 =?utf-8?B?UUJSSmV2ZG5XemZxdzgraVRXSGUwblEwRG9VdmZuOWhsR2JXRTJaK1p3Ti9a?=
 =?utf-8?B?SldPYmxRTkpYd2t0dUh5bFYyNUVMcEZuN29uNjI5M1FYWmRIa2VMb3UzM1lq?=
 =?utf-8?B?cnBJQ0hkQ2kzUTFkbFpRWWVRTTVWcThaT0grT2d4WjB1Wk9qMHBPU3VpUDZt?=
 =?utf-8?B?QVMrd3FmZVhzMzZvcmpPa3lQN3lmbkxxYzFSdlNaOXFDNVRiS28wTHRJeDd3?=
 =?utf-8?B?SGRGZXJ3NE5QK2wxRUlGSnFLSFRTaWdCVEI4OEJQRnhpdTlNUVFQWlMvcXA3?=
 =?utf-8?B?WmpHQVd2NGNmTTN2d2xpdnp0QkhJMlZCYVIxT0VkanpkSVhONUYzRFRMcU5t?=
 =?utf-8?B?N0xYMmpaMGlqY1VvNDFCRnI3OGFQc2d2QU1taDNIV3RDVzFJSVRlcHo2Nm5a?=
 =?utf-8?B?TUJzV2c2US9TTW0zY21iVmVOTWxadTZvNFlwOEdSYjRoeHFLVXZKdGtVeWRo?=
 =?utf-8?B?Mm9hNEZJT1RFUGttMmdtVlMxZFRhMmhhOFJVU2lHR3hFTU5kRXB2S1lsNExk?=
 =?utf-8?B?TENMc00zc1VtTlRMT0wyMURNSWpwTUxPYklxVlpxM3pNZ1pWN2twZ3A2M0Zo?=
 =?utf-8?B?eGRZcGwxdFVCRVI4azdCK3FGWGx0Wlh6TDlxendGVnhCYjZUQnFDT3ZBU3E2?=
 =?utf-8?B?YTd3a3pZeWRueDJGUVl4b3Mvd1BHYWRJMnI2MWxpbExUUzg3aEJMcU9VbTA0?=
 =?utf-8?B?bTFUZ2RLd1BZbkliSVpoRkJ2aFh2ck12dlRJZUgrTElvSCtYQUJiSlF4dFVR?=
 =?utf-8?Q?KYra822VFHhd3d/avdaUYyGRH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c2f0d1-dcf3-4d61-3f8c-08db4631b54c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 08:39:11.3853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ii1OExP2RDyU73NW7yPEXcI7i+Ui7VwhNflfo8CySsFvQfo5+PDBl1ErGi8jlZlcimH9tTdi84xv6Rf3eVJyTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073

On 25.04.2023 21:46, Jason Andryuk wrote:
> Print the rc when an error is found in device_backend_callback() so the
> user can have some idea of why things went wrong.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  tools/libs/light/libxl_device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

While patches which are part of a series should be sent as replies to the
cover letter, may I ask that you do not send individual patches as replies
to other (unrelated) patches (or, in general, really as replies to anything,
i.e. also not as replies to e.g. an earlier discussion)?

Thanks, Jan


