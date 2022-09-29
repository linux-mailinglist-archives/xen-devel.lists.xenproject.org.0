Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E8C5EF03C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 10:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413518.657205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odomb-0000mx-Gk; Thu, 29 Sep 2022 08:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413518.657205; Thu, 29 Sep 2022 08:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odomb-0000kw-DW; Thu, 29 Sep 2022 08:20:37 +0000
Received: by outflank-mailman (input) for mailman id 413518;
 Thu, 29 Sep 2022 08:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odoma-0000kq-NQ
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 08:20:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96f9b532-3fcf-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 10:20:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 08:20:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 08:20:32 +0000
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
X-Inumbo-ID: 96f9b532-3fcf-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnzsTNUDRh2E0U6KCdQh+SuEwg4CM5HcJacMUksn/XC7ZlhVGi72Bw3V5QJVFI7IgIR+6bTzWzVFBS0IETYbtfXVrgWkg0+N5GymH3eVD7zkjSiiW7NKfF5ndc/wQq5yZUiN1zEbqbfeZKEp4FejASKLcKPjhJswqBjWdVm3lzcs4B3sBAVxBQ/LH41/cFpEnye1OFhCyJkZubc3EFTQnQ040YDCTXOo5o6WMD5zxhUE2HvRxYMQ7bSpNtOcqYD+EKJOS46y1MUZERV1xsbHRc2refJAvESdcmfR0YbPF2+9krkVh/ZNXb8dert5RCUudV4DmRuJjT8WY5qglxXw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFDh9KA9ArMw2f61TIff5eVXy26rQz8dDlZsRIL7Su8=;
 b=C+mKdGGpcWqjUWxkOD2eKGWvftes9/oVwXi370I9qxJw1E0FqwHQpgqn6W6bn2gmaBglorniXsxT5XRAeLFF/CRontitk5g1Do+kXw97ldYSkhhlytRvrOjC2Xi3tM1cOeS10YnJqdOLvc2qEpUqfR0Sb3Ukx5Kvqw4lO1iO02iOeuTAO+Njqr2M3WHvpAc3O/svfSEcjW1YxhS/rDl8xJ+uh8W1Wb3Rkzq/Yn88C0n6LdmnDKXxcrnc8fE19E9TnyqxpW0sAm/fpc0hgFemoe04XIK2yJ6H0tQSSMlYkuikh1RPCw2yo62855aoqJLkj1NR2wNfugp4PlfWnu+mZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFDh9KA9ArMw2f61TIff5eVXy26rQz8dDlZsRIL7Su8=;
 b=rY4mS2Wa49LHZ0CEtQUAotO7Q9zm9wEitGjzEiEd8nYJoR3IVCmPqpm7HV/LJIR6a0tZ7K6uGhi1yQPmL8uSsUV2DKLw22h6BTDGBJ1SZgOdrAAx9ZPsSI8bOhl+Si1CL6vMzyTCcr7Mgc+1T4MdwP6xxrMXgMvP6tFlD20tfVM24nB1niHZfyexLpSEuCxb8GQRDhKPbzfF3Yq8wKRu8Ac+QOKtvp82IbJazan35JUQJTem2aLP6TfcbHKAeOdHX1ov/lfNwcNwbLy0zle4DA9qonM7auUNnuHdJlcN6np+vyOhqnJdJG1YpkaIMxGV8htr7esAnfR4fxA/f9MnKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ed7940b-0e29-6c3a-cce4-f98f709535df@suse.com>
