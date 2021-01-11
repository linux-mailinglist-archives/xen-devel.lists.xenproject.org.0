Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4F92F10D5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 12:09:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64779.114517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyv48-00037K-IP; Mon, 11 Jan 2021 11:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64779.114517; Mon, 11 Jan 2021 11:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyv48-00036v-F0; Mon, 11 Jan 2021 11:08:52 +0000
Received: by outflank-mailman (input) for mailman id 64779;
 Mon, 11 Jan 2021 11:08:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kyv46-00036X-Ti
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 11:08:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f17eb617-0926-4cf6-b66a-47e0533372ec;
 Mon, 11 Jan 2021 11:08:49 +0000 (UTC)
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
X-Inumbo-ID: f17eb617-0926-4cf6-b66a-47e0533372ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610363329;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VBlCmPSb9SLCfJbzEYb1L7r6U0Y8EXORYiw2NM5roCU=;
  b=QJMuFIxKHurzEr5+I4KDKO6h6z+jzeHT6Gb8MYDJXIkzrCldmNaopaA9
   zCSn5saGt7V+A9AW4CqHYwcp7Z+iXvNWW/O0QwJyhWb7GyRJ3BKMJvXqp
   USuzaA2KYb/9nNSCrIAenrJ2sYpriOtG43oach8MWGU6Ub5pMRt1bfiqV
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HLcvZl4+BxUoMTTuq0z7UqDF5q3M+HtW2hksAEyo6oOBW//QsN1nZMlrZ85E8ZrEd3KdJ6PMky
 x33QxNdwSTU9/qR03Tu5F9pGPN5EkZSByx4TCQpKY+2cGmisXU+r0zpcO2uABuvShtqIdOrLxP
 it0C+60gLX82+1uM8A9GyQYLlSpu2Mi6bQ3DCMX6Vr0MumURvYUJuANpkgGf/mId334f9svFPF
 mJjL65u6Lw+bU7/k0R4CXaxHdIvEYLiPTghxoyFBn+RVOW4W1a034SbmwnE/F9UPRmpTjDjqBS
 xIQ=
X-SBRS: 5.2
X-MesageID: 34804076
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34804076"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJrLgCXgBhyAZdxtZXaSh3Al4HuBf9JXXhl9ELEfQPHnAellNig07sRDiowBr6vmX3DSt+Au8p9QeZ016fGx0qqagXJPAn2R2CvBo8KjpUkojQsyr6+tZY9QR1PQK8RRvfMrbhd/WPTTYDI5hErQBckomCWmLojinrQ0cYoa50LGBpUTtHXZSUFFhLWJ8iBdO7UqsX3IUwLmAB74optawEq5pHJXlg9rbLcli8HOpeD9rUCaLf0h0vOM1SRMnyp49AULUMK1/NgvrdQgdZPcki/14k/cwxFnhab6fJzkUtPzOWcegvW901hqmm3u7q3ZW6aZBchPPVbwOEsDcBP2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBlCmPSb9SLCfJbzEYb1L7r6U0Y8EXORYiw2NM5roCU=;
 b=B7LETVRJ30GfdmlGUu0pdR9fO7FnY3DPrIBhyo5FbV6a1ZYYp25UL60wl3P7MLUl9YN5hasgDhpDeuNzmTLTA1SCCwcu/ygNvA/rfaastoR9yBX5PD3D7qdo1cSQrJWHlnkU+ayVXtcw9vMuunOZkXTLig5zMCtgZREQriYlTD+jnNxq5ZfLXb/Sn8qIwNBZcgeH5AR/tYhWLXJ4TII+tkBbqANLKmDNFJLJLPzG4y81qPim0wdlEjzbpuhYqrjQdZMVdruJJzCTyAWp8/kHX1e/vVsA3J7FlRQjVFGYPl7M3WpcKEV6ouMF69jNNzHZn3RzCUC6XAYBkAfZZceIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBlCmPSb9SLCfJbzEYb1L7r6U0Y8EXORYiw2NM5roCU=;
 b=H1R1iofwS9bH1zyxJpx8DHbFrkLk9poUCdCkVpMlnK336hRTDqYtYROSlCdf7rsoGrtdDNLLFCCmEVk3yxcw25CjFgVu7Rch/6wZjkDz3F3Q52BXKM5KJ6Jnt5Rl3ZdmSJFO8HCDtQa48rHBs6gOfG3iDHxkYdc4Mvspc/Uji3A=
Date: Mon, 11 Jan 2021 12:08:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH 3/5] x86/PV: _PAGE_RW changes may take fast path of
 mod_l[234]_entry()
