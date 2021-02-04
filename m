Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C682330F13B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81234.149722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cFD-0008Fk-Ct; Thu, 04 Feb 2021 10:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81234.149722; Thu, 04 Feb 2021 10:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cFD-0008F6-8i; Thu, 04 Feb 2021 10:52:15 +0000
Received: by outflank-mailman (input) for mailman id 81234;
 Thu, 04 Feb 2021 10:52:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YP8j=HG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7cFC-0008D3-0d
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:52:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f234c34-35ff-43f9-b728-5a7041002549;
 Thu, 04 Feb 2021 10:52:09 +0000 (UTC)
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
X-Inumbo-ID: 8f234c34-35ff-43f9-b728-5a7041002549
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612435928;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MzmZrAMfkbYy4W7zpiJIU0kfPNi4k3Ju0XZaa/31kxA=;
  b=WJOAa+HeSqsn2Un38YxCP8VtqQTrX7vOisQlq/MVrE1UPzeuyBSlMmNg
   ocPLAunLFZyYh47M1piu1mRu7FKl2ijkk0ZdhJ5tFLvmZEqthnW0jphHl
   mjfJvstCT61yhm268xdXFyhtGy0TrTALiPfLbfGro9ThQ1obbRlpQD8Cp
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uGbG+UD3iC1EjAthPx4SyCsupm7DUPuE5ErymwozDtPnVQH78fs+PfnHctzgP923I+0R+KglIg
 CSw07nBHeECfoRB7tt1weszsJ/XLqTJsp9sLQON4+wG/otkYDpVS5lXSh3mnsrhbSDy6+0TlAl
 eRqC/HBCQCuEeW4VdeaVSwiKENKyUzbdh2n1to97I9dBvsVemuStphP+VDph+g0c7/CXo2aJgx
 au0rMrPv1f4aRRU7dfkemBrC9Tvn26fn7J7PwCe2L+R22So9J3Q2lm+4SKpVSd242WHjPvAyqm
 3Bc=
X-SBRS: 5.2
X-MesageID: 36491184
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36491184"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuVYnd0xGlSTeNOzRv0yP7vNFCyzmtASTsnai/c72CG1TS9tt8J0eob26ZmX/f1FFtZLPlhfvjqa/clJ8PI5kXWOciGTv13HP/ITpBpsscHevfaWP/YpbZB39wVCoZq9YO8yBnDSvRBxTSxV6sImvoEjmz422NduXA+oSrnqzOiqRDqTFflwUz8MHGJhb3SGtIZNvDVfvJwkLhvQxvsQMm5hXjAt5ljdl/HGJgugRNfqX1phD5xTTYKVsU6JpkfFLAfp+bEerhbCmSvcKqJqJEpOjV6j9s94esGWQ3EdH400xI7b7X9HnDUNUusG8wlz0uNcItTtvwitwxhzSMFpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lQajqzjCmtn8XyU9LT08gno0mI6BAEgeE81ME2gqHk=;
 b=KxbmU2XXJelCcPnV0DjitRKVBj5/ecqBoyuW4A0T36seaG2ppiTVfIQ5VQdH+v8RI3GflSZSbHU7D7dBRubynr/wXpCAZOnKEHDyy2VZcc8TsATjQnBCDQRM9jXKscSNA7M5d7eIPm4m3C8xkkHraFQG4qO2tCA5ZvEEMwj4gRzq6fVd8kHIctqOVRHmwWkbXyajpsXEt/3UF8cNDJXj8AloXycLOOdW1eLa2yMTbirof04owA73MZvyDynB86ATx7ePA+HiG6rziuq6MaQ/D7Zjhcay/rGRbEPoxD1KPWw8a29qrhK5i95SKB9bbU482K8SwJPTl7N/U8OTLuXlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lQajqzjCmtn8XyU9LT08gno0mI6BAEgeE81ME2gqHk=;
 b=eumw2NIV6uWp3cEOlm1pwQBxtY+c5ptnRdMwDiNFGh5ZUmVv+vSl7cLca1jaoCeaa+oVSNh/r6zjanSnrwJsoh2Zg99AZyeyiAOeT9yggXBZjZjgl3ye1o5wIlDij5KdrHsnjuGxXdx8vOjSm99zQqxaB6+qLm1CVJil8CxJG9c=
Date: Thu, 4 Feb 2021 11:51:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Ian
 Jackson" <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] x86/efi: enable MS ABI attribute on clang
