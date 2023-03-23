Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8886C6AE7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 15:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513909.795643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLta-0007YU-7P; Thu, 23 Mar 2023 14:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513909.795643; Thu, 23 Mar 2023 14:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLta-0007Wk-4U; Thu, 23 Mar 2023 14:26:26 +0000
Received: by outflank-mailman (input) for mailman id 513909;
 Thu, 23 Mar 2023 14:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfLtY-0007We-Ak
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 14:26:24 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af6dc3af-c986-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 15:26:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7329.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 14:26:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 14:26:20 +0000
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
X-Inumbo-ID: af6dc3af-c986-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY/qwqSpapkW/47cDEVzLcA5Fq9P6ssdkpEXAOzLeUQv//P0GECvc5+9QqWkjVfnsCJEwrJrMlVYg7W1WGa+hg2skmaF6zAHtXKCf0qeTzg4avBOMylLuGkETIUicTCzZdUcx1NUGTlf3RhkR7q4/QjqmQzBxA27z/am9DeUrFQzJKLbXjO6zQSE4TLk8MnSXMzGoAX1Crg/yfdf4KryTI/jjg2oVexZQ4oDmUkxWHYZ3mGWxBzej/HV+qdtQ3D0UHTZANdy1sMcMveSfQmlqFOUjjgqvZajM5VBDomEJDYybGzksflEOezsW7cyfb8Nf1pbcDWf/kfQvR8LzkDfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVsgWoRr3DjXO6JZR+yG18J1JlhWeVsNBbGMBDTyyd8=;
 b=QGL6CM/UiXr9vWEE4Y4Jbbu6VZof0CrtiqzEHR3IXf9E3y2EmWSwlIJr/qeYskOJeQ+NWeDlYgMhbnx+zhBxRneQi8EArxWsZ0SAatmWjQO/ckFVt4wJm3f43g00DyaoKqLEhcwfRlJ1mzYaximLBVcK25ZQXUCyvqkuQtLakgtKNPu9JMc6clpETmQTwFZzcQpe+b4Z+3TdVd1xRcWSnce6+A2drExzm/nL4pWjVuhVc3zGi0aMwCdLKRDHOdCu/U8qJDzEpeRuHWLGBdd5XF1mWQNEEYemMqO3ZyBnKTeDqbr+DBNreDamb6xNEAI0O0TZ/9iVBjQ5LrR/aL5Kzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVsgWoRr3DjXO6JZR+yG18J1JlhWeVsNBbGMBDTyyd8=;
 b=0nu5KOrO9WKVJggYi4Qdbx/DuKHyOjJMkAMH1DYxkErvt4Yk8UQoq8HWaTXRfCiEuzchJ6ODNdauH0UBHJQYHfIYJ7tizVixNIb6qOB8bPhCsUbw4muKagKfHjvfxTJWPnHMxL3zJQBBvGUfVyDD+ecth/9wRPzL6hagQae+zOnEOpF+nbibzXszQNQ3YS04Ga7h0EMO80x9ksbrvsSCI0B+bPE6sbihjZtZLgxTOCfZqnAv4J+QJfMJIo/bhd454YhcOTdnmRqPeYL0Q2eyiyJL+NC+g9Peff1anBur1qVRCsfLBBknLI4U8FS6h20oSkO49H0kNXubyFyce573VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a15f4c53-3ef8-7123-a47b-1e697314222f@suse.com>
