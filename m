Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E651B943
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321584.542628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmW2g-0001xF-Hm; Thu, 05 May 2022 07:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321584.542628; Thu, 05 May 2022 07:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmW2g-0001uS-Eh; Thu, 05 May 2022 07:36:54 +0000
Received: by outflank-mailman (input) for mailman id 321584;
 Thu, 05 May 2022 07:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7gz=VN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1nmW0d-0007CX-88
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:34:47 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5fab755-cc45-11ec-a406-831a346695d4;
 Thu, 05 May 2022 09:34:46 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id s14so3634224plk.8
 for <xen-devel@lists.xenproject.org>; Thu, 05 May 2022 00:34:46 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 i8-20020a170902c94800b0015e8d4eb24dsm771036pla.151.2022.05.05.00.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 00:34:44 -0700 (PDT)
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
X-Inumbo-ID: d5fab755-cc45-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l2DlLsy5lkQbdWfeVmn+2WmrzKLcTz2JsLkufshoHHo=;
        b=fP/bHM4G4SEDaKwTRzXjiKwoxlD/tQN3YNJdy82WGNRCrXey5PTWiZRyhoScm9pd/0
         ZFH5r/1Rg46N1c0ywEKTRUimv5GywiD00mGhaPdFjWMgzPW0Rq6pkxf5V0E06l7P8GAC
         0B+ikUPZNBg/+OOUqJEMPp/uNTZ+INYkeaeiH62pv+YpzdCb/Ed7f99UvWR8QPW/MyOy
         G57FGANXxV8ZU5IIjonLEjdnWmmM/0mIgIY8KE5LTMe2I12QKRGoZiygEGT4aTz3zQ9b
         Vj1B4bBykjRXYTgW1JfbJp2LexYAFeP/Dv8THNQfZDCi1UWf8wfGugT+UpFiEOOVCvh8
         D2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l2DlLsy5lkQbdWfeVmn+2WmrzKLcTz2JsLkufshoHHo=;
        b=N/EeCAvtqDquXY0MjID5+R6wSRE8yJmENnef/EqiRuHYQwVaX7LFhXmSCpumId1BXb
         Ji0UoFX43NI9S7TF6UOHxRi0qBL9JNyvwIBBvw3Y7q11VKH/b9mA1hljC9p/EF+ttWwR
         uKLD11MQrXaDtcANbwWHEpjb2pW2jR+NkMtSVHxOI9XQVxRTD0M+RyPYrhtLNbrtsV6L
         IOLjHtERW7K65Z+TBfTt5+DbeehC64mv3iyqORdlZMmAzZ5EEl5dIb3vmVH3ygEsGu82
         4WZcf4gOLvueVjmR+1OpGpj0z8XoOYkYBZvVUPbWoDx0E3knOaqsyi5hDD7af6e5GQUj
         aRDg==
X-Gm-Message-State: AOAM532cGf45eF0CPifip2dH/bO3FjnxOKieRJ8kHR473bvxGMe3gnFT
	0p8EnCukNxrt+hoOfHh0bv23YQ==
X-Google-Smtp-Source: ABdhPJzr2ScpVn9pQo1AkF0WETnQpxMNZnnGzwXkg8yJZCMlm3RXGXbpTH1HxLCmB8FbvfQo1Hg0iA==
X-Received: by 2002:a17:902:ecc8:b0:15e:b5d3:2687 with SMTP id a8-20020a170902ecc800b0015eb5d32687mr12680367plh.164.1651736085128;
        Thu, 05 May 2022 00:34:45 -0700 (PDT)
Date: Thu, 5 May 2022 13:04:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr <olekstysh@gmail.com>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: Virtio on Xen with Rust
Message-ID: <20220505073442.io6ojvmstmn6e6xc@vireshk-i7>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
 <20220429034808.dr647727dphnx6zk@vireshk-i7>
 <f9aeb25d-ba47-ec1f-d157-fa51ec23fdb5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9aeb25d-ba47-ec1f-d157-fa51ec23fdb5@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52

On 29-04-22, 13:44, Oleksandr wrote:
> On 29.04.22 06:48, Viresh Kumar wrote:
> > What should I do about these patches ? Send them to xen list ? I can at least
> > send the stuff which doesn't depend on your series ?
> 
> Below my understanding, which might be wrong)
> 
> 
> I think, the best case scenario - is to try to get these features
> upstreamed. I expect a possible interest to virtulized I2C/GPIO devices on
> Xen,
> especially in embedded environment where the passthrough of dedicated
> I2C/GPIO controller to the guest is not possible for some reason (clocks,
> pins, power domains, etc).
> But I do understand it most likely takes some time. If upsteaming this stuff
> is not your primary target, then I think, such patch series deserves to be
> sent to the Xen mailing list anyway for someone who is interested in the
> topic to give it a try. For example, you can send RFC version saying in
> cover letter that it depends on non-upsteamed yet stuff to start discussion.

I have sent the patchset to xen list. Thanks.

-- 
viresh