Message-ID: <YBvRxYyWPMYBvGNr@Air-de-Roger>
References: <20210203175805.86465-1-roger.pau@citrix.com>
 <a9d5f126-0b7c-6a8b-7ce9-736716e6e950@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9d5f126-0b7c-6a8b-7ce9-736716e6e950@suse.com>
X-ClientProxiedBy: MR2P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 421a66a2-190a-4113-b73a-08d8c8fae2fe
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057AC4CFF3F155D75B864F08FB39@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3IBdN7Ap/rXWijWgIHQccvIXAPzRJc2ZVb8zd477b/BuOELwCSoO1mhBnRpppFQkG/8ehEMvEvCgr4E/GDsRSWxqejV6rc0RPhPda2KjH9NpFYbhzLlLB6Jx1aJO+jBrr/cbCclt2qk2hpZIBy878fkV5DMNFS4WcDfI7QJnZPOgOTkmmDQVjzLgIfWPwiCB2q+t23xsNnrgd8U+6DYoJlEKTomIueQrvMcTFcfoaTDcDx2ZsvpMGdU0E7NlytVdUUxRz66ZN30un6qZsouHFL1mK2TcLg/vNmUP+hgI4k7i2KmNx8m4lJz8UqyPHkcqRfWTbXFa6e67Qkrx5JjYnlWAVFPFaYE9PavimumXHk/VU81tLcwuHQNa0TISygCmPZJr6D+eeuzpv7+hZNhqIg7b3XP6BStgcjeJMLg3bIydwkYMyTrwtzwdyYHBdHK7FytqhyNrltLyvJ+ILHtOEio2BHzKA36rnTkcjMp0xluSjoZUXIX7i0l5SLcmjSaGjol4NiWEQ+V2Ic0X7rk3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(396003)(346002)(136003)(376002)(16526019)(186003)(26005)(66946007)(6496006)(66556008)(5660300002)(54906003)(316002)(53546011)(33716001)(8676002)(2906002)(66476007)(4326008)(6916009)(6486002)(956004)(8936002)(85182001)(478600001)(6666004)(86362001)(9686003)(45080400002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NzdET2NmRm1BVUUrNm1zdnErcVZKQUp4b1lPRjZ6VmkvbWhsd1VNMWE2MWc0?=
 =?utf-8?B?V2NPMlhhOTlvWDlrc1dGNnJycC9ERjk4YlI5b3dTQmlWbW1iVGVuNldOUTR6?=
 =?utf-8?B?MVhSMmprRFdEZjV3M2Fnd2VPbXFxUGhEUC9WNkQxWitCcnZUSzVQUUNvc0Ez?=
 =?utf-8?B?eTNiOXErYUUraG8waCtKV29kdUdOZUhHc3B3ME5JTTkyU2NyT3NJUEtKYWtG?=
 =?utf-8?B?S1E0MUNMMldzZ1FmN01jSnMzSEFmS2JUNUd3TXpSWExPWUhoZFhZbUNpVEdB?=
 =?utf-8?B?QTVDRnZ6d0xyOU1yeWQrK2ZnY0x2ZjVGWVoyd0FvLzVIdER3UjU0ejdUSUsw?=
 =?utf-8?B?OHg2cmFZcnltbWNUM3ZUWUkyRFF5VDJtTWhaNVprejY4enlibklnK3pEa3or?=
 =?utf-8?B?NGNZVEZrM0JVa1Q5cWgrYStXOGN0WlllcWkzV002YWZCRmVSZFFSd2RtUEpW?=
 =?utf-8?B?SGtjK1BWVEdyQlFCRk9jRVZDVmxWSzNJZUs5aTZxZlV4aVhYTTllZklTY2t2?=
 =?utf-8?B?bGdBaFgwMWZhLy9GTWJTQnVOb0x1OXZXME9ielF1VmlBSUdLQXE0WkZaYWNh?=
 =?utf-8?B?VnFyVnZZdTNCYk1aM1BCMm5CTXF2ZWxvZ3pvQldwVjZ0ckI4d3QvUlphdEFa?=
 =?utf-8?B?emMyZ2xNaS9DaDRDZ3pjRTRhS0dFNy9CQ05DL0Y2V09Tb3U2TTAvanQrSXU0?=
 =?utf-8?B?ZmtZL01GWkNJNzlPUU9kbU92Wi9vOE55VzlhWDA3OUVRUXRjNHpvejA0VXlX?=
 =?utf-8?B?c2czZktlUzdRdFhrVG16WVd5ZFB2dlBZNXpYZXdnb1RLakZRTE1sR1E1MmJR?=
 =?utf-8?B?VnE1Z21IRk82ckx2MmR2ZUtaTlpXc0FzOXI0aE56NEZ6TE9XeGxJNDZ4NG1W?=
 =?utf-8?B?V2ZMaFhkVitZNXRzYjJORjZLZDZlSCtZQ2RRelRKeWFaZThiRTYzbms3UUl6?=
 =?utf-8?B?ZlNjZDBHWXg1dWF6cDUrSUlLbjBJc0YrbUtQd0R4QTdsN1EzcHNNaHI1UXFV?=
 =?utf-8?B?TlJQQjNhbHZLcTFoQU1zVVdNSmJaMjhJaFJwMWYrRG44emRFZHRYYkZLR1E5?=
 =?utf-8?B?dHVPNHduQTJpSFJmYjFiNHFNanBrb00waE9Rb3QrMC9PMkFJZ1dkRC9YYlRa?=
 =?utf-8?B?ZjJqcHNaS0V0M3ZIejR4ZXlnS1BrMEk0c3kxcGFyV3pjZ3dFWU0vVHd2eFl4?=
 =?utf-8?B?ZVpBNnBtTDNRNHM3WlV6ZXNrUTdnYWxQbWF5V2VQS25sNjVMUHJiSkorWDJl?=
 =?utf-8?B?aGRyOTVFU2w1d3J5TzEyWVRQYlBqYm9sVWZyek9NZW1qTFVESEtrMFR3Nmdi?=
 =?utf-8?B?OFo3YmxEUnpqS3hKRTFkckVnb0djbTJROU94ejJMZFlTZkJkMWc5WEtCM0VY?=
 =?utf-8?B?VHdSWWkzdjN4NTg5ODl0c081MDAva21mM0FQQlU0czNxYVpNVjREL0s3bm5X?=
 =?utf-8?B?MmRManRsK0lCa1orNEU3NzQ5MGdHYk10WGhkWlpIZVNENk5aMWhiMlI1MUR4?=
 =?utf-8?B?U0RUQnN5NXJYbHErRGh1WVR2MXdrbDlWUGNmWDVXTzJqT3k2WmRVZnY5S1cw?=
 =?utf-8?B?TVJZZThwZXhHWjZtdU9XZFBXOVl2SnhkS1FKdFJIODFLQ3l3cnQvNGozVlpa?=
 =?utf-8?B?d1IxRkU1NjZTK002dVJuNzdkUnZzZExFZHMxMnI4NGRJR1BRQy9zYVZLcCtV?=
 =?utf-8?B?TVZoNisyOWt2eEUwb2JhSnAxWFI3YXFpWDVscktxdlZSMklJOHJZNkVpZjRy?=
 =?utf-8?B?SmhqOVNGTVJlUkdEcVcyUHc2QmQvV0lXZzF0anBTTUdHNGZSWkR1NGhoRVhI?=
 =?utf-8?B?YVF1NmZUMUpEQmRQcndkdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 421a66a2-190a-4113-b73a-08d8c8fae2fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 10:51:55.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzHKI4L6s5Vtc+3IsfHgJeMSTYqjFDukj+qtie5imugGPxGxcUMSB4BadNQWSxFw1uG4EJ4yvbNpDXggKwEUDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

On Thu, Feb 04, 2021 at 11:27:17AM +0100, Jan Beulich wrote:
> On 03.02.2021 18:58, Roger Pau Monne wrote:
> > --- a/xen/include/asm-x86/x86_64/efibind.h
> > +++ b/xen/include/asm-x86/x86_64/efibind.h
> > @@ -172,7 +172,7 @@ typedef uint64_t   UINTN;
> >  #ifndef EFIAPI                  // Forces EFI calling conventions reguardless of compiler options
> >      #ifdef _MSC_EXTENSIONS
> >          #define EFIAPI __cdecl  // Force C calling convention for Microsoft C compiler
> > -    #elif __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
> > +    #elif __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
> >          #define EFIAPI __attribute__((__ms_abi__))  // Force Microsoft ABI
> >      #else
> >          #define EFIAPI          // Substitute expresion to force C calling convention
> > 
> 
> So the problem is that some capable Clang versions set too low
> a __GNUC_MINOR__ (I'm observing 2 alongside __GNUC__ being 4
> on Clang5). The way the description and change are written
> made me rather imply __GNUC__ to not be available at all,
> which I then thought can't be the case because iirc we use it
> elsewhere.

Yes, I also see 4.2 on Clang 11.

Do you want me to expand the description by adding:

"Add a specific Clang check because the GCC version reported by Clang
is below the required 4.4 to use the __ms_abi__ attribute."

Thanks, Roger.