Date: Thu, 29 Sep 2022 10:20:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH RFC] rangeset: mark a few functions pure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a397e671-f93b-cd8f-9019-d005db7c7009@suse.com>
 <YzRZ04X4G6f4i6Nt@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzRZ04X4G6f4i6Nt@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 1262628f-40b4-4357-16a2-08daa1f37a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+657WgMSdd60ByRfjl1P/jATKhcwr5K17ex3ndRsnm0z3XCVO/czHYvQTRBslyNdsX/xR59G+Y1YMS+tldalF/lHhc2rKi7mhr6+i8HTdGIcK9AdzfOpZcGwHg87yd9FNlFfqqw4lfbufmYR2vOFXg2rRUAkSz2+fqUq1i7PN5jEJhaUjAjG25K9Yenr9ZaONm67vzE4E6QNWKcetQoTikbhvPjUrjpwX7OQeyip9a0QPanVzyG2uX4RRtZw5r8XEhOvlHNftCrc5PSUfmwq2zcXvXF0rjEepIs2O2UhrzFJdEe9W6yhHetZNljpmMV6g2OHUHzi/5VO2LTAAen3KD8fCEVGbdKV6rN9x13eTT5BPkdX5slpCDfdVwXo5elLuN13l/snJsCzVd8gaQtC1DKqrQf8skLBCtL//RSoVNSvm/40ftTtdBDUkwB2EIJB5mysnFMPAmvjcWAf9FHnAr+7LfRpMVzie+1oXQ7A7MJi78OqNTbhSzBXt+KLSCK2CZ3T/st1Q41LTQtZ6/zLyH8s2YKJn9cKzYgd7n2gF0Vj/OYSL0Zj9h1mzNmGLs8OAM/LjvRYeUb4kwbMFMMgaedWt3PIypUGiGk3m4/eESn7xl7QJtZQZv7pbMSryyh47+/REjF7LuTJIheYtTI7kJPLGVjlOV/+rEQGtq4WpYF+msKOCdiivL3OpFIwk0xJHKREL+sLyDAy5iD2wF6k+7S4BzyFIqRO2xOrdtejQ7Uexp7zXjqZbjTuHYR0bfyCfmLQXoq7RZ+XhtF0gRDUoe1tpeI9b7i41cWLSS7uGwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(54906003)(186003)(83380400001)(2616005)(38100700002)(53546011)(2906002)(5660300002)(41300700001)(6486002)(478600001)(6512007)(26005)(8936002)(66556008)(66946007)(66476007)(6506007)(8676002)(4326008)(316002)(6916009)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmcwaGluZnJlOXdoZlRXQVBGMUVhVXZFMjVZZ0Z0a1ZWYTdhamdCMUo1RXZY?=
 =?utf-8?B?cGFtb2pPZTc4eXc2TGR5RFdtMi9sR0R6cUVJcTMxNHJVempPTm9tWHhVRXJs?=
 =?utf-8?B?MXBzdXdPcXg2T3dLc2pIU1E5UzEveW9oTk9iN0gwaWpXV3lmSk9OVjF6NWg1?=
 =?utf-8?B?MmN4eEdkTWJTMlA1c0pDcmpOUk9nZlRid04xMEx1Y3JFd1Z3THJyYUNmckEr?=
 =?utf-8?B?ajc4ZnlibjAzSWZBWXMvaTA0REpTWnNMWEFIc2xvZ3pqSzJyVVpOSndUSERV?=
 =?utf-8?B?eXU1MDB4QTVsa2JHVUU5L1NlT1lUWlFERC9IOCtrYkJMdmlINzFiOXc4em1P?=
 =?utf-8?B?U0F5dzVZelBScFEyVWM1OEtnWFN1SlFLY3JGWm1QV255bHA2eXpQdlIweXZD?=
 =?utf-8?B?clRpeWtaSXN6bWt6aXlsa3VrNEtCdUM1TWVicFNqMTNIaU9jbm9SYUlBcVdk?=
 =?utf-8?B?UFlPdUVCN1NMY1dUM1k5cTM3b3loYlBCU2RDN1dIa2NLOE90N3J3dkFkTXAx?=
 =?utf-8?B?WGhCMloyc0VON29Wc2l4RlphR3BwRHFUajc5cHorb3NrY1FXUytON2hZSzZH?=
 =?utf-8?B?MDBXNXhCSW9PZ0dTQWxaWFZ5ZEUyRjUyNUVYREVrR3pZMkF2My83WmlPbjJW?=
 =?utf-8?B?MWVidk1SNi9YdHVlaUI3R0pIU2trUVRSdVE5KzI2SHFITTY3S0NpZldSdmpp?=
 =?utf-8?B?VGszRFUvR1BBeEN2alErRUM1SEFHQkMwZk9lWE9jZ2M3YXZkT083TDl2dzVh?=
 =?utf-8?B?M2xqUzZMTHdkbGxpYXdNNy9CR2c5TGdKZFNyVy9Oak92clFnT2Nud2hFbVhY?=
 =?utf-8?B?VWVoelVaWlEvaFQ4RXl5VDFWRStKQ2dzVWdNUms3MG5xaWlMM2lPRitxQmVM?=
 =?utf-8?B?ejVyaThJNkFXUmFVNlBwcVo3MlB6YXNuOFN0cDIwUHMvYTVQODFxdjNFRWZ4?=
 =?utf-8?B?dGV4bG1qK240Sjc4RTJVaE15bnQzRjRieVh6SS9QODBuNE1XM1VlelNWbHNX?=
 =?utf-8?B?ck1XYXVMQjkvNXRjYVM0a1ZGeWRXTjVsRWVqNkFjd0xBd3ArekhENVJ6L0FP?=
 =?utf-8?B?UUdLcU5xQzJaUGs1UU4wZEZDcmliVjVoQ1R3SHJYUmtZcFo1VldoTnJ6K0o3?=
 =?utf-8?B?OFo2VTNQcWNzbzNzNkgzQkZvRlhKWmZxU3RtYUs1S0YxdEtpUUZXRXRvNUMv?=
 =?utf-8?B?ME4xTTVoWFRaL2VWZ1V1MHNuVGk3RXlXM2hQcXc4TlBRZmpPVTBrL0JoTEFV?=
 =?utf-8?B?L3VoVzg3Ti9hZGtKK3dmS0ZJKzVvWHEwdklrZmpxZXdGZkpGYnJUN3AwUFBQ?=
 =?utf-8?B?blBwWjRwV3ByQ3c2YTJYMDhvc0VsZXRZdkhidndDdFZMdzhQTWYyaUhtanM4?=
 =?utf-8?B?YnNTeE43d2VzR3pMOG9qZGpibnNyU25lZDJxRTFGblZQRGM0WTBPL0RVZWhq?=
 =?utf-8?B?SHdwQXd5MnJ1TWZOR1dJMjhkU2hkWjNuYnNWQW9hdC9ncWlsV3VMUXRCVHl0?=
 =?utf-8?B?RktvL0NrV2QrT096ZEppQmJ6eHJnWWRuTkZTYW00MHVnelhGWWRhcVR5VVdP?=
 =?utf-8?B?RG5ob2Yrd2RVSW96eHlTa1pWWEVRV3NPSFVOaWVUUFJPdm04aWpRaDN2a2Zy?=
 =?utf-8?B?WEFnblRnSTBMZVkvRUk2S1NobnZMVE5ScmNPeU81UHlRMlduNzU4VGJ6NkVQ?=
 =?utf-8?B?RGY4dncrSWxHSERFSzB5N25QaS84bFB4bTNBRUpCSjhJMkZyVmYvYmF0aXRh?=
 =?utf-8?B?eFNpV1VOQUoyaVVFOEdMa0R4UUN4SGJUbVRjcmdLZGtwcU9ycGo5YmFDQzhL?=
 =?utf-8?B?Qk56YUsrdlIvdzU2Yko3Wm0zcWV1L3dZeXliWFJ0aVYvNzZtMWJpeFpIajN6?=
 =?utf-8?B?MVVBZGIxbHFMd3dTMFhlajNwRVdNT0NtcFVQMFdJU0lWU2xTd2VSQUR0bEJJ?=
 =?utf-8?B?bzRheVlBL0EzRnkvNkpvRk5INFVVWWtpaGNmQ3lKeDVidzdCVkszeGd3NjZK?=
 =?utf-8?B?ODFSdG9GQ21yVTc2ZzlLcWFyM0lLWEVEVWhVZkg2NDc4YkY0TG1EbWV6K2ZE?=
 =?utf-8?B?SEtyT2ltcEVtMVRJdnB2Ujh6QWRjcXBMSU9FSi81MUZBSlNJR3U3MEZRR2dq?=
 =?utf-8?Q?hOaGsVK1/QnHDCugV6aNWq+E3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1262628f-40b4-4357-16a2-08daa1f37a09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 08:20:32.4293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbMrZJVmyiLAd2t5jmTWm1BhocT/9uaxCg6e8wXShLk4G4zUP5ZilJXm3CM2Zwg6F5rB9gknFnnz+LwYgpp1SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812

On 28.09.2022 16:27, Roger Pau Monné wrote:
> On Wed, Sep 28, 2022 at 02:12:30PM +0200, Jan Beulich wrote:
>> While for some of the functions there's locking involved, the acquiring
>> and releasing of a lock doesn't alter program state when comparing
>> "before" and "after" the function invocations. Furthermore without
>> (further) locking by callers, return values are stale anyway by the time
>> they can be evaluated. Hence both CSE and DCE are okay to occur for
>> invocations of these functions.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC for the (imo) ambiguous wording in documentation.
> 
> What happens if the contents of the rangeset is modified outside of
> the scope of the function.  Ie: would for example:
> 
> while ( !rangeset_is_empty(...) );
> 
> Become an infinite loop then, without taking into account that the
> rangeset can be externally modified?
> 
> It's not clear to me whether the elimination of repeated calls take
> into account that the observed variable can be externally modified?

Hmm, right, this actually matches the feof() counter-example that the
gcc doc has. So I guess I need to withdraw the patch and we will need
to live with these functions not being possible to eliminate even in
cases where it would be okay (and helpful).

Jan

