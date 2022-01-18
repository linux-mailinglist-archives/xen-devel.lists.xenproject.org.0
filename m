Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5FB492775
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 14:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258516.445270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9orn-0002v1-Om; Tue, 18 Jan 2022 13:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258516.445270; Tue, 18 Jan 2022 13:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9orn-0002sY-Li; Tue, 18 Jan 2022 13:49:43 +0000
Received: by outflank-mailman (input) for mailman id 258516;
 Tue, 18 Jan 2022 13:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9orm-0002sS-2k
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 13:49:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bf63240-7865-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 14:49:41 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-bYOmFCpDO0y1pMdiJORhCw-1; Tue, 18 Jan 2022 14:49:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 13:49:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 13:49:38 +0000
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
X-Inumbo-ID: 7bf63240-7865-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642513780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OiSrMyvy11sETXxtcHBLqKvAV6wHG1/jA9t2YzsOriY=;
	b=KUIkP7bAPUo6K+ZynBoDhSQuw9kQp4jezfvLoA+SQGaw5WOWK2UJi4WrD1JTHCWM4OXWoq
	8oWPKSSGSEB5sj7jyYUlBNIBOxO3OoCXpnEvMIBsycrqcNudrq1/b7T0tfbeMX6jiIGr0E
	qiZ5Lp0pqc9hF+IzdXpHel0HcFbR5p8=
X-MC-Unique: bYOmFCpDO0y1pMdiJORhCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ec3l84c5El+qpJBOfWF6zHvSki3+tlJhaE2YiOzjcf4MyjNsSqWwLoHB0amEWC7uHJs+z+IH5sUQUnxjtLQpi/b9FjPGkJZ5f9UyuSqkNEj4RRrWPFk8G8SdqnhCdxQ93a38t8AnDMy5iWFwQhw+TKjJyPZjB6lYPhk9mCb4REew/SVXWkkNnQBrsYfjEpACqXgMLwTSxnR9Law9a2AMDHKrqeS6X0flogfK7TCkmFplXOPTDk6uGwlIZNcv2SDzyWa/LH97FKw5GgT07CAuB4SFPm08vsFyDEDaZ+v5l9Ezkdrc+BwgN80GIqK5YR5hHDuzcwvobaXIMhb/I3m64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiSrMyvy11sETXxtcHBLqKvAV6wHG1/jA9t2YzsOriY=;
 b=K7d88YkaLx53DWw82G+f/qcFYCVmktDtYLbFFgPCy2+/bxDu3ZGwrgXGXcviMa/kOJSbZfjcAo6KN3axlcRHZMx+SiltTIGOAKZPGk0SI0VuTwfI0XLAG18wv1BkDXom29IdIPTLXIuDeAmK+k+Tt3Wp6F5QZfJGYiTpX72306IRKaxnha2PI7LqIJ3ROYGMd97ZFBn4HeXlhUpHXzfuhPTJyJlER9T6laNHXNw1R26CcjHXngCbc9kYZ5Ds9ZxEcGWFasHroF7e4GrXvZSxqISkN4vY8VFSqwSUPW4Tk+PwP/GXBUGxEwvPWv2fE6w/x4zgB0ElrUo8MVl5zQOteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c947e8b1-7319-2c88-da05-3c0cc2d7822f@suse.com>
