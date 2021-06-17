Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B903AAFAD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 11:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143772.264833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltoIu-0006bh-TT; Thu, 17 Jun 2021 09:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143772.264833; Thu, 17 Jun 2021 09:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltoIu-0006Yh-PY; Thu, 17 Jun 2021 09:27:16 +0000
Received: by outflank-mailman (input) for mailman id 143772;
 Thu, 17 Jun 2021 09:27:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfGr=LL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ltoIs-0006YX-IS
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 09:27:14 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfc7aa84-c0ec-4a62-83d8-5ea64040d7c0;
 Thu, 17 Jun 2021 09:27:13 +0000 (UTC)
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
X-Inumbo-ID: bfc7aa84-c0ec-4a62-83d8-5ea64040d7c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623922032;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YiInuC9hAJSHpWKjprUpuRB9ZX3PsfFDH8TaCbWPfts=;
  b=LOSWcCCEQe8BszibXCP9E0kCoePnKmJHo44nnWjA5OOCZsdq6pWvhTAd
   vl7I6eKrMb6ABPE6+5h3S60+JADFN2dZRiT0u9JmhsQ7KjuWtuj/4fXOM
   WYcEZm2NoMne7b+3ZJX+Mkbjk2F280qCbgMgOHwPiSOWo6ZsdAvqnFTIW
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: U3qK9CY5UjHEFFHPCls9XmtTy1mX38rEJb9pw7Bl/ngX86FUelGaXY9D1A0wMfeL+RQldDl2WA
 xDl3ImQGDCTtQaaYc4uNoeNRLgwtbxiQsQgo85RssPV0bqO9kr2NXtdZceqQUKKNfZBQKt6i25
 abtBRfKyftn+pGo/PxKp0VeHL4PPkgrk4zXHk8DQjffvgexx4E7MdqtArsinSHuj4Th20sgOk6
 jlEX5f3M7YwXdNF7y2FdnxZ6qjq2oBpMmKc1wiV0N5GBdV8eLyNSkoVNI6crEDReLA1jcEH/Kv
 m5w=
X-SBRS: 5.1
X-MesageID: 47928562
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TOEXWasP1apxGOqzqwK1HclS7skDu9V00zEX/kB9WHVpm5Sj5q
 eTdPRy73DJYUUqKRcdcLG7SdW9qBznhP1ICOUqUItKGTOW3FdAT7sSkrcKoQeQeREWn9Q1vc
 wLT0E9MqyUMbEQt6jHCXyDc+rIt+PnzEnHv4vjJjxWPHhXgulbnn9E4gr3KDwMeOBpP+tCKL
 OMotNOvSCtdGkXdcKmCHgMVeKrnay3qK7b
X-IronPort-AV: E=Sophos;i="5.83,280,1616472000"; 
   d="scan'208";a="47928562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbLCzRR0SmS8O4qo7jlwoYso6SSOE+LEhFz/WyaW1pqr4uhSSSJJ9yhLYVJ1VPo/D0iYiYtbIOO9xE0bLah5xuUXHww+ftZDoG+bDRwOVqO8hXlvLETl6EHvfQe/YtClcGuy4KqKsEPjKQCl4PPa9nn8BM6eWoxW/O3ib6G+7F7l7uv/SliRy82EgVlzZmkWfKGcHPoU9s6HnvgP7sHZn+rzBHnIkicPH/NiyVKDGZFGsgePskp2D3wrue8E8370e+43EvD62EKPzwZ14qHI2DnMMebxAAqfhge6IzH4DBIXaNc6RZxzcxEKRVVVsMBtK/MoXMbkL5eNw7uc9wGwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMc2tDcfiwSqaJYV/V3UiexFJa88SQibSqbYs4O6KDc=;
 b=DaodqIh8b0YHuIvw2Ggj4IvzefdnmE2uywuEOuVTjsq9l1Eai+dmCA1uker+vHxI/30qOWk+j3bQkCiL8RdmfjxjJNVsgt9bQLrxc1TPDNrxQf3Pt1FebZCONFTN6qA8B+rX9LfM2p8osknXrIjOW5rDVmYnonxYbruMtGHeJ0lk7ZA2SSPLfr7CKWCxsb9W3ah00bmuWd8klEPCBHRdkc2I30Pl/eJSh+UPoE3NfO/E8xUIWmHyGdGgmMihcwcz7gopbmUbqnyk6Ybuea9TpsAzbAURewuy8uy7LMjwt/AW3OyPBQ1zaz7DMaxKY5wnmBXcKyOuHmAdQV/gOsDMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMc2tDcfiwSqaJYV/V3UiexFJa88SQibSqbYs4O6KDc=;
 b=SYz+zvzMPugO/z0xdZsEB8VOSLj84kvApJt20U3hePdaSihHVmsYxxlzjpKveU2Q1onARA7p5hcWzw7/k8/v1ITrTv4WlGUg+8fXPVD3Fq3DBtR9deZxn32r7d3I2Kj/dJ11vGKRUQ0GTE/aZ5q3K2IWsTMU92sSTjVII8Lh4Jc=