Date: Thu, 23 Mar 2023 15:26:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
 <ZBm7N7oEDPlPmZ87@Air-de-Roger>
 <51ee4bf5-fd96-4fb2-c91e-36780b0f7ad9@suse.com>
 <ZBxGR2j1dnvLgy/A@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBxGR2j1dnvLgy/A@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: c5538ba2-6095-4e1c-6302-08db2baa9275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	udiewg21+MDDOZ6sprTYPLopuKicFnscv9gWi/rhBcCTLXRsDSAhOGOQq8iqoTi0/m1Gpd3sCybcUsxzgDO3kN3RtTWHScF4XRZBXo+Vd7Q3OZjp1o9gKMlaVA2nXiKx8Qw/ACut/dcgdIQ8TYCjugBxmQxejFK7/o0iYhGS4ASTmqII3ACOv0dr1qZ+7XY6ApQ90aW28jdsAcnYEty2Z0UDLUh/y1bxwaKxaBtkRrf4idvCZWQFmvCUDLdmqmvwNxF/27//C8eY1Z6xJhhuTFEJW37nYy4R0joPDAw8z6mIj3rdvglcDerh8bjPDu/bkYuhUkoFWDEalr+YgoQBUSKzNVIoX/wqaf29Uw/fNcNtTaACKuCWtsaMOPY8CUnTTuLSkSxBB3APGTbKWvlnn/aKys7ziFZxEVB5dXH5dozx+RmvkGIbuhWYyHJr3q686ATnmF4VwZRVt41qijcEfRWdLzYTckLAL2PXpL2scVewoYHR9DNnJ8AVbhoPzOIHB3IEyuDmgG/BXFho7QSaYdsrgb4eNIs48SJ057gVYfthO283XCrID6OH4XiaxZ6DnNMJXBvhkCM096UtLYMyUVgOUnc6dtgX1UboXzJfU7nP3pjfhIUAQySgQWTfDE7PZWuiNtOhTSEPDiQQXFKbyaq5Hoz4rwIRQu9mI1giToVx6aqmdcb/Fz4+wN0ik9+lDeL6oiovBsrt3fV1n+3/MNTej534sF/40dkBSEt5FJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199018)(31686004)(66476007)(6916009)(5660300002)(4326008)(41300700001)(8676002)(2906002)(86362001)(31696002)(36756003)(38100700002)(26005)(6486002)(478600001)(316002)(66946007)(66556008)(8936002)(2616005)(83380400001)(6506007)(54906003)(6512007)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFV0NTV3YUVlTVVOTGFZbmZQR0E4dEd3WlY2cWJnWTh3QUpGRUl2TU8rQ0Ja?=
 =?utf-8?B?THVIdlJERnpCN05oQVFFdHAxSlNGZDk3a082T3hTTmdBeDRRS0QrNGVaZ2Rq?=
 =?utf-8?B?TmdrSHlwV2QrQXU3YitJRjBFRXZ1dE5MV2lpcEhCdm9acG1SeVhjNGlpVGdH?=
 =?utf-8?B?OUFLR0h2NGxCVVJFaUwrYWM3VENyL1BnaTduZVlZZlFKSmo5VjhNMjhlay9p?=
 =?utf-8?B?cjRJMlU4c1ZtTm9PN0t1eFMwNFllendCTHJkRy9ORHFteWRkb3hBZDQyZWFV?=
 =?utf-8?B?aFN1YnUrVlRNNHN0YiswWTZPcXcwcmcwRm50KzQ3MTRVSkl1RDhKcFp5cEdn?=
 =?utf-8?B?K0JPR2pLUkNIZDVoOHI2WWVmbTNHOUFocGZPTllJYlU0a0puOTVVckJxT3Uz?=
 =?utf-8?B?OGJjZGozOWFwUjJoUkZpQU1YanVPVjgvOVNHRTN0cjQ1L1NNcm1CS0l3Unpu?=
 =?utf-8?B?SEE1OEs3NHJtemExeW1pMzU4RngxTzdCKzN1T2JpcDF1cHlId2FJUEtsRnJB?=
 =?utf-8?B?NzF3YkJNaWFGVDVsaUw0M3RzMU51SFlueHUwSDNjcjZnaG9sNjd6WExQbUsz?=
 =?utf-8?B?QTdzZVpMN3hJeWFldFpIcFVYSVZ1TXlTL2Y5YWdBdW1ST2c0UnFLUm5NRVo1?=
 =?utf-8?B?U0gyK1VqdEFCY2M0TFc4bEVrbnBWQ0pIYWpNN1dXYXFDS1ZWZXFqZDZINUsw?=
 =?utf-8?B?R1huSkZOTVZRUlErTlpwRVRDM2Z4Wng0bWhtT3ZHQlNrWFBPL2g1bStibGlm?=
 =?utf-8?B?aVV5Y0twODdabEE1WHdwU2VnZ2pGZ1hybW1zK29ZS2lpcityTzczdUxYWmVk?=
 =?utf-8?B?WmZFQklBUkowaVRINDdnRUFiRFhuVGR0bkNuYjNsY3l2M0d1ZDRkenRQL3ky?=
 =?utf-8?B?ZXZqSEJ5QUpPWWtoSVpLd2RTalRLb1lsTG1QSnl1U2I5bTAvTjhxQTl0VzNi?=
 =?utf-8?B?MnY4Ukw3R01UK0FDeDBscVErVWtnUmVjRWpQdlVRSUNySGlSMFAydFoxOEp1?=
 =?utf-8?B?eG5RVm4zSFN3OStpb3RDbHhsbW5UaHNkT3FNR2tDZXBPTFJqdGtwZU5VZHhm?=
 =?utf-8?B?VktWOEplZ2laYndXT1dPTjZza1U4TS91S0pBVUtTWTFZcFllSWxUckt6NGor?=
 =?utf-8?B?eTFUN0JoMDMxeDNjVGRRUlpzUnpGeGk0VEdGSTRZOW5KMnF0RUk1M213UmZt?=
 =?utf-8?B?djljQ1R0TmFwUEQ2NCtWL3A0ZnZGM3ZGcmRtNDl0cW9jNGwvQUZLZkVJOXBr?=
 =?utf-8?B?ZGhxMXhSL3grK05tNXRlU25nSzZGSWd4VXYwNFBXOG8rZDM0NUlXOExTenVs?=
 =?utf-8?B?dG5ocnkxOU92QlYxWEpncm85ZjNDUkNnQ2d0M3F2S0tVMEhQYnhLS0lYMXpY?=
 =?utf-8?B?aGxobDY4em9XVmVNdW1mZEpEamtqV2dnM0FpcUhoNGZHeXgwWXJjRWNQcFlY?=
 =?utf-8?B?T0J1QjF1Zm5wbDZYbU16MmtQWUJtMjRzQWUxcjcxT3BZSGJNeGd4aEN4RDBz?=
 =?utf-8?B?TlZXU1FyTnlFMjh2V2xwdk9uQjFkWkZaYitGUkFkT2M0aTJCdlVGR2ZYSmhH?=
 =?utf-8?B?YktLNTUwallkQjNUVmJDUkJMbWN5UDM3WUlnY21OTTBKdWFhSElzeWgzM3gw?=
 =?utf-8?B?S1kxU2p1c09wOWdnTUtkZFFvWnhJTkdZaWEyNTNZOWU5N0ZlWG1qR25DN0Zr?=
 =?utf-8?B?L09HQ2tkekxIVG9FaVZ4R1RtWmlyZVY4UkVMOHIxT2h1QWdNdjYvOWF2VS9y?=
 =?utf-8?B?SHVVUGgva0hlcy9iWHZLUlVqMXRva3Y3c0FKQWwvZnpnaUhGZ1MwZzcxTCtQ?=
 =?utf-8?B?TytJVFhUNkJqVjlyUUNjVXJiOG92d0JlRzBRY0RLbmVuaWJqbytOV3lKck43?=
 =?utf-8?B?c3gzRXpEUkxFRTBTd3NsaTBWZmtTNnJVZ1dUZUdGQmZ6a1ErandwaW1kUDZy?=
 =?utf-8?B?RkE2WGJheUFZM3czcm5zNFJjN0tBT2czZlM2Q1AvWFFEUDlMYStRZis2ekJR?=
 =?utf-8?B?dFVpcStDVFA2dVJnbnVGaVByMGxlNzVvNmRMNWtsN0VoOEE4VUlUcGgxajdj?=
 =?utf-8?B?MTVTeFFsTm8zejkvcmVSejdpbkFiSW55MEhYem4vcEFaSDBhUUNsRWhHOUV6?=
 =?utf-8?Q?vOYpAa+Tg9iftYHWd6Tjmxtb/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5538ba2-6095-4e1c-6302-08db2baa9275
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 14:26:20.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwtPJfOHzInBkLzoWIHUKTaFTTQUlLIg7OVmW23nuAOlcgstVqr5vFdfKz9EIWLoKrSKATZNrOO9Tk1ujqUr+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7329