Date: Tue, 18 Jan 2022 14:49:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v8 27/47] build: grab common EFI source files in arch
 specific dir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-28-anthony.perard@citrix.com>
 <57f03aed-c260-1c80-c604-0223d4603b4a@suse.com> <YeafMh0du+5K8YDD@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YeafMh0du+5K8YDD@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc32b862-63b2-4a5b-4b1f-08d9da895eb3
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7151A4B5AFACC568AA34C181B3589@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xJQWSDRUTbK7l4S1zkeekxZk6OrxQVBFccpKpIpKEhQ4uW9dJpS6OOgmE1qghUxNor4XT2Jf4gXZ5Ypz5hNKXFZ2zshElQVD1xSfUaKDPMFsX0kQX/dmuo2L75s//APfa7N8GJq/vqfbaUFsXPZ+bHNqofviOkSi6f7CXoEz3R/e7FyiJgz5cl7yve6k+Fb3d3MSQTdW34uBweIDPMW7GR3qgz7DSAfd02R1jzHmKlRRtD0O80Y2cXkfWq1KmxsLnGPqVE1nhkGiGfJc5wIrz0VpRCu+cFt1+e1bon6/vTzdZAqwk6QVVoDqMDIDq2VYmBZ2pxPo2Mvqmbf0a343sQMFA2nh0IrveJTRFVGQp4Ay6f9RF06n4xwyzk7PuIi5g+rn6Py7gkC3eqA00pb4Cw8qBUdNrce/kIKWla4frFhWv/9q1oYoeeQZmYlhoXJGi3gQYpNnuu/Papwx4k4LLz9HzJHADxi1IvwSY2MSxlmpgVDUwA/7nWH7Kp7yZmTpVElJ9WJ+p2a2MJNazBj3JTuOO0mYn8SZHoIovEf/Woqfai20uN/Onxhu5yzvLacyE86RT7JWpx3KrOJvsYAjqREkbxDpENCZ+ajyacBUCQaqu9BsHb+Jno+3hGQEtrETt0nz58tg/ZdVD31aS2Le3DVasCE4Qne/pqt4kn9u/4pHcSNhIhGLweu2TZY8hEBOQuX8E2zFOuQdDXE3qS0buxvS+ssjiCWXCwEJ519o9CCZ9L+Q/xaM+VTDlq7COW+w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(53546011)(36756003)(5660300002)(66556008)(66946007)(31696002)(66476007)(2616005)(6916009)(4326008)(316002)(186003)(2906002)(38100700002)(6512007)(7416002)(31686004)(83380400001)(8936002)(54906003)(6506007)(8676002)(508600001)(6486002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzZRdDBzRVU3eFdkQlVBcWl5cWRoYzkxMzludVo5bmRHMm92enhUTGVBR1FL?=
 =?utf-8?B?VTFpMlc5emQvYzBXREFIN2k4WnlYY1FRQlgxaUhwRWNQNCtxdjFhdmd6bmk5?=
 =?utf-8?B?bWY1SnJzM1ZkTUQzQS9kNTlmM3NiSzJNeS9VMUhNWjlMcWh6RHNXV1NxSG51?=
 =?utf-8?B?N1JCYWwzL2NFQklOcDl3TGVVNG1QbWRTK1pCNjliM0YzSGhNZVFwVFBTbG5u?=
 =?utf-8?B?V2pxWEhCTUhLaXJPYXB4dlJ4bE1CWW5lNldEUmw0NE5LMllQZEhXcVQxU2hJ?=
 =?utf-8?B?QkFlanBwMUpycElhMk1Qck45Nkl0WFZDYmJPazNnNXFYTmU2dFlDUi9Sc0VY?=
 =?utf-8?B?ZWtmdUUwd1Q4cHo4clJBSzZLRGdJbWc2REFsREp3YnNkcmw2TE9SQ01pcFJU?=
 =?utf-8?B?Ri9zMW5FdStOKy9TbVhoOUlDeW9aZys3aC9vQjNlRE9IUFdKQ2pYUTc4cUF4?=
 =?utf-8?B?M0hsSlp4ZXBCQlFrSjNNdnYxNkFSSmhlNFJNelZJOUhzV3M2bzM2eHhyVDhj?=
 =?utf-8?B?MlJRL2pUdnVOTXZJTWRPSEVwczNYd0cyQStxRWF1OTNjczNPSDZBcTNuY3Q1?=
 =?utf-8?B?ak81cmt3TVl3LzYrYUUzeVhNRncveG9TNFJpQlh5ZkNicjFCTGc5YlVCV3ZD?=
 =?utf-8?B?V2FudkRpbDhWM2FFa2dLczJPVXlwRjVXbEd4YThSVlE5Zm9Vc0xsUWZFNTVJ?=
 =?utf-8?B?VVBCdi9KdEtwL2JDQm5iRElRT3RPZkROSUMzRGg1UnlBa2txZ0ZDbGlMdzcv?=
 =?utf-8?B?QVVsZ0ZubGZRVE9YbHBoaWNJQllMWktoYWNRQTZDZURtdElzSElqYnZvOGhx?=
 =?utf-8?B?UUNhc3NsbUFVUzd2Ym5ZOW1rYUR3MERlZjdvU3NEQTJMQnkzb1pmbzFOYVAz?=
 =?utf-8?B?OGZ1QThWY3FUb3FieWlZdWdaQ1lCWGtzemQ1aHgxbUR3UEFNRDlEOHBOYzdo?=
 =?utf-8?B?aUNVdS9hdHE0bzNjM0sxYlJjZlgrajVEdUVVRUFvNVhyeVpnbG9IbENOdXRU?=
 =?utf-8?B?NG5MWWJPb0pKK0x4citJaUxQRDlpKzgzaFRVaHJ4TFRMblVTN0pkZHU2TnF3?=
 =?utf-8?B?SkZHQVo2dVR6aTdTSXl1N2tYLzhGeGtnZk56RFEvaFVEcDV3dEp3VUhGaklo?=
 =?utf-8?B?L2FZWWJUZlJKWE9ZZ0d3TDlmRmJuMTBzajJ1a3NrTWpKeUFYS1I3aXNSN2pC?=
 =?utf-8?B?dDlqdlN4aUU5NVg5UlFQcktQRzQrZUNESGViNzJTUURpcXR6WTVoaG4zQUJS?=
 =?utf-8?B?RVZqN2FJUEJLZkhUS3ptZDN3SEU3b05qMkhTcVFGM0Y0LzFXOS9FWCtlaGtX?=
 =?utf-8?B?cHp0Q05MWjRQeFpLVHJ3V2VXYysyUHpUMkJNYlgvdWdDMVhIWVUySjhCaUJa?=
 =?utf-8?B?SlZhc0pUZGhsTmE0Tm5hVHdlYmlZN1NjZVpsYk15MkNYL211a2pWbnc0Qklv?=
 =?utf-8?B?MWMzZXpIa2QrdzZ4ZVF2RjhQL0ZIQzNWVVBFcE1pR0cxTW1YTUJaUndMVnJz?=
 =?utf-8?B?d3M3cVVpdzVWRUU2ekErbmFoRVNuc3NvSFVRMlFkY2xBSEdWUmVBUzlGSllP?=
 =?utf-8?B?emFUMDVEOHZ1TmltSUtkbmg5Q3Mxb1RtQ1RYVzhsbk5BTVcxd01GRDg2ZTBX?=
 =?utf-8?B?S2JLVFliQ3FaLytidWVxNGJCWWlGd2RWMEgxbC9sTThiQUVHOHVFWUNUYmpl?=
 =?utf-8?B?cHdWSVBJZENqY0dqaHVLRmhtTnhVRlBuWEZMdmRCKzRPc1RlU3BpeVVFTEIv?=
 =?utf-8?B?YzVDcWJiU2VjREdHWjltdG9EelVveGZpR3hidGJjZUFHWEt4UGNOODFXc3ZU?=
 =?utf-8?B?TGIwRkhha0k3eFVKeVJDOUU5WDhvN3ZQOWRxL3BObHJYcE53SEZ4SUVHOXJz?=
 =?utf-8?B?ZUNSZXNheGJaa1p6Z040RzBJbldTTFZsanV5VjA4RDFWR1l2Yld6Q2syTGxN?=
 =?utf-8?B?WUVzcXdieUZ1OU1HRDR4cGhRRElLdkIvOFc4SU1wZWNKcjE3M24yZ0g4Wjc1?=
 =?utf-8?B?KzhWVFlWZFNocjZlYTV0VVhHN1J0U211eDg3dUdZU3Boa0pOL1R5STNlT20w?=
 =?utf-8?B?bEx3TUczU1N0RVFzRWVpR1c2QVlneHJRRk83VHdoaWxMelQ4dGRLdE00QlY0?=
 =?utf-8?B?ZGlOODdtVkhTc2ROaW5rNktlU1ZjL1BwUzZRTTdtZGx0ZVRHSCtJaGJ6M09k?=
 =?utf-8?Q?Y9DTZ4MZj57WbDhcXh4E3PU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc32b862-63b2-4a5b-4b1f-08d9da895eb3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 13:49:38.5578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xy/2RMk83Xfnnm0BC+8seeUOsSPd00KXYqzJhQTvCch7eRhywnLX9Kn7WYVVGVS0fEYhS0rLhhMQb21DOfiNHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 18.01.2022 12:06, Anthony PERARD wrote:
