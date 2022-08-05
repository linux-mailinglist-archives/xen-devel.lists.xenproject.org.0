Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF3F58AAF9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381148.615699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwgY-0004Ng-P3; Fri, 05 Aug 2022 12:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381148.615699; Fri, 05 Aug 2022 12:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwgY-0004L6-ME; Fri, 05 Aug 2022 12:44:14 +0000
Received: by outflank-mailman (input) for mailman id 381148;
 Fri, 05 Aug 2022 12:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJwgX-0004Ky-6z
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:44:13 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20044.outbound.protection.outlook.com [40.107.2.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3d918f-14bc-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 14:44:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8552.eurprd04.prod.outlook.com (2603:10a6:10:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 12:44:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 12:44:09 +0000
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
X-Inumbo-ID: 4e3d918f-14bc-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7u0xQmZBGXyrfbEs11JjGvcyttlWlxPWFq9FE9U5lpP9pyWhMp9eCY/F/0I/Hk0a0+WY/soqtf/pl5B0V6atG1uiQhM5fWejRSf4fOCzCcDyfLzvaKygkegApuPTISWfXYwnhlPpSkp4unVX1dQ0GeqyBcGfswOIlX5K1lkUiKhDsdcJVeftVWq5h/smwogJAGOuGRWrpmi48uefvE2rZiT6sOKe/OSJ4t6a9rFBRVohEAToNm9q//HDWtrx1hy2s/IfteVKA5T/+I6OGVc0G2CM+A5q/0vFfG51lKw7ljr6jQ+yeHkAOtNp/UGRTr9iwIFtklZE1uP2W7k9O9NvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzHyQApOXDWqwjAkCSCjUK8hAkuZnwoCJGT2zZ/wqXI=;
 b=Sy6+9GU0RSHi2hygD8P5V3SnXkETXm/d8Kau1QVU8JVUARaMKojGrBfId3b130J+8D++zbnzQ/wT15ZajT+GGnKYooEJjiWk58L5V5DZiYws/yS0KDfjoTj5wskdB0KevB8r+ohlxoiqEjLxWdQSnDg0vTHuCDZ82lsD+3br5kEBfUXn2etQYaOtboYOpjSr2iqamsSdjJx/Jjq8jL8qEcOKlPzzW+VFIpBAlQW3k+sh/BUVyxWE7O4FHglZZFSjgP5RGzhLpVutLrwh+eE8YzwWDPaimP3mYVJWdQxRnxKwZCu9uWUnst3ceoirtZzhi5bb47qx4SMTQ+qGoW0gqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzHyQApOXDWqwjAkCSCjUK8hAkuZnwoCJGT2zZ/wqXI=;
 b=hNAkllnMxcZPJ2BIgeWdxEHzjo1EpeWgd6sxUejfKX/Nm0KuCXwGods3YcY1iTWcGMudc87qvxIQkSeZTge/U6zyd29UQjzgeR93yIXd+vMhSShViGIjxdl2vtl9CqoOK2HyJgLLwbAqjsNPeOP/9K5Th/kRYjiTxZ0GER+aWiPG/2rYk8s3EnNbBnzgwgtCNLqUCd55qfMR/AucAuAT8fmUxsepsm/NdMFL37BHkEhkIo3vAOzsSYRbwILe3/n6KknGGkXhxQfBUlu4nYDFeq2F5OYS9MjW/NTurNB4YwDP1v1UiPRL/tzia8RilkJEy4afoHAizD2CCZOuFsAUWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ecbc9bd-c232-cb54-1c0d-f64b3fdfc20c@suse.com>
Date: Fri, 5 Aug 2022 14:44:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: qemu's deprecated -soundhw option
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <2b5ab7dd-d38a-835e-947e-67e1be263cf3@suse.com>
 <Yu0QQ7T+Hh1poeQi@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yu0QQ7T+Hh1poeQi@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b529a0a-323c-4d2f-81f1-08da76e03100
X-MS-TrafficTypeDiagnostic: DU2PR04MB8552:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fAdVG+u1oAQ6m51TxCSHmegOh2rf/727aSAiqM3nYvgokp9Yh8QwrGbwUE4MfCy0Yes/UUMjz7kKeQ979M040YGtZty9w+IDTb/nBo6mxxkF2UlCN4erQ3vH5C6HXoskeNKy6WYRLW7zbaHyYo/3BTNanT0cJiQMoAqQHypU+IOWTh5lodUVH04BglZIncr3oBDw8UXJ1tZfGdtTRmE2VEdR94t71wTUmRVzvy5FVvKvM3U7aT1UXp3Cjjteb9ICGFaRTbLgMMpq+5yAiHmBp725ZIzjl7MQHs4NYOBl+tLaXzKRophuvPCJvIiWuVGuIBW1OoO9HALD1f3sJtztqnhR6J+GsnUq0GCPaDwVXIiMarotSYD443kCpYi/oJrlt+KEcOa/p2dQfqbT1f73+reqLENRr433aX2VBhtIZsuD5XLThE8FORYC8/m3n84qGE57lRhMxyxTbBrk0IeRohnR6eqlRMjlID1AiOA5guk6g6hV4oHedhNbZ3AErH6zhslInCXUgKpNLb5FQbBvyTdvX0Tzbs9Yi+HRmcnSu2KK+Gs/mNRrlU1u0oJn9gYEr5F0gs7bu3TmpclwPPban99OXKR95fmbMaZZGVv5bvMqV6dQ44B1j44gWXfkYRV9EoUs3cqTDOo4qAUqbr3A4gg0KfCgja/S3S4CKtE+8klMRw539pCTEHJ2EntokLKIukb0O+Llhp7GRRfVZxJWm5ZNGShGM6nn/bgt+Wm5EaMBShLlvr+lgldFiY7DzxvLlJS7oM0tyR1TYAUlNIywiE6pIhHx9+b/DBWwv7j5pWt4EhwRUqP6Y5DEC3fsJxcM0DOLw5+j7Zp7SkbJcGByhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(366004)(39860400002)(316002)(6512007)(36756003)(478600001)(86362001)(2616005)(6916009)(53546011)(8676002)(31686004)(66556008)(66476007)(66946007)(4326008)(54906003)(31696002)(2906002)(26005)(41300700001)(186003)(8936002)(6506007)(5660300002)(38100700002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K25qcVNGcFhTOG96TTZCN3Y0blRxUGpkc0JKSkk3NFBwUXJRM1lML3ZNRkN4?=
 =?utf-8?B?dERqR0hNZFhTWFdzeURvOW5TUTJGR1pkaUFGbTRkS3V2KzJYK3cyRVU3YjNz?=
 =?utf-8?B?V3NsMEgwQWppU3FqRGZDL0tjNVArMFFHempSdzlnb011UlVGTEI3SEluUUI5?=
 =?utf-8?B?dnEwdFIzcFFicEJ4a3didm5TcTk3QnJkSXIyZGVpVmZkbWRmelYxRURNcFoz?=
 =?utf-8?B?dVVnU094alk2QkI1ZHpUcnVYaTBFbDk4SitiUHdIUnVsYWNoMkhEc2F0L1I5?=
 =?utf-8?B?aXl0cnpVdGEvR3UrNW1jNGRmdWdKdnRXanFSQzFkMmFwc3Vzei9ZdTU1UEFo?=
 =?utf-8?B?RmVabVUwcHRLamdmdkd5S0FDbGJkdy9YZXZkeGhkZHpNNzVqbEN3MFpPRnpQ?=
 =?utf-8?B?UnErVTFlUFFFdnBWQTRHOE4vQ3FRQjY0Rm12SzhrMzRicWQvK3U3SU9laERi?=
 =?utf-8?B?OEs2NzdiNmh4cGxhdVFxczRKK2NHTEpxcityY3dZbHZUOWxtakNnTWJScjh3?=
 =?utf-8?B?QWk3M0RId2JmeTFBbkJrN05UQ0t3NFFUNTF3ZVozeWhNMEdkVWpmSzduQ1pu?=
 =?utf-8?B?U0JYY3NlRXE1ei9rbnFqYUVhVzBJcjd6WHhHSkZGY1M4YmtFK24zV1B5MG1i?=
 =?utf-8?B?YmU2bnF4UzlRaHk1bTdkM2RwNlovNDdwQXVFS21pOUtRbEFEcmlhMDB4WHRQ?=
 =?utf-8?B?djZXRXpxelRabFZpYUIyZDdWL29vdjkzeVRBWDR3S0NiZG5XRlJJbUE3ZlNr?=
 =?utf-8?B?K1ZyMGN4Z3JoQXFxWUhzNjIrcHJUb21lTnZsNk1vay9mbG5HQ2ZZbCtBbGpQ?=
 =?utf-8?B?MHliS2paQldqcjF1UXgwbndqUzVDYXpZcmMzL3VXQTBPMUZGYlV2T3U3RWtK?=
 =?utf-8?B?T2lVV1dUaFdadThRekowK000c1k5ZUlUTkJzc0VxTmwzaEMrMFFQME8ySkll?=
 =?utf-8?B?N1NiVTZPcldWbmYwZlhQZ2RIM05ySlNsZGNjdnZnclpOMlI3Y0lQblNJdDVR?=
 =?utf-8?B?TDRyem1nRUM0NDFMckFqWWZ2cmpqcE1IbG9Ib0RpNFBWWWZLK0haSjVQaEdU?=
 =?utf-8?B?VUY1R1h5NmFDNklOUFc1eEdyam1lVWRpV293ckVhOEt2ZElheit2K0Q2QjFx?=
 =?utf-8?B?TnFneHhmNVYzZXlPa0dBNlpwdDczSTZlZExwVzkyVEVsbElHZ1BITHZ2akxv?=
 =?utf-8?B?UGhOcnpRZmNYOG4rcUlmU0M0cWhlYnY1eWlicWNGcVI1TGFmN3YvTkxHWWFS?=
 =?utf-8?B?M1hRQ0YzZURZcFd1VlFvUklNQWI4Vzh6bTZmNkFTek5BTTBXa2RQd0VidG4z?=
 =?utf-8?B?VU1VRUlBY2sxOW80TWdzazJOZlhSLzNWYWVLaldDajdPYm5tSDl0b3U3T08w?=
 =?utf-8?B?VG9zZUZudWVzZ2dobWFQa1ZuOGlIYU9WeU5RNGpSc013UHl5UGwzR3NjdHMw?=
 =?utf-8?B?cmlQS0RUS2J3VlpVTERhRk9YS0dVOWxxRk5XOThOckIrYkVSTXJXKy90KzhI?=
 =?utf-8?B?NEVqenNQcFFkSU8rZ0RHTndtOW9ISmlPS1JkRmtqNHlWQW0vUmY5dUVpWHB2?=
 =?utf-8?B?bmhXN3lEZHUzc3hobStHRFowai9Ic29adm84RG9ncGI4OXpqK0FuMXFvUElz?=
 =?utf-8?B?UlIwbTVtcVI3dnJ3anpXUDVMQi9LTElCOXJrMVhCMmhwTG5lbXdYVzZaOWVX?=
 =?utf-8?B?UHl6cFNmZFdkQzJCTnh6NzVGRkxNM09wb3hRRXRFVWpJcFhIbE9wUkdOa09x?=
 =?utf-8?B?TjJva09ZcjlXb2F3eTUyaW9qSEladkpTYjRLUTM2OEhkNnM0Vm5DYmJ6WFFr?=
 =?utf-8?B?NjBSU1ZFSUZwL000V1hya3R1bjFGKzhBRnNib1pZbE1wWU1VRWoyQjZvVFFr?=
 =?utf-8?B?Z2ZPV1pBVnZLa3cyZGVrS3ZybzVnQlpXdEhkMzJPN2pzQmIyL09kbEJHci9Y?=
 =?utf-8?B?L2ZVY1MvSHpPalFOMkdiMFROVTVNN3RGcXVObXpIaXZRUzF3aWZBcHMvWmNt?=
 =?utf-8?B?TkJidlZxcGMyVFNyVFJaN3FENFRHYlJpWWowK0I3aHY3bEVVWjZjLzBicDYv?=
 =?utf-8?B?aHdnSDRkV3ZwejRDQU1zVDFmU3MvSFVRMmNybU11TXVGM3BVN3lOOFFvcGVx?=
 =?utf-8?Q?Zhk/gukFd3+F8i8caZVSKt3lW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b529a0a-323c-4d2f-81f1-08da76e03100
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 12:44:09.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exOYc4+Dao0ucNDc6Ib+UKayz0n6jSDrCPjziUTiqQ9HoO3EOUblIxMw8l+aYCCkkCGsKXRMAfPQwthsvnHsog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552

On 05.08.2022 14:42, Anthony PERARD wrote:
> On Mon, Aug 01, 2022 at 04:54:57PM +0200, Jan Beulich wrote:
>> a user was making us aware in a bug report that qemu's -soundhw command
>> line option is deprecated (and apparently going to be gone in the next
>> version), replaced by some form of -device. libxl_dm.c does not appear
>> to know of this yet, so I wonder if this isn't something that will want
>> addressing for 4.17 (and then likely also backporting). Clearly I don't
>> feel capable myself of making such an adjustment, first and foremost
>> since I have no clue how to know which variant a given qemu binary is
>> supporting.
> 
> Thanks for letting me know. I've started to work in it.
> 
> I've also found out that "-sdl" is going away.
> 
> As for figuring out which qemu binary is been used, so far that hasn't
> been needed for command line options, and it looks like it still not
> needed :-). (At least, I hope using -device instead -soundhw is going to
> work the same way.)

All the way back to pretty old qemu versions?

Jan