Message-ID: <20210111110841.timv43eteslr54xz@Air-de-Roger>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <11633161-6809-db0c-44e6-e5f383f4ebd2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <11633161-6809-db0c-44e6-e5f383f4ebd2@suse.com>
X-ClientProxiedBy: LO2P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 995ee79e-0b09-42aa-a355-08d8b621444d
X-MS-TrafficTypeDiagnostic: DM6PR03MB5178:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB51780BB7084CC61B39A8BF2B8FAB0@DM6PR03MB5178.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G89ELdGWT2+hwepMooxKicUMOAVrDopRQFClnWNcBMYGH6c5fgKqgCVzkSTT+gIxZ5QW1qcgJc1F/1tYX0CkXSh/AV+5V6Yj3uA6lJ7J7Kgt02BzaLWVsOPTx6I/3kuFh6IvDt/gzcp47OhYmDdbB1hFQXo/3vl2vkaH+qlvJjKLEkbBpnkghz4w8HcbxAb5LEyKxrphFZblbv99p5mHk1NTtEIjyxoeU6Q9Cn2cjH3rxfI8spHe7mQkbpCpX0HqPewZ0K0L+1KwUK9cJBR1jqKke2LDPbuLY1F2qqNd4cF00k72nLklV2wvNY3OiWXxCRUDFYcgu4MZu2c8+EVWsOXkd6GEpmn8CHkZ7ux6nMVM+91OqCJqrKOaIV5ysVq+7M7r7qLeU6IavUiBsEw3nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(66476007)(66556008)(66946007)(54906003)(8936002)(4326008)(956004)(6486002)(6916009)(85182001)(1076003)(107886003)(5660300002)(8676002)(6666004)(6496006)(33716001)(26005)(9686003)(316002)(2906002)(186003)(478600001)(86362001)(16526019)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFkzcG1jNWY0eE82WWlHanhKL3B0L2x3WGR0QkwweGI5a3NtL3dNd3lteE45?=
 =?utf-8?B?WGxtWHhxQkN3cCtJdksrTUxSWFdFK0hSZGJobWI0aTFJUzhsY2NhSGY1V0VO?=
 =?utf-8?B?ZmN2NXRYdHJsU3ZtUzIzVkNhWlB4RCtqdm1yRjNIYjFDY3lCWTVJY2NVd1d4?=
 =?utf-8?B?VTNvWW9PWTR3TkNld0NrQnExUVpNSVFiSVRNTllyMmcxQWFmTHkrekRzUXgx?=
 =?utf-8?B?L3NiQ0w3SDRFV3liWWFYcXdyVlFkZ0lqbUh1cEFvNzJzbUVUcnJBVDMrNUMz?=
 =?utf-8?B?N0RScDVSTmpFQjNwTVFGQnF0eXdjVE5Dc0JSQWFTM0JlWi93a3BsZzEva1Ev?=
 =?utf-8?B?RytUcjFjUEhyNkxLVi96OEUxZUxsS2tBdkE1MG1aUTd1aGlEWWk3SWRJMWVj?=
 =?utf-8?B?YVBCUHdWNW5RTndqOGN1M0RlU3FNa3VJa2pCMGQ2MWRKVDlEQ2VZWGF3QnJ3?=
 =?utf-8?B?M2lKbkU3N08rQVp1NWZNcW4wWWpwa25jRURtUlg4aVFUcVNucHc3M2FCNXRp?=
 =?utf-8?B?RlBadlcwRFVVSFc0MDZEME9PRWcwU3hQU1ZBODZLYjBYTVV1eEI1azZvaTRm?=
 =?utf-8?B?bkZPU2ZjaHBIOUdpQ2Y4ZjF0eXFyT3JPQnNuaWszOU1OUjNGdU0rN1V4U1pI?=
 =?utf-8?B?Q3c3NVRnbDRWYmFvRlJRTEl4MkVRbFNVb2k5M3FiS1kxV3JlZzM4VWJ2dnBK?=
 =?utf-8?B?MlB3RVZBcTM2dDdUTmEwaHpHWDlVNEp0UnNPNzdRVTZMZzl1N3BqRlhWcnM4?=
 =?utf-8?B?bXJ5R3dibFk1VGJzSmNUeTVHNzZNekNZbkdwV2NWd1VqUktNeWpXeENBNXBL?=
 =?utf-8?B?SFNTQlVGMG1yRm5wYWRCejJaNXd2MVM1UHgrdzEwakZySTRFYWg1WFFiRVhL?=
 =?utf-8?B?RnhOTGFkU00vTGJBY1JrRTdKWTVtQ3hLQVZnZkVCZUk3aXQ0MEtuSmJ4Umpi?=
 =?utf-8?B?Ymx5S2d0dXRDY0JNU3BETTd5MDB6ek80ckJjM2VqOVo3azhSS25mVTVkWThS?=
 =?utf-8?B?N0hWTXRMVmp5Sm5JN0lMYTRlYm1TZXdNM1c1b2xUVVBhK1hsNmx1NGVKRkdu?=
 =?utf-8?B?UTRyNlVrUlBzT3RjNTErNzlMVjkraWYveWRkblR2NlFGMy9rUGFtbi9WbUxF?=
 =?utf-8?B?MUVaVEF4RTZMMVNUK1Y2dEhla1FESzNzd0RzTVU0dEJYOG9VSzhsQXNpdmJV?=
 =?utf-8?B?cyt6dlhjL1A0YlBjMHVVb2tPa0h5U21CaU1KY2k4akMrS2xNTHVIRWVBVnlr?=
 =?utf-8?B?WFdkSjBrakJkU0d0TDQvaVNNYU5MYmdoQ3c1cFRzcEJWS2ZIa1Bjd0NUV0FN?=
 =?utf-8?Q?65hRE4WpQoDgWlN67EW87nKmrN8gVDZ0re?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 11:08:46.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 995ee79e-0b09-42aa-a355-08d8b621444d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WK7rJUvNCbRTgi//KyRv3BSEyfltvPEXqhUFjD6eWKyFagPnxFClTI4TGAzwGCS7DIdFa576HaidQ1d7jQfsdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5178
X-OriginatorOrg: citrix.com

On Tue, Nov 03, 2020 at 11:57:10AM +0100, Jan Beulich wrote:
> The only time _PAGE_RW matters when validating an L2 or higher entry is
> when a linear page table is tried to be installed. Therefore when we
> disallow such at build time, we can allow _PAGE_RW changes to take the
> fast paths there.

I think it would be helpful to note why PDEs with linear page tables
aren't allowed to have the RW bit set, likely here and in the comment
below.

Thanks, Roger.

