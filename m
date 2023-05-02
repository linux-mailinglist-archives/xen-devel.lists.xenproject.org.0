Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9E6F3DE3
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 08:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528355.821387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptjtK-00069G-8d; Tue, 02 May 2023 06:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528355.821387; Tue, 02 May 2023 06:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptjtK-00067W-5r; Tue, 02 May 2023 06:53:38 +0000
Received: by outflank-mailman (input) for mailman id 528355;
 Tue, 02 May 2023 06:53:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptjtJ-00067O-7s
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 06:53:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d014f29-e8b6-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 08:53:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7166.eurprd04.prod.outlook.com (2603:10a6:800:121::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 06:53:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 06:53:29 +0000
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
X-Inumbo-ID: 0d014f29-e8b6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNp8q5CcnOl/0AUeIHGQ+6W6OpdVzdWScnUcpbXQ4dKoGbMYaEA7XH14J/fQMonyo+j3YlYRyF0WczBn8N8BzAOAk3GxjqVYPGy8MtpxDWdH6yEYWx482zCoJhIeGDY8i4tsXUGKgIemF/p4knCLlvIxvNPCNONCLcZyzSYKfgGNGtlEAcIQM6kfD0/NlZTy0tP5XdqSCLGJ2p0ttUV6yvqs5iOCKW7QJIuR/5PGIQ4iHPg36l1BGIjizACY5vex0pIRwt5mC0iZ0aEYwFb438CJL1p0TOidAMg7+QrYgg2sLkHw911bABEqStO+DKSsubjSSzrDZEeasu5GFENqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrLqDwXogvWTiVrkF8oSNrFfbNIE+diqB/eY+7SfAGE=;
 b=BdiNKGBJiP10df1M7B4H4J+kt4HNcLKqiRV52JZAJEkMQQpTGRGpuehAWmge6JIMywD/bjfjlwgUlV5zUmGG3PFz+2EH3s5/JHt0reV+rQv8rO560zOLdsiGKbB1cIHvU1TA6HpphMlTabzDPtlErDb+9F050E5vXR2j3S1a7vVG6lN4zZ6IfSx0LpTBp+DnlJH0qP4LvIjh8HJCW10o174bvoDR7myE7wwVEHBd6atnjFWGi8u8GNWhz/O9f0FiElbjlgC9wHhM7qLwxVNpaWX5FQeYPBKA12DOzBlA4Rw5kKGcuEZ+1gq2c3CMEIAZg5JNmNbg8g7ROiHqJtSByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrLqDwXogvWTiVrkF8oSNrFfbNIE+diqB/eY+7SfAGE=;
 b=W8Ix5nkC79R46Gd/R4FxCjtMd7XQox70KmM/ikPWTICEfc/tTDQE36j7wvhvVmhXEfvWawECz0iCwsdlGmgH4TnaMVGoBZMpQT6FuEZvlp7RQwvVZcNyUr2fBpEOPvVMOYI0yaSzje44+aRqea6BqUJsPzVnCft4l42WmbpARvqu+If8Tm2tIKrtatbr48QlXgnRD3Otzqem/cKFCIv0XSOk03LXL4c0P4vFDVhoAhWo/61t/4tIOCID0LO0n+clE/Zl+WoQArzbAKIczR7SXJlzgkZTVAOinkfLOLcAuZ3bT0rknYKNcHpp1xR5txJIB8aJ8/jwCj3EC0UpcJFrsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <333df991-58a8-f4e0-b46c-9f480cd34213@suse.com>
Date: Tue, 2 May 2023 08:53:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, alejandro.vallejo@cloud.com,
 committers@xenproject.org, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com>
 <alpine.DEB.2.22.394.2304291808420.974517@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2305011835000.974517@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305011835000.974517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d591166-a79b-49f1-547b-08db4ad9ef95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qbzQPVavKnYfdLUSE/vmpkMy5tBAX1AUAwG2Irw/ovXSkC8TzL4pSFKLHXprPTgkjagt1/yeGTe6P+8EqeYIN2lUZdDykh3WtxfmmLvM8UgzEUoG6iAEPdiSr7lnBPIRfYrC312x9VO/pe/hzkInvWldH7ygZxhs1onYP2N5Ko/igtG0yDPVOii1FGvD1vbic7jXGslqyC3hcpXn7iGxKSfoWcg4FVFYthvKqZOs1FUyqZyQP4HC+cAfFR7eHe91VOf6dpsNW12uSHU37+pCA2WyABTxs0+evlQN+l2RCwygiZt4NUkOTIBRA5xHBpaq/vxHSZtljqd3gUkNvxoQb5o4WACJJpDGafiNay71wryb9lkx25VHjyDmmaRDg6TUElzn4UhawxhO4ACBNH4fKmTwGNBRL8RZP0qpj/bpL/6QHd+GCJYE4SBVm+wxsRKKaLVAgmfG1UgN7tTVLTTbMfyhagchvwA4tdvgsRSmsd0GkdyGz5c30TiQbTyuPEAsFu/73UuxLvdi/QVO3QqP3rY8lXvD+SbK68VeXXnfT4J6CoTs6R5xVox9M1bVR+h6x2zd+iZwWtYXSH9u1BapuKLT7ECz8hrRbhehcm/cXOUNKp5ZLwyTHnGFy2C9WSwN3mPRkXiWWSLW+KHttCQXUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(39850400004)(376002)(396003)(451199021)(31686004)(316002)(2616005)(53546011)(6512007)(4326008)(6506007)(8936002)(8676002)(31696002)(86362001)(5660300002)(478600001)(83380400001)(26005)(41300700001)(2906002)(36756003)(6916009)(6486002)(66946007)(38100700002)(66556008)(186003)(66476007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qy85dzQvU3F6ZkZsenFCZVg3ZHZkd3k1MForRlJpMXZxV2F2eURmQWxHN2Mv?=
 =?utf-8?B?blhnQUlveW5majlBcWh5dERKOGRIZnhlN3UvWmcxQkhJQWZ5SnVpRzliSHZM?=
 =?utf-8?B?QWdKVFlISUJ6emIzMlRSZmNtaEt0dXFsV0xNUkRkWnR3Z0dlMFMwYU5DSWVV?=
 =?utf-8?B?MUxoanRVSjNuMk4vWWZwcDNNR21CRm9sT2luUnZobE4wNGZ0b2xBZ1JBK1hm?=
 =?utf-8?B?YXlMTW9EQ3FjRUNUajI5ZHBFeW5ROGpWMWRrK3QwTElkY2UwYkpzcjNwTHln?=
 =?utf-8?B?MGhibVExWHpxOURNY2w2cHBVWjJlcSsyc09saXp4dzkvaEhUdEtzUW9ON0Zp?=
 =?utf-8?B?MmtVNmRWNEpLMmJONlNwZUdLaFdlUVU0R0FVaEN6SHovTk9ZQ2dJNmNOcmp4?=
 =?utf-8?B?QlBjZFF2akl1djdnajNuREp3UnF2U2pJSFIxejh3SHl0RXhLd0hFckYrdDhP?=
 =?utf-8?B?c0pTVjBvOTkrRlo1d3VyL2xBTGxGZFhXcnFBZ0JOQTV3SXkrWWpGdjQ2dG1F?=
 =?utf-8?B?Rk5idmwvZE42YUVCZ2xuaVROT2x6VEo3d003N1lZK1I4WmN5VERMV0Vvck9N?=
 =?utf-8?B?Q01Gb3BnOTdKK1dMVUMxWEJxdXZvMjgvVjk3c0puVndWU3BkbUY4Wkk4WERZ?=
 =?utf-8?B?Rm12QlZ1b0RtZGRIRUhMc0lRemErcXdZbjliMTgxMmQrWkJKRkxwN1RQV3l0?=
 =?utf-8?B?YnRjS1pYSlZvc1FsbGRKc1kyWTlWUHF0Y0pYVnhlQTdKVjJpZ3ROcXB3Z2JJ?=
 =?utf-8?B?VWE1UkpCaVZMeDArMVQ0QmhBbjFvcHVrWVdXdGxlMXFqK1lZbmxBUUVQRzhr?=
 =?utf-8?B?SmNabUJWR0Q5amppTXA3bHRIRkUxd0phSjFYMjhjaEltK1Y0UnN2ZmM1Nm9k?=
 =?utf-8?B?UnRVaXAvOHZnWVVyL09CQVJ6UXhpSEtZVWNhMStucmVtQ1grWFVqZ0hsOHRI?=
 =?utf-8?B?aytZcHpnaFdoUk1Rdi9oVzF2ZEpuMmJEU3d0L1ZxK3dYMVd0cmpiSUdlelg0?=
 =?utf-8?B?RFBVOVJQU3VpVmtpZHFoNDcvTUpxK2I0bEwrYUlLSXY3YkpRajgwL1U1MUJK?=
 =?utf-8?B?ZzFxNzlZMFNnUzFlNEhreUN2U0I0L3BpRzdIdGJMenkvOUJyYVhLKzF4VElo?=
 =?utf-8?B?bTFmbjZOYkF4NVNra2dybW5oR0Q3UjJZZDZ5bHYwa1ppQjFScEtxbm1OV0JV?=
 =?utf-8?B?cDM0dEUvczhBc1gwOEp3eU5LZWZkeGpzU0JWc3Z3TnF6QVdwUHA3Qi9tblJB?=
 =?utf-8?B?Zlg1aTR2dnFOU21nRVFzZy9lRXBBc25uVytxcUM2MlVFbytCUHNsYnFRTDI0?=
 =?utf-8?B?alBCbWpJU1hxamp5UzJuM242YlpFTVkvWXhWb3RXQU5kWWI3UXloTmpFeHV6?=
 =?utf-8?B?UFE1cmhSMmJDQ1lHL2ZjNDJENHZZdnh4dWlrdlNydjBncU9Ed0UrM29GYzla?=
 =?utf-8?B?TWVKeG5WdkV0ZUgxV1QveHJYN2ZWUEFqWXNzek0xSjc4VTQ0UW5GY3hISHdL?=
 =?utf-8?B?QXZ5aGl2bmVNLzVRS0cyWUEzYzNqNWxmMHBpd2lqaXNyc1dBa0xHVFlYR3Vh?=
 =?utf-8?B?SXRadmgzSTdZK3FiRFp4Zk5wOHNFNTNGSEZycFhDVUpCQllPWjd0YW4wcldS?=
 =?utf-8?B?WVQwVEZWeHlsWDdvMWV1T3lNZ2RCRFNkSWdhTU5wZnlHb3d5ait0QVU1MTZl?=
 =?utf-8?B?NE4wc3VtdjFiWW9FUEgyNVVEMXFrdjc0UURJSTlLMk1HOGc3VEpKdzI0NEpz?=
 =?utf-8?B?UUJTbVFGbk9QZTlycWRaRUJJY2dic21pdWlxZE5ESnVFTWhwQUJFYjJpeTNZ?=
 =?utf-8?B?WTh1RUkweGo1dGcycFRnMWZWWi83TmRHeUkwUW8rVVhLU09vTG5rWTlkSi9Q?=
 =?utf-8?B?UTFSbHFVMUp5c3d5NjZwVjJBMW1XVTNreVFyczZpMGdwUmNhZVZOZDlqaW10?=
 =?utf-8?B?R0x5ZTBLbEx5WHg2N29POW9ENVpGT05MSEVOdWFzeUN5VkNza1BqdXo0YVlH?=
 =?utf-8?B?SlZhZDlHYzBod0x4OGxJVDYyQlNCdFhyS3NoakxlQytmMkNnNTZRc2x5VUNR?=
 =?utf-8?B?V3dXVnVIMjM2THZaYlpKc3NhM2dteUhwbnQyT2FGbWtXTE96RkdkNW9rVE9S?=
 =?utf-8?Q?T1v9GXQBq8vRJO0oE+EkKiOOF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d591166-a79b-49f1-547b-08db4ad9ef95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 06:53:29.2757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5jsHjRA6JGkxWYJpi5s7LiWBjhryPWew13PHDaH1HQhzXvwmD4QMadDZK3PmPWbWmoxeViZEy51e6KnQj+FQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7166

On 02.05.2023 05:59, Stefano Stabellini wrote:
> xen: fix broken XEN_SYSCTL_getdomaininfolist hypercall
> 
> XEN_SYSCTL_getdomaininfolist doesn't actually update the guest
> num_domains field, only its local copy. Fix that.

This isn't true, at least not always / unconditionally. "copyback" is
what controls copying back of the entire struct, and in the success
case this looks to be happening fine. Yet for the failure case it's
unclear whether any copying back is actually intended. (If the op was
to return merely the number of active domains, I think that ought to
be restricted to max_domains == 0 and the handle also being a null
one.

I'm also having a hard time seeing what failure case the test ended
up encountering: There are only two errors which can occur - one
from the XSM hook (which is mishandled, and I'll make a separate
patch for that) and the other from failing to copy back the info for
the domain being looked at. I hope we can exclude the former, so are
you suggesting the info struct copy-back is failing in your case?

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

In any event, if anything needs fixing here, a Fixes: tag would be
nice.

Jan

> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 02505ab044..0e1097be96 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -107,10 +107,8 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          
>          rcu_read_unlock(&domlist_read_lock);
>          
> -        if ( ret != 0 )
> -            break;
> -        
>          op->u.getdomaininfolist.num_domains = num_domains;
> +        __copy_field_to_guest(u_sysctl, op, u.getdomaininfolist.num_domains);
>      }
>      break;
>  