Date: Thu, 17 Jun 2021 11:22:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: hypercalls with 64-bit results
Message-ID: <YMsUVAvFZ0Zv2U7I@Air-de-Roger>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
X-ClientProxiedBy: MR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::28)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e2b529d-3d7f-496f-c879-08d93171701f
X-MS-TrafficTypeDiagnostic: DM5PR03MB3065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB306505BBB53A950F41A45F398F0E9@DM5PR03MB3065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIz6tSXFkg51uxUwLhvq1o2E+/GajmhMfy0GmEtyroIF3WzAm+p6ujMS89gRSve1KgGA6Mu7nvHUdHq/kErOX0aHNt6UZTxlJOxmr0G+3DPqDsrz4Da9iRU1U/vP4JEpbFm9ld0lK8kiQtY4jdRlq0nPd5LUkq3SGLXF4fGnE1S+H9LPA+nALxJCXu1DR5LxOGMDd9up46tNvZXID3ydqyOD0geLAaqHC4YsQ84sENIEjqfxZwa9ro9oyJC5PFdJpu5OmKN9yahBw9mNAZOzuIdt2UQvUXZrT5b99rTSLaxb53Py4tkVnBRL0epJYW93R4HD+lPnQ/E75AeqjQzxpYSQS7wGJJmWzZF/PSPsZa8u/dm9w2WyO6hJU/OawxKZo4yZ+VZgQgy6i4l4hD4OpFD2gc7evG9ch1TqqvDniNSmE6Rgmqhu4dQG4pmmOUD7X1w1LmepI3MDCEvO65CgKUDpadEOYRCj3Q4qT8A1V9d7vhkdWjvodqy3vqel5wtwOcQMdSu0SFmKkKcRc7zpdaVb7l+z2SHNiRtt78HDEJ/7adtW57yUM50usSxpTlYOj7DHy2a3rE9JByCLqHS+sugGgncZ+IBZjRJBgEYHNSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39850400004)(366004)(376002)(136003)(346002)(396003)(2906002)(6666004)(956004)(6916009)(26005)(316002)(9686003)(16526019)(5660300002)(66556008)(66946007)(6486002)(6496006)(54906003)(33716001)(8676002)(66476007)(4326008)(8936002)(38100700002)(83380400001)(86362001)(186003)(478600001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25BNzNSSmxqUXNINE9BcXdOWWlGcExONGFMZVhVOHh2WkRFbUx1MHNuT3Va?=
 =?utf-8?B?L0FMVlVEYUJqYmkrbG5yNEhJREl0NnVvRnJENU9BbW5uejhsbkYwZGVkUEZ6?=
 =?utf-8?B?KzlKQlBGSXZGMzFkaEtHSWxVUXpoWTIwZDF0VS8vN0wzZVRvRGQrRlBzaXBM?=
 =?utf-8?B?UXUweUtLMmZXdUV2MkdDWDNVWE9RWnNiYmljSFJFbzh2NmhWM3JocGg3ZnBk?=
 =?utf-8?B?SThPUXhwU0xha0M1M0E0dUJrVkxEbGVrOHdjYjcxT0JsODVQTElTMndNYU80?=
 =?utf-8?B?YWF0bER3VDJHMDFubmVhK295ZGc5dzFPY1hwNmRBVm4vL1c1bUx6R1V4YjU2?=
 =?utf-8?B?SlkvcFo1UnU1Z29aNUxLZktOSVlqdHlUWVZTSkRPWlpTa2dYNDJmOUF2cFVs?=
 =?utf-8?B?Ullva0RWcGFGRnJBZVpUZUdxczcyZWhwcEl1czhwUGduM3M4ZldjREk4bkNL?=
 =?utf-8?B?UUdqQkh3eDVoRGFNODU1cTVBOFJIbit0bHExb3ZJTktvc3pTeEgzZWdzV2xE?=
 =?utf-8?B?ZUwzazNCRWV0bGdVTzAxQTFMSHVqY0JPdldhSlRVQzRYdXJMOFlMZzFwVHRj?=
 =?utf-8?B?M2FPaDVoazZ1alJuZFRwS1JKS0ZPZm9VZkxWSGxvYzZRMW9mdy8rN3dGMG9M?=
 =?utf-8?B?N3gvV1cyVlNQTmtGZTVLQXMycDZQNGlrYytJczY2WHBjWHdlcEtyaWl2bkhR?=
 =?utf-8?B?UXFCbWVremh3Rmg0OUtHbk1xUEZXOUd2VHUrT3p2dWUveTlxc1VyTG5JdThz?=
 =?utf-8?B?Sks4YWkrRHlBV045U2tzTXUrSkpwZnNXbmhFSEQ3QmhDQWs0TWFScDNrQ1BG?=
 =?utf-8?B?Ujh5TkJQWi9MMFJTN3FzS1lUck1oWjJ1L1dPeExNQng0c3J5STI0SmRSZndp?=
 =?utf-8?B?dkpFVVBDQ2pic1pjNGZUMEczOHRKM1MwdnRMSGdCUDVlR1FrSHYvSms4aXo4?=
 =?utf-8?B?UjdXTTJ2TDFqYkxTeWhvendSQU93Y21LS2xuaWdqR3dDR0Jad1lpb01yV0xF?=
 =?utf-8?B?Y1NDeStFbHFQT2FvNUVqbXQ3TC9YUFlWbjhhTjVIU1Bqa0xBQlBLZUxMei9u?=
 =?utf-8?B?dVluU3c1OUtBWTUwMmRQRnhzbmFmMjBEcWNEeEo5VXlaVmpaOVNMcEFGMTVI?=
 =?utf-8?B?ejBhRzFYR3czcW5NSjJmOG1KNWkwZnFkZUQ3bFdheFpLbTJzUm9VZUlPT3dV?=
 =?utf-8?B?OVdlbXJIRW5nci9peWUxSmoyL0tma09NWG9CWmN3dW4vN0dPTWxqVmxtd1hW?=
 =?utf-8?B?SW5jRFRrb2ZRTFVFcjhCdjhOYlIyUjJ3QzFRZ1B3VG9aNG95VkoyK1o5M1N5?=
 =?utf-8?B?MEpNa0htMzgrTHl4U3F1UjVjTlRFMDhYTTc3RlllTW43QzFWWEpmQVpYWEVD?=
 =?utf-8?B?NTBKRmh2YlhhVEF3YWF0Y09sQi9HbVJ2QW1QaEtTTjVmSkpNTHg3SUNwSjhF?=
 =?utf-8?B?eFpLZXlMUUp6R1k2NmlOWll4cEtzb3pIT20vMktSem5qTXQzMDd1TXpSTjFs?=
 =?utf-8?B?b2FUWTA5RTRXK2huUFdWZ3ZMdjBoTlMzekxMckVIUTIyNTNYM3hPUE53Q1Z2?=
 =?utf-8?B?c0NKSk5qaGFyblBnVGpmY3l0ano5emI0cUVrNGlMKzVWZ3VhaitiVk9kenZK?=
 =?utf-8?B?UDVyajNnTHpXSUp4MEo0QzNXSmpremhocUVEcUlKSWZmN1N1Z0IrSnc2VUxC?=
 =?utf-8?B?UWlBclhwRWtpVXc1OFJMeUI3WVRXdTdvNjNlYlg4azUwdFJJTDA4alNWWmcy?=
 =?utf-8?Q?zhhfo8BROB9ZDXzrUppFkq0HAxAxvT4G3t97X0D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2b529d-3d7f-496f-c879-08d93171701f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 09:22:33.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqvSgCi4Zd9iSZ+fs+AT4cTHwwKQMRAjyjwFVZPY6IAvrQIHMN+92T82slqZ0oKf58fdZLfCHNPDQ0DrU+dZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3065
X-OriginatorOrg: citrix.com

On Wed, Jun 16, 2021 at 06:04:02PM +0200, Jan Beulich wrote:
> All,
> 
> several years back do_memory_op() in libxc was changed to have "long"
> return type. This is because some of the sub-ops return potentially
> large values as the hypercall return value (i.e. not in an argument
> structure field). This change, however, didn't have the intended
> effect from all I can tell, which apparently manifests in the present
> two remaining ovmf failures in the staging osstest flights. Anthony
> tells me that ovmf as of not very long ago puts the shared info page
> at a really high address, thus making the p2m of the guest very large.
> Its size gets returned by XENMEM_maximum_gpfn, as function return
> value.
> 
> Since hypercalls from the tool stack are based on ioctl(), and since
> ioctl() has a return type of "int", I'm afraid there's no way we can
> deal with this by adjusting function return types in the libraries.
> Instead we appear to need either a new privcmd ioctl or new XENMEM_*
> subops (for those cases where potentially large values get returned).

AFAICT NetBSD and FreeBSD are not affected by this issue as the
hypercall return value is propagated to the caller using a long field
in the ioctl structure payload for hypercalls.

osdep_hypercall however should be fixed in libs/call in order to
return a long instead of an int, and wrappers around it should also be
adjusted.

Roger.