On 23.03.2023 13:29, Roger Pau Monné wrote:
> On Wed, Mar 22, 2023 at 10:55:42AM +0100, Jan Beulich wrote:
>> On 21.03.2023 15:12, Roger Pau Monné wrote:
>>> On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
>>>> ... in order to also intercept Dom0 accesses through the alias ports.
>>>
>>> I'm trying to get some documentation about this aliasing, but so far I
>>> haven't been able to find any.  Do you have any references of where I
>>> might be able to find it?
>>
>> I think several ICH datasheet documents mention this. Right now I'm
>> looking at the ICH10 one (319973-003), section 13.6.1 ("I/O Register
>> Address Map" under "Real Time Clock Registers").
> 
> Thanks, I had to fetch this from elsewhere as I haven't been able to
> find it on the Intel documentation site, maybe it's too old?
> 
>> But such aliasing (really: lack of decoding) has been present on
>> various of the low 1024 ports from the very early days of x86. So we
>> may want to take care of such elsewhere as well, e.g. for the PIC
>> (where aforementioned doc also explicitly mentions the aliases).
> 
> I wonder how relevant those aliases are for OSes, do we know of any OS
> that uses them?
> 
> For example we don't seem to provide them to HVM guests at all, and we
> seem to get away with it.

There are two aspects here: One is the functionality that becomes available
specifically via using the aliases here (and I'm not 100% certain this isn't
chipset dependent in the first place), allowing access to the full 256 bytes
of CMOS storage (i.e. no parts clipped off for the RTC registers). The other
aspect is simply disallowing access to ports we mean Dom0 to not have access
to. That would be the sole purpose e.g. for the PIC port ranges. Otherwise
there's little point disallowing access to the base ranges, imo.

>>>> Also stop intercepting accesses to the CMOS ports if we won't ourselves
>>>> use the CMOS RTC.
>>>
>>> Could this create any concerns with the ability to disable NMIs if we
>>> no longer filter accesses to the RTC?
>>
>> Hmm, that's a valid concern, but I'm not sure in how far we need to
>> be worried about giving Dom0 this level of control. As long as we
>> don't use it ourselves of course (I'm unaware of us using this
>> anywhere). If we're worried, we could continue to intercept port
>> 0x70 alone, just to mask off the top bit for writes.
> 
> I would be mostly worried about dom0 disabling NMI and thus causing
> the Xen watchdog to trigger for example.  I don't think we should
> allow dom0 to disable NMIs at all.

I'll see what I can do, preferably without keeping the intercepts fully
engaged.

Jan

