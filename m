Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113D6F4203
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528482.821687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptncK-0005Dx-IU; Tue, 02 May 2023 10:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528482.821687; Tue, 02 May 2023 10:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptncK-0005BU-Fm; Tue, 02 May 2023 10:52:20 +0000
Received: by outflank-mailman (input) for mailman id 528482;
 Tue, 02 May 2023 10:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptncI-0005BO-Jw
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:52:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6668088a-e8d7-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 12:52:16 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 06:52:11 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6676.namprd03.prod.outlook.com (2603:10b6:a03:389::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 10:52:05 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 10:52:05 +0000
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
X-Inumbo-ID: 6668088a-e8d7-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683024736;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4PSVT+SYB3WvHqSTfjEJyPbxogo5VSUdqRfe+uzsLCM=;
  b=KGEH9hKl9oN2ljeyjPtHDWlJ001/4ZH4Icb1LwddPJUQ76xBDnWZa6H3
   7bpSIAWfRsrDBq2XntsWGIXCCdrSUfzcQIXQkjT+6ZbYO6gOVihdpApNS
   Al3OOggeAyT7O9AjMw5hiaFRSrAqLJ40viuPNXAKLCZ/C//yUdd0PbB8o
   g=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 106315749
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+0GAsKJQRSMe+wXlFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENSgmdUx
 2cYWW+EOv6LNmWnKopyOt6z808G6MSAm4NmHFdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pO2tE0
 9ZBIQo3c0+qrcuE5rW5Ss9j05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02LSWwHynCer+EpWq3K42klGo21ApViA6DGSDr8KLiEeHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHaSpaSwIAuoHnuNtq1kmJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:GHNFDa6fsrOPXBzd/wPXwNvXdLJyesId70hD6qkRc203TiX2ra
 qTdZgguCMc6wxwZJhDo7690cC7KBu2yXcS2+Us1NyZPTUO1lHGEGmnhrGSpgEJ3EbFh4xg6Z
 s=
X-Talos-CUID: =?us-ascii?q?9a23=3Ac867h2rh5L38Ob1FC6CP8UfmUZ4feHf75i7ZGXW?=
 =?us-ascii?q?lVk9DYY+zTl2Q3qwxxg=3D=3D?=
X-Talos-MUID: 9a23:/g6ytgnkWTDajYaGeabWdnpwHpc08aiVFXw3z6gq4va8OxdCOT6k2WE=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106315749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm4isgJGn7SLOuiPepVD+Pu7uF+Tx0/YFG3RJUEOajKfq7zqH1ERJag3JJNNu5X/u6XfR+T90fnm2Vij7r9sc6DdZq8xB89dm4dnATbAnVF7QMymPbE99yPRixV34/jdeK0yj7igy0Rqz/oPylH4TN6v6rpIrMf1Bd6UvPS2T5KlrFj2Oyk4Y28HjE+17QUEu1yBcDA4dBHNh72FMuhPHRcHtr7dRoFM0BRnpnkNraxVU6X0O/c++bV+42k345Gkxst2tu6YyxeQg5HSdt8K3bpShqMaAlawEL/VOxdTmHAGoj4hV7i9mqCvY/tnyMQH4FVCaLmjo4XOeOb3w+UsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePrgMFJN8aSP6o4ya3j7L9UOUOtT16JJ5FwlOhlpZ7c=;
 b=OZzBgj/2IdZ5jMNftSBn896BZPXYYHwnz0GPYv78lPgXaI0MEud+uloeeCZIoAn+HJF/W+Dzkr+lwEk+axtpcHd++KAcyHMbyCw3+LYWeRKrrcPpF1Jnp8ZR51KcoPGFAFpiabwI7lOXpAzC+4IrAXKCbyNr7zvoJcCxU3PzWVcijpjAyToQawfpeKi1RduIyBHTLlfmaiyRGxJr3QiRJ0ts/oFnzCaGaHKiu3429Qumn0X8TGcFLKJyi4fewfzvubPGx1iatJYklo1Kp+moRSkBqbKtd1A4leVN2PPEpW+ONTNvAKoC/0sHjZjx3TA946uuFCn5MZfVLqfZ4xn3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePrgMFJN8aSP6o4ya3j7L9UOUOtT16JJ5FwlOhlpZ7c=;
 b=XXWKILhA08oEh6kjSOXYm+sH91R8wevzZeCC3FMVcJuL1DUg8VtY2LexRFCR6/sKFC7N5dcgjRhi4U84Z2T4yoybl9GSbg2j0G5PKMq4w2wDzGiQc6LbyxHsFzgPyw2JbHci/9F1+N+JZG/Pn0OVzJ4Xq0w0NxOE5hnOz5oIUU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 12:51:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Message-ID: <ZFDrT87RixpOmMfq@Air-de-Roger>
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
 <068ad06b-d766-4fc7-6bbc-289911441ee7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <068ad06b-d766-4fc7-6bbc-289911441ee7@suse.com>
X-ClientProxiedBy: LO4P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: bba8bd7b-d584-4003-923b-08db4afb446b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	13pHst1EH1OjcsZp/+sAEMqmBrJ5pHGX2QnulS+q/3HOQyBdWSJW/etozAXvt7g++Fv6EuuTUMEVCMdKjSN1mAK7kHIFXSg+ngtqEQSWUcDVFqEJKs+AxS8UGMY15q3t9vXP2KY+g2x8KVCjDDfcg8viZJRaSjRAFf7e+88BfBZlYpP5fnJsGoU0Z25Tp8DTBpUlo1eVKn0WyVndzYMn10j6Db9idx6OWa6NM2ab2/IczHtuTLy5RbZwXqkG/JW49hXS/jjwEa36n2JSkYMSKW9K0S8yX3a9f01ZnchSWMegDIGJPynoxFFZkxXfucMjTROhYa2wwb3Z0WLdf8OxBnsG3VAqyqwGmtUHtex+auRxL7TptD5FGpnL6kE1FqnFCMXqy68k/NPTUPybrk6e9aLyZKe2hVW92a8iIktgwB8PC54omjYg7bf2iEZa4rCUswmtml/rPEEmyeH8DRazWJt8AulwAWAW+sbITDq0gaNe3wbmG+LxgY9sWU5W+E+WAmrQCRPo4a9T8idIripgMAM9SZt2HMWRtUI7S3iDuGI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(54906003)(966005)(86362001)(82960400001)(6666004)(38100700002)(478600001)(6486002)(83380400001)(5660300002)(2906002)(4326008)(6506007)(66476007)(66946007)(53546011)(6916009)(66556008)(85182001)(8936002)(8676002)(41300700001)(33716001)(26005)(9686003)(6512007)(316002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWVBYzNoSE1ybzZiNXNjcmc5WitGQ0lEZjBYUFNubUwwMVJoWlduWWVUZW5P?=
 =?utf-8?B?a0dzMXk2UlV4OEFSakQzQVBCTEJMRGxNN0lZb2hrVUkrMURUZ0ZJSEdCLy9q?=
 =?utf-8?B?YVJPSFNpdkFsVU85ZXptRjFlOGZMVFpvb2kzbllEclhabTZRK1pnYzl2NlVt?=
 =?utf-8?B?UzlFZXJWcjdvdm92eXJ3YnhlcGErZk1lQnBYNzJMOUY1Z1VXTzJLaDBtL3cz?=
 =?utf-8?B?YkhnTTM2NHhpK0pQc1N4Y3pRUUZJWklVUkJYS1REVFBxenR5a1phVC84TnNr?=
 =?utf-8?B?a3RtT3hYY3VESmhCMG0zWVQ4NXlsQVEwUlU0M3U2MHJ4b0JGOEV4UGdRTlVl?=
 =?utf-8?B?TzBLQXludHZ3RmRjamQrbi8rYzJrc3NCWjArMTlhRFpuQWNhdHErcTJUMW14?=
 =?utf-8?B?N0hid2d2M2tlbE55WWloYUtjbnlGQi9OWEpCQ3ZqUXZJdzRkcHZrOE1NK0VD?=
 =?utf-8?B?bkZhcUhjWXNsUlBCT084VzRMVXFmbmwvVnhjb3JxSmdJYnhqWmJ3eWg2NVlI?=
 =?utf-8?B?WWJKSkswZXNMUUVGZXhtenFLcG42djZZdVUwaXJBSXNiVzlwWU41VmJpbzJK?=
 =?utf-8?B?OVdVczZtUDdRYWgwMDJ0TGkrMHN2TW1HVlNmMlc3Z3VkNjkxS056ZnpnRnh4?=
 =?utf-8?B?Y2tOM0lLaDVQeFNvYWNSRS9CYUIySnVZbUpDenpHbzVNbUZKUVdnMWljVjdy?=
 =?utf-8?B?aWhQUUE0V2tZT3BMTW5XNzVkRkZMMDRvYStSQ1NCRGhLQWU5aHY1L2FvODRZ?=
 =?utf-8?B?amxnS1J2UDVOT1lNV3RXZTlEY0xTeC9TZ0JCbVlXVlNUUmxTOVFnUEw4Wmxk?=
 =?utf-8?B?WU95STAxU0xvTTJnT0dnSnVrdlR3NUlKbjdCNEJNK1V2NVpsYWJzdjNWUW1v?=
 =?utf-8?B?R2pRNElKSk00L1pJNDlYejY2UzVzeXNBWCswRXBtTk9haDZIWUdJWW1hUHRS?=
 =?utf-8?B?Rjd3TnFNS3NwcHg5VFRUaWtST1liVWoyZllZanJlZ0wxdmd6WkNzeEJwcWRr?=
 =?utf-8?B?aUp6VENoRnYrYnJzeEpXUGxlMHBGaUJURUhjTGdjOEp6M1JSUkNSSnlwNHlS?=
 =?utf-8?B?akVsQnF2Z2hGM0dYMXoranRYOGZpSW85OFE2SEpFNVptSTFxRTlxMG1LclRM?=
 =?utf-8?B?OU5zYm84TnBPdFlWNFpNK3BZK2thUVRHNGlQaGhUUTN0eG1XQnBKQ090ZVpW?=
 =?utf-8?B?ZUVuMEd5Zll2cVJnOXIvd1FGaHFtNHlEbjlHdjJHRzhBNzJXZGJmNFZZWnhL?=
 =?utf-8?B?QkNPRjZqVTFUK1VHMlFJOHo4YTlSS1FDMm05a2xPeUpNRWgwWTAzMzdvYWlW?=
 =?utf-8?B?azcvc3Z2VUVZd2YrMGlDS1ZXWXgyRzJSeUVqa09ZbzdvVkQwWTFSbGtwRXd2?=
 =?utf-8?B?ZEZGN3FLVVRGSWQzbkZjTDh6SGdQOVJpYkVKSnhvNTZ0RExLRzNzOGNEVXM3?=
 =?utf-8?B?dXd4ZjRaMEJHR2tiMG1wU0hVQTdBa3ZsclZ3Z2Jkd21NTFI5ZjVVdHF2Y1Ey?=
 =?utf-8?B?YkxWcDcyVDNUci9CSHoyRExMam8rV2d0MWhIbEJaMElMMi9NWFh0Z0ZDeHBh?=
 =?utf-8?B?SUNnc0FISktZa2JrRkR5c0FSWWFVMFg5MU9VcDRSS0VSSnBPelg2TWVGT1Qx?=
 =?utf-8?B?d080TkVGWWZTVlpGZzRLQ2MrdjVTWFNiWDhaSDZkTHJRa0ZMcVJGMTBydkVN?=
 =?utf-8?B?OHNyNlJJUk01UEhvem91K1lsb1pJMTRJWjFEbkZ3TCtvV0d5WmxmcVUzcnRE?=
 =?utf-8?B?Wmw2cmN3YnBGL1VkWFZoM2ZCVVFHdHdIV1QwZ2RsbjdtT0NESEI5VjRYbHFQ?=
 =?utf-8?B?elR5bGNwRTF0YUoyZnRiOGRseFg5Z3orYUVXeGh5L204M2k2clFKcUY1TVFC?=
 =?utf-8?B?MVVYNldpcnBtMjV0VzFvNDhrZUpFQnh2eC85dG5iMFlVYlJ5Qlo5dW11ckNX?=
 =?utf-8?B?SlRiWFdGamxlNlN2TzA1Y0t5NmpYTFREOWlPMkkzcUhETmp1TTZRVlRqZ0Ry?=
 =?utf-8?B?TTcrSUg4SWZWcHl2cmsyYitENnZjakdpL3NSMmlSZkx5a050WlZScE9TQ1Vo?=
 =?utf-8?B?K2pGeXpMbzRjcmM0Mkt2U2ptUnJXUkkzSXYxMmFTMDM4b0V0dDRIRlRiZzha?=
 =?utf-8?B?VTFIY2NvUmRUb2FtYnhOY0ZNRGl3Nk1TTUNwcTdoa09yUmRicDA1aTBCc0FY?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BPfUGrpojLIkoI3e9kxazPZ8K73zyStr1w+cu1OwUV8MEorrkbRiNME9ONp1wtTK7+lbCaRvvq/0NexneFsr2rWb0SqwZclf6iw8V00RtTGASjoBwklEbMvmfS+szzQPOQCGftzHZ+NxCWB9v4HP1Y+Dehshn9R/u8SQb4bR3Juea1FTLK731K+mRtdteuGQo3JlqlG371COpJ/2vraXAzDRiy5dYrdd5Q4bPMs2XIhCAzordzx9XxQE/iYFa86CmN9ndratvUcChCgvIckiW8VLk742bNF+HdRXvN90PcuDbQh96I4K8ZeAn+B/KTikqesdl69gXdRh6joHIXhG7/XhkEJoLpvUF5ZLv8A2FVx+R8EX2iuIvu8KTak2Zm87NmOMCgAtHxW65q08BmdB9H+9jgN8H3vy2xu+T5bxhj7rS+dEUz+sB0qRkGfQIf3s60e/Yx5jOt54p7E0faOm0WzRXE+y02G2we4UQIIS8sLQAP/pzNcB4lZhqU5HaxPXcyGVpqWYuZbvyyZHRFhM28k8vgflP1Ra+d2XnYUMXdWN+TOMZaAe40ygcjtRCPHMhRaY92ssmKHl6tJbNPUrJh/qOSNBu20S9Kn19htYC285EO52gTr8JBEgr6N3g070Yt15vnHzqTxi2u5MSUeVZxsGYoEPfq8H4aP5cl0Fx+GlACjTd+hGHhw5CjmNOMUMWMPa4fxtcCRn/M0W27jjYI02sPNeApRDwhR5WK3ctt783BMpYvlVWZvBS0ZIB1YBCVaM48klQRUsZPxFsZqDkslIsh/mRqT+LLZ9DFgufqz6B171/436ZLYDuQJD9DiT
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba8bd7b-d584-4003-923b-08db4afb446b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:52:05.0835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2NHiZKPlk+/n/q8wHUvjMvW+bOG2V4rt/B8Y+0WtLmYSIghxYlTTbIARXQQYUqIbxAnOFtAN2TC5ZfOjKp3qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6676

On Tue, May 02, 2023 at 12:28:55PM +0200, Jan Beulich wrote:
> On 02.05.2023 11:54, Andrew Cooper wrote:
> > On 02/05/2023 10:22 am, Roger Pau Monne wrote:
> >> Ensure that the base address is 2M aligned, or else the page table
> >> entries created would be corrupt as reserved bits on the PDE end up
> >> set.
> >>
> >> We have found a broken firmware where the loader would end up loading
> >> Xen at a non 2M aligned region, and that caused a very difficult to
> >> debug triple fault.
> > 
> > It's probably worth saying that in this case, the OEM has fixed their
> > firmware.
> 
> I'm curious: What firmware loads Xen directly? I thought there was
> always a boot loader involved (except for xen.efi of course).

This was a result of a bug in firmware plus a bug in grub, there's
also one pending change for grub, see:

https://lists.gnu.org/archive/html/grub-devel/2023-04/msg00157.html

The firmware would return error for some calls to Boot Services
allocate_pages method, and that triggered a bug in grub that resulted
in the memory allocated for Xen not being aligned as requested.

> I'm further a little puzzled by this talking about alignment and not
> xen.efi: xen.gz only specifies alignment for MB2 afaik. For MB1 all
> it does specify is the physical address (2Mb) that it wants to be
> loaded at. So maybe MB2 wants mentioning here as well, for clarity?

"We have found a broken firmware where grub2 would end up loading Xen
at a non 2M aligned region when using the multiboot2 protocol, and
that caused a very difficult to debug triple fault."

Would that be better?

> >> @@ -670,6 +674,11 @@ trampoline_setup:
> >>          cmp     %edi, %eax
> >>          jb      1b
> >>  
> >> +        /* Check that the image base is aligned. */
> >> +        lea     sym_esi(_start), %eax
> >> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
> >> +        jnz     not_aligned
> > 
> > You just want to check the value in %esi, which is the base of the Xen
> > image.  Something like:
> > 
> > mov %esi, %eax
> > and ...
> > jnz
> 
> Or yet more simply "test $..., %esi" and then "jnz ..."?

As replied to Andrew, I would rather keep this inline with the address
used to build the PDE, which is sym_esi(_start).

Thanks, Roger.