> On Tue, Dec 21, 2021 at 02:53:49PM +0100, Jan Beulich wrote:
>> On 25.11.2021 14:39, Anthony PERARD wrote:
>>> Rather than preparing the efi source file, we will make the symbolic
>>> link as needed from the build location.
>>>
>>> The `ln` command is run every time to allow to update the link in case
>>> the source tree change location.
>>
>> Btw, since symlinks aren't being liked, would there be a way to make
>> things work using vpath?
> 
> No, that's not possible. With "vpath = /build/xen/common/efi", make
> would look at path "/build/xen/common/efi/arch/x86/efi/runtime.c" to
> build "arch/x86/efi/runtime.o".

But /build/xen/common/efi/arch/x86/efi/runtime.c doesn't exist (and
never will afaict), so wouldn't make go on finding the file elsewhere?

>>> +clean-files += $(patsubst %.o,%.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
>>
>> Nit: Please be consistent (at least within a single line) about blanks
>> following commas.
> 
> You mean to never put spaces after a comma because they are sometime
> significant? That's the only way I know how to be consistent.

When spaces are significant, they of course cannot be stripped. But here
they aren't (afaict), and hence

clean-files += $(patsubst %.o,%.c,$(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))

or

clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))

are the two consistent (in my eyes) forms.

Jan


