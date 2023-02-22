Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0469F370
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 12:27:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499388.770501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnGV-0003S2-3Z; Wed, 22 Feb 2023 11:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499388.770501; Wed, 22 Feb 2023 11:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnGV-0003PV-06; Wed, 22 Feb 2023 11:26:27 +0000
Received: by outflank-mailman (input) for mailman id 499388;
 Wed, 22 Feb 2023 11:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUnGT-0003PP-2Y
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 11:26:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc46f800-b2a3-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 12:26:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8879.eurprd04.prod.outlook.com (2603:10a6:102:20e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 11:26:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 11:26:21 +0000
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
X-Inumbo-ID: bc46f800-b2a3-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOrmsWLKpyDOWPA162jOWemtnmWjtnEXMXHRTVytwKcHomSEN6vxR7nVZ7t/UwwuO4HSOyyIznTSR1BplBM5WAZuK5NxtDAgH1UtEea0porhtmOHDCi1qZuqmxQO1dqEKjiPwwJ8ndY/0Rydmz8rnBOYtFVPM+a+cswt1hBkZaaYd6I4khrYe/QxQmfB/bx2+XLkbD0BkfNv/OtDncZH7tYgcZGT+Ijoflha3XzmEq1O4+M8JhWQ+HttQG/TZy/pbfG7befML2G2+ZsWog2TO9ugyWEf0DUEn+/5F+MV9Zbr/GSdUWRbl2HAlTayzGIwL3nU3qB1L7zFSncw4IL1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGdPVvN+6sqr0QWyGpmV++DEXd8f/B8hU1wxly5arKM=;
 b=EHYEJV+7H224dOLEU0oP0rBmwSgwjBv6Ged6aMqp+5us6/H05zREPo17yoLfFQC4mZcDr9XWeujyZX21XF/xHEPzlqOlusNc45WNA0000wtLXV0hOoUDOB4+5nD5Xdax9LzBBmc2GxBYGLHaxvUX/OaOzoae0c0Dl4WlZ2HBSjpikePobfgZZ6QbBURZAvO0j01DU80/jqflGUtR/QFzmYXuFFm/OrvOneA0y3h2hs5taQgvrrhenHo3Rkkm9HsROvRIdkHqjqjvBB1TN1eD1TCEKQxrGCLjG86ABfiXEBAGt+IpRNXSbnQ8R4o4ru/DEwi6+99eV6CH2v80X5aItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGdPVvN+6sqr0QWyGpmV++DEXd8f/B8hU1wxly5arKM=;
 b=roSxhoNAzWauAefiq1Z1Z9xKdtHVQXjDoET0JwiGsM8zhF1dMkCCmHBeKPKqRZvGGuOg9pq6nKoTNSaYRCQrxlw65mOoSo44Y4h/ddAB5duVemgaiAI2ak/CbFJ8sqh4LfuTmI5ckD/KNDx/Utbez1klGoAttrOZJnqd6Q15MA6DOLqqWGGg+pcfvZ2168H48cdbj3I/HzhudAw5VbdZdMHw8mu3amcSszqFuiXfZXzgJw9WLIXU1cE9yuK4N9w2hdL1GpqljCHsCxESoB9S8geKXmeXjPPVJ9rV3X0G2NJyVb6ZtTEJO3zPPpvHEd7H/5/vRjzvuhx1eW+R/ytk1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54af6801-6a43-e1cc-46ad-bc37302ea460@suse.com>
Date: Wed, 22 Feb 2023 12:26:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/extable: hide use of negative offset from array start
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <359b8d70-0a97-8a52-fca4-4f6b7621d58c@suse.com>
 <c12f22e2-fec2-248b-c4cb-1d014f0c33d3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c12f22e2-fec2-248b-c4cb-1d014f0c33d3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8879:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c8c6b6b-c528-41b4-168c-08db14c79f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rdrAGDhJczaMCfCJPEhwDqrqPlZtwCS+Wuj/rI/qhfKmril7FglnETfvknlCDX9/0OJ+E6QkVCeSK9+vxIh5srVshz/DmVow44Aczl0sW41h7LdOmE0czoaMJk8+Es93Ssq3GPrkqfz8BvpnVbszrX+xgXoG/o35Flx1DnJ+gwDZeFoBXyR2ld8lD9Mu6RQoEIn4YM496XQqKMbu5IjYMCJmXP/QJ3we0e7bufkNPljDUrG1zFk+XdxTCGimUesNMcDFe5nWdiXEee7xaa43jUl+iwCQG9Yp9OdWCRg0XF8fCyLWgCtGtxfezO3kkiKgC2cofCn4iFrGrNcOkpmCaET6q/yICX/Y/VHDkH9cNN/ajmYcShs7l3rKIDMPRdwQoY54nCKz1lCPG4Xy+x/MLAbWCObthuBpVFvci0dW84IOsSDronDhX6MB4PzqT+NGu6dzPFz+KUrB2mdpilrGljALTTqP1u/pUl4hH2ur5j/Tp4kB7b1yJ2m1NXijPpYs/iTTRsKg/VevsTEY/da6Sa/WMpjuAoecyU8ejHdsHDYiUf/EKYHIlYtXQXxjwiF8kyY7/z/1q8g5mkPR91gWCpE/UNUNcXhaH7XX970zw/KvD6xneCBsw1VbjOG438Ps5BUOMecI/pFlQufSfBCIYLrOomWsN/L+L0VDctDfZux7Lh33CnyBB8Ap5iNbExPiXAOjBT/zZbRNPudnbgTUJbZwzqgckE+iDFJIgrWFxio=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199018)(31686004)(83380400001)(36756003)(2906002)(5660300002)(53546011)(54906003)(6486002)(31696002)(86362001)(6512007)(478600001)(8936002)(41300700001)(38100700002)(2616005)(26005)(186003)(6506007)(66476007)(316002)(8676002)(6916009)(66556008)(66946007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWcxTjNMcmg1Nzh6dVpnUGtvQ2d0RFRUVThSNVAwWExPOFhSNHZPZ2dDeUdu?=
 =?utf-8?B?ekZ6SUMyK09QZWN0MllUVzBMYzZnT0Y3emNLYkFXcTdXNUplQXk5Wlk3eGs1?=
 =?utf-8?B?KytJUFhCOWpvVTk5czl6ODNaSHdSNitCMDE2RDBOVVp5amd3SStKZUhOcXpR?=
 =?utf-8?B?UlVDeW05OUc2dnMxNk1CSllxekVWbUhGZ1orNzZ0TGJvNzBIbXdqZk9GZUpN?=
 =?utf-8?B?RUdxaGRCM3NmZWdwRTdjQ1ZLMjJsWWQyeGVwazR4RjZWMkp3TUxWa0VPWk5r?=
 =?utf-8?B?NlRZakxuc1VRa2hnT0oyUXFQeWJ6TWhETkZCNmhraGJMZDJSZTZQNDZLRVQ4?=
 =?utf-8?B?V2hXcFh0VnR0ZEtlcTJFRFVUTElEbkRmRzlNRnprZTZ3NmJRamlKL1NhMHhs?=
 =?utf-8?B?Y0JuZU01V3gxcTlHL09rRUM5b1RoYVRVZXE2QmRLQUl5NGpJZmJBcFB2d1pZ?=
 =?utf-8?B?Z1djRmxpWTFicTgzeWt4SVBYS1RiVnZPVjViaXVGOGxVMTY5aEhZTEFEekZa?=
 =?utf-8?B?ajV5N1pJRlQvZUZYZGxkZVEyV3NQRTlOck1oRjduZmtLVHNmcGoyMmkzMjZX?=
 =?utf-8?B?bzFUSFczRUhsT1NFSXY3eHFPaEpvZ2pkZnNQcjRLcHY2clZQSUdCNmFUQjV5?=
 =?utf-8?B?MGNrQkxSSnFUS0VqZ29kMTg2cFkvK3FHUks1UGo3TSttSzdjTE5pNWRKZmpJ?=
 =?utf-8?B?NlVhQ0dBdFNwaVNwMEdYNWlheUdkWndNdG9DQkp4RjB4SmtoOSs0TDlENit5?=
 =?utf-8?B?RFcvVmlORnVBeWF5UDAzTE9GUkhrWVF1dlZHenBwNkZMZDhCK3pGenJKRElN?=
 =?utf-8?B?Ykl3OG9qWUc1cFZyRkFoaTNJcnk4MUthakRFU3BSZUtwNDk3bC90RUhFTDZu?=
 =?utf-8?B?SHZkcCtVRWc0d01tMzFpTXFQbTVlZm5jZWFsUDY0cWpNbnN4N0ZOWG9NMkF4?=
 =?utf-8?B?NUpzNndXZ0lNTUIweW1ZRlRwazUzU2JFc0c1V2N6cy81c1JydUhVNzk2WHhP?=
 =?utf-8?B?Zi9GakZKTitWS3IyTjgreDNGNS9iekhoUnVvK0ZQR00rV0tqdDU0RmRyaWhN?=
 =?utf-8?B?L3p5OU9iYm5QMEZ1UktBZnN3cTNPRzhxVnNpRzZJSDV6Y3hRQTRIVHdkYTQv?=
 =?utf-8?B?bWVvMURPcWZmU3pQeWUwaVY5NUN3cFJlVUxia0FmakE0clJNeStsQWthSXJT?=
 =?utf-8?B?Tk40N1lWQXUxaXFzam1HclRDbjZWQWFWcHFWeUVlM1Q4OUdPWFQ2SytMUEVo?=
 =?utf-8?B?aVNDb1lpTUV0cjNnQVJFSHZ6OHhQWG1ISk1ZTWlwQkZOakF6VGNqRGNLbDFi?=
 =?utf-8?B?eEpoNmQ4SmtlRlNEdHRGb0VYVzJMUFFMcUU4Z1BKdHAyTUZRRmdwSE14dlJs?=
 =?utf-8?B?N1lRNkMvRFFQQktVNEtpd1RwZnBrUTA0TXFDYkxNSFJXTHRWOGY1bHVZQkJj?=
 =?utf-8?B?VDJvOE5HZ1NoSGsxK2h2L09jMkNueFRtc2VzVEtORXRGQXZDMVB2THRMYk5C?=
 =?utf-8?B?b0VtMStFSHcyQTYzc1JTV1pwS2RwK2FmZGcySVRFV042UUtnVUxkTTFBbjVQ?=
 =?utf-8?B?bVpNMU0rSWJzd1pxeFpYUHRPWFh2aEwwckpIQnRRVytkTS9CSlBqWHNKWmFT?=
 =?utf-8?B?YTZHRTFNSW1aTy9oZVY2dmNVOXNNc0RmOHFNRzIzR0JLZUE3ZFNZUk40Y2Ju?=
 =?utf-8?B?Z3ZzZnZTY2RneUY4blRyYS9MT3JtUHphdyt6QjdpKzl6Qzd0aml4ZEFlQkpl?=
 =?utf-8?B?ZnhGM3FHYjMyaFlDRTNDalh1RTVVbUJ2NFpJWGMxSDJLQnRQV0lCNzU0U2FF?=
 =?utf-8?B?eDFiZWFLVEhtR2tIMXVZN1lSdG55YmxlTWM1d1RJNVUwMXFTY0VGcXVZUk9h?=
 =?utf-8?B?Rnc0eUN2STNsdXNPM2JiMGFLaEpGLzhLUFVOcDNWeERJYkdRRFNjNVpmL2hQ?=
 =?utf-8?B?T0JRazFZZ2E1WHJUbFJUWHMzV1NGbmZLamhIdFkvY3JSZXhlYUJNK3Z2VGpu?=
 =?utf-8?B?WXBsRlVxQlJpVlI3eW5qSzlacFZJclRTajI0V3BMcXhBcXVCYnhROWc5WW1V?=
 =?utf-8?B?OE1aV0V4VlFsM1MyOHJQYTF5TUUxTVFDTjRjUnV5enRxVHpkdGZWU2pQbzRi?=
 =?utf-8?Q?32X+BXiLoRG4BpGWOqkM6+TS4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8c6b6b-c528-41b4-168c-08db14c79f54
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 11:26:20.8598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WzecOdsKY62Say6MhaxB6ttSSD/LmjQbG0OodtBgWEc+FLaG1nJ29YnN7aQT+AtlV2OmxlnhO/cIT855paPkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8879

On 22.02.2023 12:15, Andrew Cooper wrote:
> On 22/02/2023 10:22 am, Jan Beulich wrote:
>> In COVERAGE=y but DEBUG=n builds (observed by randconfig testing) gcc12
>> takes issue with the subtraction of 1 from __stop___pre_ex_table[],
>> considering this an out of bounds access. Not being able to know that
>> the symbol actually marks the end of an array, the compiler is kind of
>> right with this diagnosis. Move the subtraction into the function.
>>
>> Reported-by: Anthony PERARD <anthony.perard@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> To keep things simple, I'm merely calculating "last" as a local variable
>> now, rather than replacing its uses by suitable ones of "end". In the
>> longer run it may become necessary to actually go this 2nd step, as in
>> principle the compiler could inline the function and then still spot the
>> same issue. However, while the subtraction of 1 can likely be avoided by
>> suitable other adjustments, "last - first" cannot easily be. Yet that's
>> also an offense, in that it's calculating the difference between pointers
>> into distinct objects.
> 
> All of these bugs are ultimately because gcc doesn't know that these two
> labels are the bounds of a single array, and not separate objects.
> 
> There is no possible at all to get rid of the "last - first" calculation
> - this is a binary search through an array.  But it's also not going to
> actually stop working, because this is the common (and documented) way
> of getting linker symbols into C.

I disagree with the "impossible" aspect: Rather than surfacing start/end
symbols, a start/size pair would eliminate all such concerns. Recall my
attempt to make use of .startof. and .sizeof. assembly operators, which
sadly Clang doesn't support? (These aren't properly usable here, because
there's no separate .extable section in the final binary, so the remark
is merely to support the point I'm trying to make.)

I'm also unsure of that supposedly documented way actually covering
symbols at the end of objects. If that really was meant to be like that,
then why would Misra make an issue of it?

> For the patch, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>  but

Thanks.

> if it were me, I'd have gone one step further and made
> search_one_extable() into a more normal looking binary search.

Well, I kind of inferred that from your reply on the original thread,
but I have to admit that it's not really clear to me why things would
end up "more normal looking" if the upper bound is exclusive rather
than inclusive.

Jan

